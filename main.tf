terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}

provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"
}

provider "aws" {
  alias  = "us-east"
  region = "us-east-1"
}

resource "aws_instance" "mumbai_instance" {
  provider      = aws.mumbai
  ami          = "ami-00bb6a80f01f03502"   
  instance_type = "t2.micro"

  tags = {
    Name = "Mumbai Server"
  }
}

resource "aws_instance" "useast_instance" {
  provider      = aws.us-east
  ami          = "ami-0c7217cdde317cfec"   
  instance_type = "t2.micro"

  tags = {
    Name = "US-East Server"
  }
}
