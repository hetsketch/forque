# frozen_string_literal: true

class AvatarUploader < BaseUploader
  # Create different versions of your uploaded files:
  version :thumb do
    process crop: :avatar ## Crops this version based on original image
    resize_to_limit(64, 64)
  end
end
