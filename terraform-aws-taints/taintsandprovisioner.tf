provider "aws" {
  region     = "us-west-2"
  access_key = "AKIA45U5ZSQCINWCWSSA"
  secret_key = "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"
  version = "~>2.7"
}

resource "aws_instance" "myec2" {
  ami = "ami-0e34e7b9ca0ace12d"
  instance_type = "t2.micro"
  key_name = "myec2keypair"

  provisioner "local-exec" {
    command = "echo ${aws_instance.myec2.private_ip} > privateip.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx"
    ]
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("./myec2keypair.pem")
    host = self.public_ip
  }
}
