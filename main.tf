####################PROVIDER##################
provider "aws" {
region = "us-east-2"
access_key = "AKIAZBCAMP7O75P4J2ML"
secret_key = "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"
}
####################EC2 INSTANCE##################
resource "aws_instance" "abc" {
ami = "ami-0231217be14a6f3ba"
instance_type = "t2.micro"
availability_zone = "us-east-2a"
key_name = "Ohio"

}
