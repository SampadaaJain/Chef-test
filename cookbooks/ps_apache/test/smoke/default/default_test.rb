describe aws_security_group('sg-02949d86e16bsagee') do
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


describe aws_cloudwatchlogs_destination(destination_name_prefix: "appropriate_location") do
  it { should exist }
end

aws_ebs_volumes.volume_ids.each do |volume_id|
 describe aws_ebs_volumes do
  it { should be_encrypted }
 end
end

aws_rds_instances.db_instance_identifiers.each do |db_instance_identifier|
  describe aws_rds_instance(db_instance_identifier) do
    it { should be_encrypted }
  end
end
