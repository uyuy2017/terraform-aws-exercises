variable "sg_ports" {
  default = [9090,80]
}

resource "aws_security_group" "dynamicsg" {
    name = "dynamic-sg"
    description = "Ingress for vault"

    dynamic "ingress" {
      for_each = var.sg_ports
      iterator = port
      content {
        from_port = port.value
        to_port = port.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    }

    dynamic "egress" {
      for_each = var.sg_ports
      iterator = port
      content {
        from_port = port.value
        to_port = port.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    }
}
