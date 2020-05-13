require "shrine"
require "shrine/storage/s3"


s3_options = { 
  bucket:            "gp-students-images", 
  access_key_id:     "AKIAW5TFS2FLTYUY7KUL",
  secret_access_key: "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",
  region:            "eu-west-2",
}
 
Shrine.storages = { 
  cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
  store: Shrine::Storage::S3.new(prefix: "store",**s3_options),
}

Shrine.plugin :activerecord           # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data    # extracts metadata for assigned cached files

 
Shrine.plugin :presign_endpoint, presign_options: -> (request) {
  # Uppy will send the "filename" and "type" query parameters
  filename = request.params["filename"]
  type     = request.params["type"]

  {
    content_disposition:    ContentDisposition.inline(filename), # set download filename
    content_type:           type,                                # set content type (defaults to "application/octet-stream")
    content_length_range:   0..(10*1024*1024),                   # limit upload size to 10 MB
  }
}
