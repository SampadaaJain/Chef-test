describe aws_security_group('sg-0f607258430a415af') do
	it { should allow_out_only(port: 443, ipv4_range: '0.0.0.0/0') }
end

describe aws_cloudtrail_trail('watch1') do
  it { should be_log_file_validation_enabled }
end

aws_s3_buckets.bucket_names.each do |bucket_name|
  if aws_s3_bucket(bucket_name: bucket_name).region == region
    describe aws_s3_bucket(bucket_name) do
      it { should have_versioning_enabled }
     end
  end
end


aws_ebs_volumes.volume_ids.each do |volume_id|
 describe aws_ebs_volumes do
  it { should be_encrypted }
 end
end
