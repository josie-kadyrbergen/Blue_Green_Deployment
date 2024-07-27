resource "aws_security_group" "group_4" {
  vpc_id = aws_vpc.group_4.id
  name = "application_security_group"
}

resource "aws_security_group_rule" "sg_ingress" {
  count = length(var.ports)
  type = "ingress"
  from_port = var.ports[count.index]
  to_port = var.ports[count.index]
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.group_4.id
} 