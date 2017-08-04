class Blog < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader
  mount_uploader :authorImage, AuthorImageUploader

  validates :title, presence: {message: :title_empty},
            length: {maximum: 255, message: :title_length}

  validates :datePublic, presence: {message: :datePublic_empty}

  validates :image, presence: {message: :image_empty}
  validates_size_of :image, maximum: 2.megabytes, message: :image_size  

  validates :content, presence: {message: :content_empty}
  validates_size_of :content, maximum: 2.megabytes, message: :content_length

  validates :author, presence: {message: :author_empty },
            length: {maximum: 32, message: :author_length}

  validates :jobName, presence: {message: :jobName_empty },
            length: {maximum: 32, message: :jobName_length}

  validates :age, numericality: {message: :age_number}, presence: {message: :age_empty},
            length: { maximum: 2, message: :age_length }
  
  validates_size_of :authorImage, maximum: 2.megabytes, message: :authorImage_size  
  validate :file_format

  def file_format
    unless valid_extension? self.image.filename
      errors.add(:image, I18n.t("errors.extenstion"))
    end
    unless valid_extension? self.authorImage.filename
      errors.add(:authorImage, I18n.t("errors.extenstion"))
    end
  end

  def valid_extension? filename
    return true if filename.nil?
    ext = File.extname(filename)
    %w(.jpeg .png).include? ext.downcase
  end

end
