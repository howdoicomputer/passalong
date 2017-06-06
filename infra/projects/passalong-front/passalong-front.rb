require 'json'

project = project('howdoicomputer', 'passalong-front') {
  environments 'staging'
}

local_path = File.dirname(__FILE__)

project.resource('aws_s3_bucket', 'passalong-front') {
  bucket 'passalong-front'
  acl    'private'

  website {
    index_document 'index.html'
    error_document 'index.html'
  }

  policy File.read("#{local_path}/files/policy.json")

  tags {
    Name 'passalong-front'
  }
}
