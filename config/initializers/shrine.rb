require "cloudinary"
require "shrine/storage/cloudinary"

Cloudinary.config(
  cloud_name: Volunteers::Application.credentials.cloudinary[:cloud_name],
  api_key:    Volunteers::Application.credentials.cloudinary[:api_key],
  api_secret: Volunteers::Application.credentials.cloudinary[:api_secret],
)

Shrine.storages = {
  cache: Shrine::Storage::Cloudinary.new(prefix: "cache"), # for direct uploads
  store: Shrine::Storage::Cloudinary.new,
}

Shrine.plugin :activerecord           # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data    # extracts metadata for assigned cached files