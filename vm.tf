provider "aws" {
    access_key = "AKIA36IXPC6U4SVN3XOR"
    secret_key = "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"
    region = "us-west-2"
}

resource "aws_instance" "name3" {
    ami = "ami-003634241a8fcdec0"
    instance_type = "t2.micro"
}
