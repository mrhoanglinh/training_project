class Blog < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :authorImage, AuthorImageUploader

  validates :title, length: { maximum: 255 }

  validates :author,:jobName, length: { maximum: 32 }

  validates :age, numericality: true, length: { maximum: 2 }

  validates_size_of :image, :authorImage, maximum: 1.megabytes

  enum category: [ :カテゴリ1, :カテゴリ2, :カテゴリ3 ]

  enum isSort: [ :作成日時降順, :作成日時昇順 ]

  scope :search, -> (title, category, isSuggest, isPublic, sort_desc) {
    sort_type = sort_desc == 1 ? 'asc' : 'desc'
    where('title LIKE ? OR category LIKE ? OR isSuggest LIKE ? OR isPublic LIKE ? ', title, isSuggest, isSuggest, isPublic)
    .sort()
  }

end
