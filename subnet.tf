resource "aws_subnet" "public_web_subnet" {
  vpc_id     = aws_vpc.custom_vpc.id
  cidr_block = var.public_cidr[count.index]
  availability_zone = var.az[count.index]
  count=2

  tags = {
    Name = "public-web-subnet-${count.index}"
  }
}

resource "aws_subnet" "private_app_subnet" {
  vpc_id     = aws_vpc.custom_vpc.id
  cidr_block = var.private_cidr[count.index]
  availability_zone = var.az[count.index]
  count=2

  tags = {
    Name = "private-app-subnet-${count.index}"
  }
}

resource "aws_subnet" "private_db_subnet" {
  vpc_id     = aws_vpc.custom_vpc.id
  cidr_block = var.var.db_cidr[count.index]
  availability_zone = var.az[count.index]
  count=2

  tags = {
    Name = "private-db-subnet-${count.index}"
  }
}