####################PROVIDER##################
provider "aws" {
region = "us-east-1"
access_key = ""
secret_key = ""
}
####################EC2 INSTANCE##################
resource "aws_instance" "abc" {
ami = "ami-0231217be14a6f3ba"
instance_type = "t2.micro"
availability_zone = "us-east-1a"
key_name = "nver"

