--- 
driver: 
  availability_zone: us-east-1a
  aws_ssh_key_id: Kitchen-key
  iam_profile_name: apache2-ec2-instance-role-Instanceprofile-1S66AMGC3SAMP
  instance_type: t2.medium
  name: ec2
  region: us-east-1
  retryable_sleep: 60
  retryable_tries: 500
  security_group_ids: 
    - sg-02949d86e16bsagee
  subnet_id: subnet-0513829732sa005sa
  tags: 
    CreatedBy: Kitchen-test
    Name: "test apache server"
    app: webserver
    env: dev
platforms: 
  - 
    driver: 
      block_device_mappings: 
        - 
          device_name: /dev/sda1
          ebs: 
            delete_on_termination: true
      image_id: ami-0029bc9d6egbberda
    name: centos
    transport: 
      ssh_key: "<%=ENV['HOME']%>/.ssh/Kitchen-key.pem"
      username: ec2-user
provisioner: 
  client_rb: 
    ssl_verify_mode: :verify_none
    verify_api_cert: false
  name: "chef zero"
suites: 
  - 
    name: webserver
    runlist: 
      - "reciepe[apache]"
verifier: 
  name: inspec
inspec_tests: 
  path: test/integration