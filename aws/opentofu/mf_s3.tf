resource "aws_s3_bucket" "mf_bucket_state" {
  bucket = "movimeto-futuro-state"
}

resource "aws_s3_bucket_versioning" "mf_bucket_state_versioning" {
  bucket = aws_s3_bucket.mf_bucket_state.id
  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [ aws_s3_bucket.mf_bucket_state ]
}

resource "aws_s3_bucket_server_side_encryption_configuration" "mf_bucket_state_encryption" {
  bucket = aws_s3_bucket.mf_bucket_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }

  depends_on = [ aws_s3_bucket.mf_bucket_state ]
}


resource "aws_iam_user" "mf_bucket_stateuser" {
  name = "mf-user-bucket-state"
}

data "aws_iam_policy_document" "mf_s3_full_access_policy_doc" {
  statement {
    effect = "Allow"
    actions = [
      "s3:ListBucket",
    ]
    resources = [
      aws_s3_bucket.mf_bucket_state.arn,
    ]
  }
  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
    ]
    resources = [
      "${aws_s3_bucket.mf_bucket_state.arn}/*",
    ]
  }
}

# Cria a política IAM a partir do documento JSON.
resource "aws_iam_policy" "s3_full_access_policy" {
  name        = "S3FullAccessPolicy-${aws_s3_bucket.mf_bucket_state.id}"
  description = "Política que concede acesso total a um bucket S3 específico."
  policy      = data.aws_iam_policy_document.mf_s3_full_access_policy_doc.json

  depends_on = [
    aws_s3_bucket.mf_bucket_state,
    aws_iam_user.mf_bucket_stateuser
   ]
}

# Anexa a política criada ao usuário IAM.
resource "aws_iam_user_policy_attachment" "user_policy_attach" {
  user       = aws_iam_user.mf_bucket_stateuser.name
  policy_arn = aws_iam_policy.s3_full_access_policy.arn

  depends_on = [
    aws_s3_bucket.mf_bucket_state,
    aws_iam_user.mf_bucket_stateuser,
    aws_iam_policy.s3_full_access_policy
   ]
}
