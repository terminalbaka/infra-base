data "terraform_remote_state" "infra-aws" {
  backend = "s3"
  config = {
    bucket = var.remoteStateBucketName
    key = "infra.tfstate"
    region = var.remoteStateBucketRegion
  }
}