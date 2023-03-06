resource "aws_vpc" "allinone-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "allinone-vpc"
  }
}

resource "aws_subnet" "allinone-subnet" {
    vpc_id = aws_vpc.allinone-vpc.id
    cidr_block = var.subnet_cidr
    availability_zone = var.subnet_az
    
    tags = {
        Name = "allinone-subnet"
    }
}

resource "aws_internet_gateway" "allinone-igw" {
  vpc_id = aws_vpc.allinone-vpc.id

  tags = {
        Name = "app-igw"
  }
}

resource "aws_route_table" "allinone-igw-route" {
    vpc_id = aws_vpc.allinone-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.allinone-igw.id
    }

    tags = {
        Name = "allinone-igw-route"
    }
}

resource "aws_main_route_table_association" "allinone-igw-route" {
    vpc_id = aws_vpc.allinone-vpc.id
    route_table_id = aws_route_table.allinone-igw-route.id
}