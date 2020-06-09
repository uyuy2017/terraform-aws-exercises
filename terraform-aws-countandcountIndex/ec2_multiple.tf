provider "aws" {
  region     = "us-west-2"
  version = "~>2.7"
}

variable "tags" {
  type=list
  default = ["firstec2","secondec2"]
}

locals {
  common_tags = {
    Owner="Karun"
    service="backend"
  }
  time = formatdate("DD MMM YYYY hh:mm ZZZ",timestamp())
}

resource "aws_instance" "myec2" {
  ami = "ami-0e34e7b9ca0ace12d"
  instance_type = "t2.micro"
  count = var.istest == true ? 2 : 0
  tags={ Name = element(var.tags,count.index)}
}
variable "elb_names" {
  type = list
  default = ["dev-loadbalancer","stage-loadbalancer"]
}

variable "istest" {

}

resource "aws_iam_user" "lb" {
  name = var.elb_names[count.index]
  count=var.istest==true? 1 : 2
  path="/system/"
  tags=local.common_tags
}

output "timestamp" {
  value = local.time
}
