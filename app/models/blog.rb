class Blog < ApplicationRecord
  belongs_to :category

  mount_uploader :image, ImageUploader
  mount_uploader :authorImage, AuthorImageUploader

  validate :title_validation
  validate :author_validation
  validate :jobName_validation
  validates :age, numericality: true, length: { maximum: 2 }
  validates_size_of :image, :authorImage, maximum: 1.megabytes

  private
  def title_validation
    if title.length > 255
      errors.add(:title, "タイトルを入カしてください。255文字以内で入カしてください。")
    end
  end

  def author_validation
    if author.length > 32
      errors.add(:author, "名前を入カしてください。32文字以内で入カしてください。")
    end
  end

  def jobName_validation
    if jobName.length > 32
      errors.add(:jobName, "職業を入カしてください。32文字以内で入カしてください。")
    end
  end

end
