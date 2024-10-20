resource "aws_instance" "bastion_host" {
  ami           = "ami-00b1dcc8d3eab4fdb"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "BastionHost"
  }

  key_name = "MyKeyPair"

  security_groups = [aws_security_group.bastion_sg.id]
}

# Группа безопасности для Bastion Host
resource "aws_security_group" "bastion_sg" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["84.15.190.1/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Bastion Security Group"
  }
}
