/*module "ec2module" {
  source = "../../modules/ec2"
  instance_type="t2.large"
}*/
module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.13.0"
  name                   = "my-cluster"
 instance_count         = 1

 ami                    = "ami-0e34e7b9ca0ace12d"
 instance_type          = "t2.micro"
 subnet_id              = "subnet-517a8629"

 tags = {
   Terraform   = "true"
   Environment = "dev"
 }
}
