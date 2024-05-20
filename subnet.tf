resource "aws_subnet" "public_web_subnet" {
  vpc_id     = aws_vpc.custom_vpc
  cidr_block = var.public_cidr[count.index]
  availability_zone = var.az[count.index]
  count=2

  tags = {
    Name = "public-web-subnet-[count.index]"
  }
}