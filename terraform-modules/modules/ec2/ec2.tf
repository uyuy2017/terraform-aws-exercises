resource "aws_instance" "myec2" {
  ami = "ami-0e34e7b9ca0ace12d"
  instance_type = var.instance_type
}
