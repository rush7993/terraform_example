
variable "project_name" {
    default = "lecture"
}

variable "env" {
    default = "dev"
}

variable "vpc_name" {
  type = string
  description = "vpc 의 이름을 지정합니다"
  default = "lecture_vpc"
}

variable "instance_count" {
  type = number
  description = "생성할 인스턴스의 갯수입니다"
  default = 3
}

variable "avail_zones" {
  type = list(string)
  description = "사용할 가용영역 리스트입니다"
  default = [ "ap-northeast-2a", "ap-northeast-2c", "ap-northeast-2d" ]
}

variable "common_tags" {
    type = map(string)
    description = "모든 리소스에 공통으로 붙일 태그들"
    default = {
      "env" = "dev"
      project = "terraform-study"
      owner = "kim"
    }
  
}

output "debug01_project_name" {
  value = var.project_name
}

output "debug02_env" {
  value = var.env
}

output "debug03_info" {
  value = "프로젝트명 : ${var.project_name} , 환경: ${var.env} "
}

output "debug04_vpc_name" {
    value = "vpc 이름 : ${var.vpc_name}"
}

output "debug04_count" {
  value = "인스턴스 count : ${var.instance_count}"
}

output "debug06_list_all" {
    value = join(",", var.avail_zones)
}

output "debug07_map_value" {
  value = "프로젝트 환경은 ${var.common_tags.env}입니다"
}

output "debug07_map_value2" {
  value = "프로젝트 환경은 ${var.common_tags["owner"]}입니다"
}