resource "aws_lb" "app_lb" {
  name = "application-load-balancer"
  load_balancer_type = "application"
  subnets = aws_subnet.group_4[*].id
  idle_timeout = 60
  security_groups = [aws_security_group.group_4.id]
}


resource "aws_alb_listener" "l_80" {
  load_balancer_arn = aws_lb.app_lb.arn
  port = "80"
  protocol = "HTTP"
  default_action {
    type = "redirect"
    redirect {
      port = "443"
      protocol = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_alb_listener" "l_8080" {
  load_balancer_arn = aws_lb.app_lb.id
  port = 8080
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg[1].arn
  }
}

resource "aws_alb_listener" "l_443" {
  load_balancer_arn = aws_lb.app_lb.arn
  port = "443"
  protocol = "HTTPS"
  certificate_arn = "arn:aws:acm:us-east-2:851725464891:certificate/52ae3ee8-8226-401c-89b6-c4a4bdcfa35d"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg[0].arn
  }
  depends_on = [aws_lb_target_group.tg]

  lifecycle {
    ignore_changes = [default_action]
  }
}