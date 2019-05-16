locals {
  project_name = "minecraft-server"
  account_id   = "${data.aws_caller_identity.current.account_id}"
  region       = "${data.aws_region.current.name}"
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}
