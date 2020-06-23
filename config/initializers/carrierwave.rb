CarrierWave.configure do |config|
  config.storage = :qiniu
  # config.cache_storage = :file
  config.qiniu_access_key = ENV["qiniu_access_key"]
  config.qiniu_secret_key = ENV["qiniu_secret_key"]
  config.qiniu_bucket = ENV["qiniu_bucket"]
  config.qiniu_bucket_domain = ENV["qiniu_bucket_domain"]
  # config.qiniu_access_key = "ZsIFl2GrsYuBN3_v3Gu2BUTF4TW6LweZyf8OeKxU"
  # config.qiniu_secret_key = "RhNx9N4Q03ELX9uZ_HP9W3uh1APH3DSD9CAgAXB_"
  # config.qiniu_bucket = "jdstore-demo"
  # config.qiniu_bucket_domain = "82p652.s3-cn-east-1.qiniucs.com"
  # config.qiniu_bucket_domain = "cdn.rubyc.cn.qiniudns.com"
  config.qiniu_block_size = 4 * 1024 * 1024
  config.qiniu_protocol = "http"
  # config.qiniu_up_host = "s3-cn-east-1.qiniucs.com"
  config.qiniu_up_host = "http://up-z0.qiniup.com"

end