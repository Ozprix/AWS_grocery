variable "name" {
  description = "ALB name"
  type        = string
}

variable "internal" {
  description = "Is ALB internal?"
  type        = bool
  default     = false
}

variable "subnets" {
  description = "Subnet IDs for ALB"
  type        = list(string)
}

variable "security_groups" {
  description = "Security group IDs for ALB"
  type        = list(string)
}

variable "listener_port" {
  description = "Listener port"
  type        = number
  default     = 80
}

variable "listener_protocol" {
  description = "Listener protocol"
  type        = string
  default     = "HTTP"
}

variable "target_group_name" {
  description = "Target group name"
  type        = string
}

variable "target_group_port" {
  description = "Target group port"
  type        = number
}

variable "target_group_protocol" {
  description = "Target group protocol"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for target group"
  type        = string
}

variable "health_check_path" {
  description = "Health check path"
  type        = string
  default     = "/"
}

variable "health_check_port" {
  description = "Health check port"
  type        = string
  default     = "traffic-port"
}

variable "health_check_protocol" {
  description = "Health check protocol"
  type        = string
  default     = "HTTP"
}

variable "healthy_threshold" {
  description = "Healthy threshold"
  type        = number
  default     = 2
}

variable "unhealthy_threshold" {
  description = "Unhealthy threshold"
  type        = number
  default     = 2
}

variable "timeout" {
  description = "Health check timeout"
  type        = number
  default     = 3
}

variable "interval" {
  description = "Health check interval"
  type        = number
  default     = 30
}

variable "ec2_instance_id" {
  description = "EC2 instance ID to attach to target group"
  type        = string
}

variable "tags" {
  description = "Tags for ALB resources"
  type        = map(string)
  default     = {}
}