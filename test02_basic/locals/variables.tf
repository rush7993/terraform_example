
#변수라기 보단 상수
variable "env" {
  type = string
  description = "현재 환경(dev | prod)"
}

variable "project_name" {
  type = string
  description = "프로젝트 이름"
}