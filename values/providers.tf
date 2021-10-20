terraform {
  required_version =">= 1.0.5" # see https://releases.hashicorp.com/terraform/1.0.5/ 
}

provider "aws" {
  region = "us-west-2"
}
