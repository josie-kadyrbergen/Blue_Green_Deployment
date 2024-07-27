# Blue_Green_Deployment

```hcl
module "Deployment" {
    source = "josie-kadyrbergen/Deployment/BG"
    version = "2.0.0"
    region = "us-east-2"
    vpc_cidr = "10.0.0.0/16"
    subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    ami = "ami-00db8dadb36c9815e"
    instance_type = "t2.micro"
    ports = [80, 443, 8080]
}
```