class Blog < ApplicationRecord
  belongs_to :category

  mount_uploader :image, ImageUploader
  mount_uploader :authorImage, AuthorImageUploader

  validates :title, length: { maximum: 255 }

  validates :author,:jobName, length: { maximum: 32 }

  validates :age, numericality: true, length: { maximum: 2 }

  validates_size_of :image, :authorImage, maximum: 1.megabytes

  # enum category: [ :カテゴリ1, :カテゴリ2, :カテゴリ3 ]
  #
  # enum isSort: [ :作成日時降順, :作成日時昇順 ]
end
