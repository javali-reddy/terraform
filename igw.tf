resource "aws_internet_gateway" "custom-igw" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "custom-igw"
  }
}