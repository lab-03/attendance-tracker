require "shrine"
require "shrine/storage/s3"


s3_options = { 
  bucket:            "", 
  access_key_id:     "",
  secret_access_key: "",
  region:            "eu-west-2",
}
 
Shrine.storages = { 
  cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
  store: Shrine::Storage::S3.new(**s3_options)
}

Shrine.plugin :activerecord           # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data    # extracts metadata for assigned cached files
