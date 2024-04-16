terraform {
  backend "s3" {
    bucket         = "cloudlogic20-tfstate"
    key            = "terraformdemo.tfstate"
    region         = "us-easet-1"
    dynamodb_table = "s3-state-lock"
  }
}
