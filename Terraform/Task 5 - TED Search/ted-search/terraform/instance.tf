resource "aws_instance" "allinone" {
    ami                             = var.ami_id
    instance_type                   = var.instance_type
    subnet_id                       = aws_subnet.allinone-subnet.id
    associate_public_ip_address     =  var.associate_public_ip_address
    key_name                        = var.key_name
    iam_instance_profile            = var.iam_instance_profile
    vpc_security_group_ids = [
        aws_security_group.allinone.id
    ]
    tags = {
        name = var.allinone_tag
    }
}

resource "null_resource" "copy_files_to_server" {
    connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file("../ted-search-key.pem")
        host = aws_instance.allinone.public_ip   
    }

    provisioner "file" {
        source = "../docker-compose.yaml"
        destination =  "~/docker-compose.yaml"
    }

    provisioner "file" {
        source = "../nginx.conf"
        destination =  "~/nginx.conf"
    }

    provisioner "file" {
        source = "../app/src/main/resources/static/"
        destination =  "~/"
    } 
}

resource "null_resource" "deploy" {
  depends_on = [
    null_resource.copy_files_to_server
  ]
  connection {
    type = "ssh"
        user = "ec2-user"
        private_key = file("../ted-search-key.pem")
        host = aws_instance.allinone.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y docker",
      "sudo service docker start",
      "docker login -u AWS -p $(aws ecr get-login --region eu-west-2) 425081300547.dkr.ecr.eu-west-2.amazonaws.com/ted-search",
      "sudo docker pull 425081300547.dkr.ecr.eu-west-2.amazonaws.com/ted-search:1.1-SNAPSHOT",
      "sudo docker tag 425081300547.dkr.ecr.eu-west-2.amazonaws.com/ted-search:1.1-SNAPSHOT ted-search:1.1-SNAPSHOT",
      "curl -SL https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-$(uname -s)-$(unamw -m) -o /usr/local/bin/docker-compose",
      "sudo chmod +x /usr/local/bin/docker-compose",
      "sudo docker-compose up -d"
    ]
  }
}