resource "aws_security_group" "allinone" {
  name = "allinone-instance-sg"
  description = "AWS sg for allinone instance"
  vpc_id = aws_vpc.allinone-vpc.id

  ingress {
    description = "Allow port 80 from all IPs"
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress  {
    description = "Allow SSH from all IPs"
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress  {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allinone-instance-sg"
  }
}

