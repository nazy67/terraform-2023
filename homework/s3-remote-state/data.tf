data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "state_policy_document" {
  statement {
    sid = "RemoteStatePolicy"

    actions = [
      "s3:GetObject",
      "s3:PutObject",
    ]

    resources = [
      "${aws_s3_bucket.akumo-remote-state.arn}/*",
    ]

    principals {
        type = "AWS"
        identifiers = ["arn:aws:iam::598014893957:role/test-user"]
    }
  }

  statement {
    actions = [
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.akumo-remote-state.arn,
    ]

    principals {
        type = "AWS"
        identifiers = ["arn:aws:iam::598014893957:role/test-user"]
    }
  }
}