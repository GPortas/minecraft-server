resource "aws_security_group" "ec2_instance_sg" {
  name        = "${local.project_name}-instance-sg"
  description = "${local.project_name} instance security group."
}

resource "aws_security_group_rule" "ec2_instance_sg_rule_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.ec2_instance_sg.id}"
}

resource "aws_security_group_rule" "ec2_instance_sg_rule_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.ec2_instance_sg.id}"
}

resource "aws_instance" "ec2_instance" {
  ami             = "${var.instance_ami}"
  instance_type   = "${var.instance_type}"
  key_name        = "${var.instance_key_name}"
  security_groups = ["${aws_security_group.ec2_instance_sg.name}"]

  tags = {
    Name = "${local.project_name}-instance"
  }
}
