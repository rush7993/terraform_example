

variable "member1" {
    type = object({
        num = number
        name = string
        is_man = bool
    })
    description ="회원 한명의 정보입니다"

    default ={
        num = 1
        name = "kim"
        is_man = true
    }
}

variable "bucket_config" {
    type = object ({         
        name = string
        region = optional(string, "ap-northeast-2")
        versioning = optional(bool, false)
    })
    description ="bucket 기본 설정값입니다"

    default ={
        name = "s3 bucket 입니다"
        is_man = true
    }
}

output "debug01" {
  value = "${var.member1.num}"
  
}

output "debug02" {
  value = "${var.bucket_config}"
  
}

