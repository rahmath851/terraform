####################PROVIDER##################
provider "aws" {
region = "us-east-1"
access_key = "AKIAZBCAMP7O3OPP5BYB"
secret_key = "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"
}

####################VPC##################
resource "aws_vpc" "CustomVpc" {
  cidr_block = "10.0.0.0/16"
}
####################IGW##################
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.CustomVpc.id
  tags = {
 Name = "IGW"
  }
}
####################SUBNET##################  
resource "aws_subnet" "sub" {
  vpc_id     = aws_vpc.CustomVpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet1"
  }
}
####################route table ##################   
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.CustomVpc.id

  route = []

  tags = {
    Name = "RTable"
  }
}
####################route##################   
resource "aws_route" "route" {
  route_table_id            = aws_route_table.rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.igw.id
  depends_on                = [aws_route_table.rt]
}
####################security group##################
resource "aws_security_group" "mysg" {
  name        = "allow_traffic"
  description = "Allow All inbound traffic"
  vpc_id      = aws_vpc.CustomVpc.id

  ingress {
    description      = "All Traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = null
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "All Traffic"
  }
}
####################route table association##################
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.sub.id
  route_table_id = aws_route_table.rt.id
}
####################EC2 INSTANCE##################
resource "aws_instance" "abc" {
ami = "ami-08e4e35cccc6189f4"
instance_type = "t2.micro"
availability_zone = "us-east-1a"
key_name = "nver"

}
