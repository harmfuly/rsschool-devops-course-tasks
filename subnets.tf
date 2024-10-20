resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.2.0/24" # Public Subnet CIDR
  availability_zone = "us-east-1a"
  tags = {
    Name = "Public Subnet 1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.3.0/24" # Public Subnet CIDR
  availability_zone = "us-east-1b"
  tags = {
    Name = "Public Subnet 2"
  }
}

resource "aws_subnet" "public_subnet_3" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.0.0/24" # Public Subnet CIDR
  availability_zone = "us-east-1c"
  tags = {
    Name = "Public Subnet 3"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.6.0/24" # Private Subnet CIDR
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "Private Subnet 1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.5.0/24" # Private Subnet CIDR
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "Private Subnet 2"
  }
}

resource "aws_subnet" "private_subnet_3" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.4.0/24" # Private Subnet CIDR
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = false
  tags = {
    Name = "Private Subnet 3"
  }
}
