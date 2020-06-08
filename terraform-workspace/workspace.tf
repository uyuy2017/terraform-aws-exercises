provider "aws" {
  region     = "us-west-2"
  access_key = "AKIA45U5ZSQCINWCWSSA"
  secret_key = "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"
  version = "~>2.7"
}

resource "aws_instance" "myinstance" {
    ami = "ami-0e34e7b9ca0ace12d"
    instance_type = lookup(var.instance_type,terraform.workspace)
}

variable "instance_type" {
  type = map

  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prod    = "m4.karge"
  }
}
