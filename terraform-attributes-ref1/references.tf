provider "aws" {
  region     = "us-west-2"
  access_key = "AKIA45U5ZSQCINWCWSSA"
  secret_key = "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"
  version = "~>2.7"
}

resource "aws_instance" "myec2" {
  ami = "ami-0e34e7b9ca0ace12d"
  instance_type = var.instancetype
}

resource "aws_eip" "lb" {
  vpc      = true
}



resource "aws_eip_association" "eip_assoc" {
    instance_id = aws_instance.myec2.id
    allocation_id = aws_eip.lb.id
}

resource "aws_security_group" "allow_tls" {
  name        = "myec2_security_group"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32",var.vpn_ip]
  }


}
