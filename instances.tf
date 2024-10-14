resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_instance" "my_instance" {
  ami           = "ami-00b1dcc8d3eab4fdb"
  instance_type = "t2.micro"
  subnet_id     = "subnet-09ea20eaa464826a5"
  tags = {
    Name = "MyInstance"
  }
}