provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  required_version = ">= 0.13.0"
  backend "s3" {
    // bucket名はよしなに変更してください
    bucket = "hxrxchang-terraform-state"
    key = "ecspresso-example"
  }
}
