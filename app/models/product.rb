class Product < ApplicationRecord
  is_impressionable
  mount_uploader :image, ImageUploader
  acts_as_list
end
