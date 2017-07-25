class Blog < ApplicationRecord
  belongs_to :category

  mount_uploader :image, ImageUploader
  mount_uploader :authorImage, AuthorImageUploader

  validates :title, presence: {message: :title_empty},
            length: {maximum: 255, message: :title_length}

  validates :datePublic, presence: {message: :datePublic_empty}

  validates :image, presence: {message: :image_empty}
  validates_size_of :image, maximum: 2.megabytes, message: :image_size
  validates_format_of :image, with: %r{\.(png|jpeg)\z}i, message: :image_format

  validates :content, presence: {message: :content_empty}
  validates_size_of :content, maximum: 2.megabytes, message: :content_empty

  validates :author, presence: {message: :author_empty },
            length: {maximum: 32, message: :author_length}

  validates :jobName, presence: {message: :jobName_empty },
            length: {maximum: 32, message: :jobName_length}

  validates :age, numericality: {message: :age_number}, presence: {message: :age_empty},
            length: { maximum: 2, message: :age_length }

  validates :authorImage, presence: {message: :authorImage_empty}
  validates_size_of :authorImage, maximum: 2.megabytes, message: :authorImage_size
  validates_format_of :authorImage, with: %r{\.(png|jpeg)\z}i, message: :authorImage_format

end
