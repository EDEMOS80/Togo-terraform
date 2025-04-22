output "vpc_id" {
  value = data.aws_vpc.vpc.id
}

output "subnet-1" {
  value = data.aws_subnet.subnet-1.id
}


output "aws_ami" {
  value = var.aws_ami
}