variable target_group_name {
  description = "Target group name"
  type = string
  default = "tg"
}

locals {
  target_groups = [
    "green",
    "blue",
  ]
}

resource "aws_lb_target_group" "tg" {
  count = length(local.target_groups)

  name = "${var.target_group_name}-${element(local.target_groups, count.index)}"
  port = 443
  protocol = "HTTP"
  target_type = "instance"
  vpc_id = aws_vpc.group_4.id
  health_check {
    matcher = "200,301,302,404"
    path    = "/"
  }
}
