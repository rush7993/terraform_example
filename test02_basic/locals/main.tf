
locals {
  resource_name = "${var.project_name}-${var.env}-file"
}

resource "local_file" "example" {
  filename = "${path.module}/${local.resource_name}"
  content = "현재상황은 ${var.env}입니다"
}