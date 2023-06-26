resource "aws_s3_bucket" "remote-state" {
    bucket = var.bucket_name
    tags = merge (
        local.common_tags,
    {
        Name = "remote-state-terraform-${var.env}-june-2023"
    }
    ) 
}

resource "aws_s3_bucket_versioning" "remote-state-versioning" {
  bucket = aws_s3_bucket.remote-state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "sse-remote-state" {
  bucket = aws_s3_bucket.remote-state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

resource "aws_s3_bucket_policy" "state_policy" {
  bucket = aws_s3_bucket.remote-state.id
  policy = data.aws_iam_policy_document.state_policy_document.json
}

data "aws_iam_policy_document" "state_policy_document" {
  statement {
    sid = "RemoteStatePolicy"

    actions = [
      "s3:GetObject",
      "s3:PutObject",
    ]

    resources = [
      "aws_s3_bucket.remote-state.arn/*",
    ]

    principals {
        type = "AWS"
        identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/tf-user"]
    }
  }

  statement {
    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "aws_s3_bucket.remote-state.arn",
    ]

    principals {
        type = "AWS"
        identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/tf-user"]
    }
  }
}