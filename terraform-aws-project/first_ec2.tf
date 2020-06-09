provider "aws" {
  region     = "us-west-2"
  version = "~>2.7"
}

resource "aws_instance" "myec2" {
  ami = "ami-0e34e7b9ca0ace12d"
  instance_type = "t2.micro"
}
