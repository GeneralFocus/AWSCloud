-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS s3_access_logs_db;

-- Switch to the created database
USE s3_access_logs_db;

-- Create an external table for S3 access logs
CREATE EXTERNAL TABLE IF NOT EXISTS mybucket_logs (
    BucketOwner STRING,
    Bucket STRING,
    RequestDateTime STRING,
    RemoteIP STRING,
    Requester STRING,
    RequestID STRING,
    Operation STRING,
    Key STRING,
    RequestURI_operation STRING,
    RequestURI_key STRING,
    RequestURI_httpProtoversion STRING,
    HTTPstatus STRING,
    ErrorCode STRING,
    BytesSent BIGINT,
    ObjectSize BIGINT,
    TotalTime STRING,
    TurnAroundTime STRING,
    Referrer STRING,
    UserAgent STRING,
    VersionId STRING,
    HostId STRING,
    SigV STRING,
    CipherSuite STRING,
    AuthType STRING,
    EndPoint STRING,
    TLSVersion STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.RegexSerDe'
WITH SERDEPROPERTIES (
    'serialization.format' = '1',
    'input.regex' = '([^ ]*) ([^ ]*) \\[(.*?)\\] ([^ ]*) ([^ ]*) ([^ ]*) ([^ ]*) ([^ ]*) \\\"([^ ]*) ([^ ]*) (- |[^ ]*)\\\" (-|[0-9]*) ([^ ]*) ([^ ]*) ([^ ]*) ([^ ]*) ([^ ]*) ([^ ]*) (\"[^\"]*\") ([^ ]*)(?: ([^ ]*) ([^ ]*) ([^ ]*) ([^ ]*) ([^ ]*) ([^ ]*))?.*$'
)
LOCATION 's3://target-bucket-name/prefix/';

-- Query to analyze the logs by request URI operation and HTTP status
SELECT RequestURI_operation, HTTPstatus, COUNT(*) AS RequestCount
FROM mybucket_logs
GROUP BY RequestURI_operation, HTTPstatus;

-- Query to filter logs with HTTP status code 403 (Forbidden)
SELECT *
FROM mybucket_logs
WHERE HTTPstatus = '403';
