resource "aws_s3_bucket" "terraform_state" {
  # Needs to be globally unique across all AWS
  bucket = "reet-terraform-state"

  # Prevent accidental deletion of this bucket
  lifecycle {
    prevent_destroy = true
  }

  # Revision history of all our state files
  versioning {
    enabled = true
  }

  # Enable SSE by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name = "reet-terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}