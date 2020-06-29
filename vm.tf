provider "aws" {
    access_key = ""
    secret_key = ""
    region = "us-west-2"
}

resource "aws_instance" "name3" {
    ami = "ami-003634241a8fcdec0"
    instance_type = "t2.micro"
}
