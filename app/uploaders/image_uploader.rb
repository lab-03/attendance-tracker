class ImageUploader < Shrine
  plugin :determine_mime_type
  plugin :data_uri
  plugin :infer_extension
end