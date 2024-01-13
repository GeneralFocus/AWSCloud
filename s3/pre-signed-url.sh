# Generate a presigned URL for an S3 object with the default expiration time and specified region
aws s3 presign s3://mybucket/myobject --region my-region

# Generate a presigned URL for an S3 object with a custom expiration time (e.g., 300 seconds) and specified region
aws s3 presign s3://mybucket/myobject --expires-in 300 --region my-region

# If you encounter issues with presigned URLs for encrypted files, set the proper signature version to avoid problems
# This command ensures the use of Signature Version 4 (s3v4) for generating URLs
aws configure set default.s3.signature_version s3v4
