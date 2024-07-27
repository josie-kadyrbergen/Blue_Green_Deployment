resource "aws_instance" "blue_group_4" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = element(aws_subnet.group_4.*.id, 0)
  vpc_security_group_ids = [aws_security_group.group_4.id]

  tags = {
    Name = "Blue Group"
  }
}

resource "aws_instance" "green_group_4" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = element(aws_subnet.group_4.*.id, 1)
  vpc_security_group_ids = [aws_security_group.group_4.id]

  tags = {
    Name = "Green Group"
  }
}
