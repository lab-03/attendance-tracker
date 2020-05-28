require "shrine"
require "shrine/storage/s3"


s3_options = { 
  bucket:            "gp-user", 
  access_key_id:     "AKIAW5TFS2FLTYUY7KUL",
  secret_access_key: "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",
  region:            "eu-west-2",
}
 
Shrine.storages = { 
  cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
  store: Shrine::Storage::S3.new(**s3_options)
}

Shrine.plugin :activerecord           # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data    # extracts metadata for assigned cached files
