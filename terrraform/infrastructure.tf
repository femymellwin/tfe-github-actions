resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "your-unique-terraform-state-bucket-2025-06-07"  # Change to unique globally
  acl    = "private"

  tags = {
    Name        = "TerraformStateBucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "tf_state_bucket_versioning" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
