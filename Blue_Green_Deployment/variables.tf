variable region {
  description = "AWS region"
  type = string
  default = "us-east-2"
}

variable vpc_cidr {
  description = "VPC CIDR block"
  type = string
  default = "10.0.0.0/16"
}

variable subnet_cidrs {
  description = "List of subnet CIDRs"
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable ami {
  description = "AMI ID"
  type = string
  default = "ami-00db8dadb36c9815e"
}

variable instance_type {
  description = "EC2 instance type"
  type = string
  default = "t2.micro"
}

variable ports {
  description = "Security group ports"
  type = list(number)
  default = [80, 443, 8080]
}



