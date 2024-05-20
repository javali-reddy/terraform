resource "aws_instance" "public_web_servers" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name = "infra_key"
  subnet_id = aws_subnet.public_web_subnet[count.index].id
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  associate_public_ip_address = true
  count=2

  provisioner "file" {
    source = "./infra_key.pem"
    destination = "/home/ec2-user/infra_key.pem"
  
    connection {
      type = "ssh"
      host = self.public_ip
      user = "ec2-user"
      private_key = "${file("/home/ec2-user/infra_key.pem")}"
    }  
  }
  

  tags = {
    Name = "public-web-${count.index}"
  }
}