resource "aws_alb" "web_app" {
  name            = "aws-grocery-alb"
  internal        = false
  subnets         = slice(data.aws_subnets.default.ids, 0, 2)
  security_groups = [aws_security_group.alb_sg.id]
  tags = {
    Name = "AWS-Grocery-ALB"
  }
}

resource "aws_alb_listener" "http" {
  load_balancer_arn = aws_alb.web_app.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.app_targets.arn
    type             = "forward"
  }
}

resource "aws_alb_target_group" "app_targets" {
  name     = "app-target-group"
  port     = 5000
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id

  health_check {
    path                = "/"
    port                = 5000
    protocol            = "HTTP"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
  }

  tags = {
    Name = "App-Target-Group"
  }
}

resource "aws_alb_target_group_attachment" "ec2_instance" {
  target_group_arn = aws_alb_target_group.app_targets.arn
  target_id        = aws_instance.web_app.id
  port             = 5000
}