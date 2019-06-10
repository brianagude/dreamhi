class Project < ApplicationRecord
  validates :title, presence: true
  validates :artist, presence: true
  validates :description, presence: true
  validates :image_1, presence: true

  mount_uploader :image_1, ImageUploader
  mount_uploader :image_2, ImageUploader
  mount_uploader :image_3, ImageUploader
  mount_uploader :image_4, ImageUploader
  mount_uploader :image_5, ImageUploader
  mount_uploader :image_6, ImageUploader
  mount_uploader :image_7, ImageUploader
  mount_uploader :image_8, ImageUploader
  mount_uploader :image_9, ImageUploader
  mount_uploader :image_10, ImageUploader
end
