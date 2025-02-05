#!/bin/bash

# Set AWS Credentials (Consider using environment variables instead of hardcoding)
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""

# Define required variables
S3_BUCKET=""
CF_DISTRIBUTION_ID=""
DOMAIN=""
S3_REGION=""  # Default is us-east-1, change if needed
S3_DIRECTORY=""  # Default is root directory

# Run Certbot with the S3/CloudFront plugin
certbot --agree-tos -a s3front_auth \
  --s3front_auth-s3-bucket "$S3_BUCKET" \
  --s3front_auth-s3-region "$S3_REGION" \
  --s3front_auth-s3-directory "$S3_DIRECTORY" \
  -i s3front_installer \
  --s3front_installer-cf-distribution-id "$CF_DISTRIBUTION_ID" \
  -d "$DOMAIN"
