resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-north-1a"
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0591e1c6a24d08458"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.my_subnet.id
  tags = {
    Name = "MyInstance"
  }
}