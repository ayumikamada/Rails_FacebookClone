class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [700, 700]
  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  def picture_size  
    if picture.size > 5.megabytes  
      errors.add(:picture, "should be less than 5MB")  
    end
  end
end
