resource "aws_alb" "web_app" {
  name            = var.name
  internal        = var.internal
  subnets         = var.subnets
  security_groups = var.security_groups

  tags = var.tags
}

resource "aws_alb_listener" "http" {
  load_balancer_arn = aws_alb.web_app.arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.app_targets.arn
  }
}

resource "aws_alb_target_group" "app_targets" {
  name     = var.target_group_name
  port     = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id   = var.vpc_id

  health_check {
    path                = var.health_check_path
    port                = var.health_check_port
    protocol            = var.health_check_protocol
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout             = var.timeout
    interval            = var.interval
  }

  tags = var.tags
}

resource "aws_alb_target_group_attachment" "ec2_instance" {
  target_group_arn = aws_alb_target_group.app_targets.arn
  target_id        = var.ec2_instance_id
  port             = var.target_group_port
}