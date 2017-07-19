class Blog < ApplicationRecord
  belongs_to :category

  mount_uploader :image, ImageUploader
  mount_uploader :authorImage, AuthorImageUploader

  validates_length_of :title, maximum: 255
  validates :title, presence: true
  validates :datePublic, presence: true
  validates_length_of :author, maximum: 32
  validates_length_of :jobName, maximum: 32
  validates :age, numericality: true, length: { maximum: 2 }
  validates_size_of :image, :authorImage, maximum: 2.megabytes

end
