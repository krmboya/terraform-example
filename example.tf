provider "aws" {
  profile = "krmboya"
  region  = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  depends_on    = [aws_s3_bucket.example]
}

resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.example.id
}

resource "aws_s3_bucket" "example" {
  bucket = "tf-guide-somerandomsuffixheredjfldjafjdfdjfdlj"
  acl    = "private"
}

resource "aws_instance" "another" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
}
