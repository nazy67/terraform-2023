resource "aws_s3_bucket" "my-bucket" {
  bucket   = var.test == true ? "dev" : "prod"
}



# data "aws_iam_policy_document" "kms-key" {

#   dynamic "statement" {
#     for_each = var.key_statements

#     content {
#       sid           = try(statement.value.sid, null)
#       actions       = try(statement.value.actions, null)
#       effect        = try(statement.value.effect, null)
#       resources     = try(statement.value.resources, null)

#       dynamic "principals" {
#         for_each = try(statement.value.principals, [])

#         content {
#           type        = principals.value.type
#           identifiers = principals.value.identifiers
#         }
#       }
#     }
#   }
# }


  # key_statements = [
  #   {
  #     sid = "CloudWatchLogs"
  #     actions = [
  #       "kms:Encrypt*",
  #       "kms:Decrypt*",
  #       "kms:ReEncrypt*",
  #       "kms:GenerateDataKey*",
  #       "kms:Describe*"
  #     ]
  #     resources = ["*"]

  #     principals = [
  #       {
  #         type        = "Service"
  #         identifiers = ["logs.amazonaws.com"]
  #       }
  #     ]
  #   }
  # ]