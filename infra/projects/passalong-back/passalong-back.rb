require 'digest'

project = project('howdoicomputer', 'passalong-back') {
  environments 'staging'
}

project.resource('aws_s3_bucket', 'passalong-back-config') {
  bucket 'passalong-back-config'
  acl    'private'

  tags {
    Name 'passalong-back-config'
  }
}

secrets_source = "#{Dir.pwd}/projects/passalong-back/files/secrets.json"
secrets_digest = Digest::MD5.file(secrets_source)
project.resource('aws_s3_bucket_object', 'passalong-back-config') {
  bucket     'passalong-back-config'
  key        'secrets.json'
  source     secrets_source
  etag       secrets_digest
}

project.resource('aws_db_instance', 'passalong') {
  allocated_storage 5
  storage_type         'gp2'
  engine               'postgres'
  engine_version       '9.6.2'
  identifier           'passalong-db'
  name                 'passalong'
  username             'passalong'
  password             'passalong'
  instance_class       'db.t2.micro'
  db_subnet_group_name 'default-vpc-e3dbac87'
  skip_final_snapshot  true
}
