terraform {
  required_version = "0.14.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }
}
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA3FLDYSW4VESXPXFR"
  secret_key = "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"
}
