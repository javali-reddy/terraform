resource "aws_eip" "custom_eip" {
  domain = "vpc"
  tags = {
    Name="custom eip"
  }
}

resource "aws_nat_gateway" "custom_ngw" {
   subnet_id = aws_subnet.public_web_subnet[0].id
   allocation_id = aws_eip.custom_eip.id
tags = {
    Name="custom ngw"
  }

  depends_on = [ aws_internet_gateway.custom-igw ]
}