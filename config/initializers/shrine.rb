require "shrine"

if Rails.env.development?
  require "shrine/storage/file_system"
  Shrine.storages = {
      cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
      store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store")
  }
elsif Rails.env.test?
  require 'shrine/storage/memory'
  Shrine.storages = {
      cache: Shrine::Storage::Memory.new,
      store: Shrine::Storage::Memory.new
  }
else
  require "shrine/storage/s3"
  s3_options = {
      bucket: ENV["BUCKET_NAME"],
      access_key_id: ENV["ACCESS_KEY_ID"],
      secret_access_key: ENV["SECRET_ACCESS_KEY"],
      region: "eu-west-2",
  }

  Shrine.storages = {
      cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
      store: Shrine::Storage::S3.new(**s3_options)
  }
end
Shrine.plugin :activerecord # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data # extracts metadata for assigned cached files