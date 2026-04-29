resource "local_file" "ansible_config" {
  filename = "${path.module}/ansible.cfg"
  content = <<-EOF
    [defaults]
    inventory = ./inventory.yml
    host_key_checking = False
  EOF
}

output "debug" {
  value = "ansible 설정 파일 ${local_file.ansible_config.filename}생성이 완료되었습니다."
}