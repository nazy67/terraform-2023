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
      Name = "akumo-terraform-state-${random_pet.s3_name.id}-june-group"
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
      # sse_algorithm     = "AES256"
    }
  }
}

resource "aws_s3_bucket_policy" "state_policy" {
  bucket = aws_s3_bucket.akumo-remote-state.id
  policy = data.aws_iam_policy_document.state_policy_document.json
}

# data "aws_iam_policy_document" "state_policy_document" {
#   statement {
#     sid = "RemoteStatePolicy"

#     actions = [
#       "s3:GetObject",
#       "s3:PutObject",
#     ]

#     resources = [
#       "aws_s3_bucket.akumo-remote-state.arn/*",
#     ]

#     principals {
#       type        = "AWS"
#       identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/tf-user"]
#     }
#   }

#   statement {
#     actions = [
#       "s3:ListBucket",
#     ]

#     resources = [
#       "aws_s3_bucket.remote-state.arn",
#     ]

#     principals {
#       type        = "AWS"
#       identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/tf-user"]
#     }
#   }
# }