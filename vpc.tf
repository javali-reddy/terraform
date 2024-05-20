resource "aws_vpc" "custom_vpc" {
   cidr_block = "172.20.0.0/20"
   tags = {
     Name = "custom-vpc"
   }
}