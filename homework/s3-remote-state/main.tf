module "s3-bucket-kms" {
  source = "../../module/child-modules/kms"

  description             = "kms key for s3 bucket"
  deletion_window_in_days = 7
  enabled                 = true
  enable_key_rotation     = true

}

resource "aws_s3_bucket" "akumo-remote-state" {
  bucket = var.bucket_name
  tags = merge(
    local.common_tags,
    {
      Name = "akumo-${var.env}terraform-state-${random_pet.s3_name.id}"
    }
  )
}

resource "random_pet" "s3_name" {
  length    = 2
  separator = "-"
  prefix    = "akumo"
}

resource "aws_s3_bucket_versioning" "remote-state-versioning" {
  bucket = aws_s3_bucket.akumo-remote-state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "sse-akumo-remote-state" {
  bucket = aws_s3_bucket.akumo-remote-state.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = module.s3-bucket-kms.kms-key-id
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_policy" "state_policy" {
  bucket = aws_s3_bucket.akumo-remote-state.id
  policy = data.aws_iam_policy_document.state_policy_document.json
}