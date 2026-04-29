
variable "info" {
  description = "한 사람의 정보입니다"
  default = {
    num = 1
    name = "kim"
    body ={
        height = 180
        weight = 80
        blood = "O type"
    }
    hobby = ["programming", "piano", "movie"]
  }
}

output "debug01" {
  value = yamlencode({info = var.info})
}

variable "ec2_ip" {
  description = "가상의 EC2 public ip"
  default = "111.111.222.222"
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/inventory.yml"
  content = yamlencode({
    all = {
        hosts = {
            "${var.ec2_ip}" = {
                ansible_user = "ec2-user"
                ansible_ssh_private_key_file = "${path.module}/lecture-key.pem"
            }
        }
    }
  })
}