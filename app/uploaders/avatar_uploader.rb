# frozen_string_literal: true

class AvatarUploader < BaseUploader
  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fit: [50, 50]
  end
end
