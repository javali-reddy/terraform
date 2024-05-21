resource "aws_security_group" "web-sg" {
    name        = "web-sg"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.custom_vpc.id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
  
}

resource "aws_security_group" "app-sg" {
  name        = "app-sg"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.custom_vpc.id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_security_group.web-sg]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app-sg"
  }
  
}