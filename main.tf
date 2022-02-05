####################PROVIDER##################
provider "aws" {
region = "us-east-2"
access_key = "AKIAZBCAMP7O3OPP5BYB"
secret_key = "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"
}
####################EC2 INSTANCE##################
resource "aws_instance" "abc" {
ami = "ami-0231217be14a6f3ba"
instance_type = "t2.micro"
availability_zone = "us-east-1a"
key_name = "Ohio"

}
