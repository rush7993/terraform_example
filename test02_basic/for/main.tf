
variable "user_list" {
    type = list(string)
    default = [ "alice", "bob", "david", "scott", "json" ]
}

output "debug_user_list" {
  value = [for item in var.user_list : item]
}
output "debug_user_list2" {
  value = [for item in var.user_list : upper(item)]
}

output "debug_user_list3" {
    # 문자열 길이가 4이하 값만 출력
  value = [for item in var.user_list : item if length(item) <=4 ]
}
output "debug_user_list4"{
  value = {for name in var.user_list : name => "IAM-USER-${name}"}
}
output "debug_user_list5"{
  value = [for index,item in var.user_list : "${index+1}번 사용자: ${item}"]
}
output "debug_user_list6"{
  value = {for index,item in var.user_list : index=>item}
}
output "debug_multiline"{
  value = <<-EOF
    #!/bin/bash
    dnf update -y
    dnf install -y nginx
    systemctl enable nginx
    systemctl start nginx
  EOF
}