terraform {
  backend "s3" {
    bucket = "group4-bucket-kaizen"
    key = "ohio/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "lock-state"
  }
}
