provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIA45U5ZSQCINWCWSSA"
  secret_key = "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"
}

data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
resource "aws_instance" "myec2" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t2.micro"

}
