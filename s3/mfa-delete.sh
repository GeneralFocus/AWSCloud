# Step 1: Generate root access keys for the MFA delete demo profile
aws configure --profile root-mfa-delete-demo

# Step 2: Enable MFA delete for the specified S3 bucket
aws s3api put-bucket-versioning \
    --bucket bucket-name \
    --versioning-configuration Status=Enabled,MFADelete=Enabled \
    --mfa "arn-of-mfa-device mfa-code" \
    --profile root-mfa-delete-demo

# Step 3: Disable MFA delete for the specified S3 bucket (if needed)
aws s3api put-bucket-versioning \
    --bucket bucket-name \
    --versioning-configuration Status=Enabled,MFADelete=Disabled \
    --mfa "arn-of-mfa-device mfa-code" \
    --profile root-mfa-delete-demo

# Important: Step 4 - Delete the root credentials in the IAM console!!!
# Ensure to go to the IAM console and delete the root credentials to enhance security.
