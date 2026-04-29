# tf파일을 HCL형식의파일

# 테라폼과 aws 버전 명시
terraform {
  required_version = "~> 1.14"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
    }
  }
}

provider "aws" {
    region = "ap-northeast-2"
}

# vpc 생성
resource "aws_vpc" "test_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true #인스턴스에 dns 이름부여 활성화
    enable_dns_support = true
    tags = {
      Name = "terraform_test_vpc"
    }
}

# 인터넷 게이트웨이
resource "aws_internet_gateway" "igw"{
    vpc_id = aws_vpc.test_vpc.id
    tags = {
      Name = "test_vpc_igw"
    }
}