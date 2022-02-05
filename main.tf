####################PROVIDER##################
provider "aws" {
region = "us-east-1"
access_key = "AKIAZBCAMP7O3OPP5BYB"
secret_key = "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"
}
####################EC2 INSTANCE##################
resource "aws_instance" "abc" {
ami = "ami-08e4e35cccc6189f4"
instance_type = "t2.micro"
availability_zone = "us-east-1a"
key_name = "nver"

}
