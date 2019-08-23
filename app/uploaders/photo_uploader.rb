class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def remove!
    return
  end
end
