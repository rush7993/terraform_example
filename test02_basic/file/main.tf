

locals {
    project_name = "test"
    user_name = "kim"
    setup_content = <<-EOF
        #!/bin/bash
        echo "welcome to ${local.project_name}"
        echo "created by ${local.user_name}"
    EOF
    file_path = "${path.module}/generated_files"
}

resource "local_file" "welcome_msg" {
  filename = "${local.file_path}/welcome.txt"
  content = "안녕하세요! ${local.user_name} 님 by terraform"
}
resource "local_file" "setup_script" {
  filename = "${local.file_path}/setup.sh"
  content = local.setup_content
  file_permission = "0755"
}