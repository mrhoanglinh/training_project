class Blog < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :blog_users

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
    %w(.jpeg .png .jpg).include? ext.downcase
  end

  scope :blog_all, -> {
    where(isPublic: 1)
    .get_data
    .recent
  }

  scope :blog_public, -> {
    where(isSuggest: 1, isPublic: 1)
      .get_data
      .recent
  }

  scope :blog_list1, -> {
    where(category_id: 1 , isPublic: 1)
      .get_data
      .recent
  }

  scope :blog_list2, -> {
    where(category_id: 2 , isPublic: 1)
      .get_data
      .recent
  }

  scope :blog_list3, -> {
    where(category_id: 3 , isPublic: 1)
      .get_data
      .recent
  }

  scope :get_data, ->{select(:id, :title, :image, :category_id, :isSuggest, :datePublic)}
  scope :recent, ->{order('datePublic DESC')}

  def get_rating
    [
        self.rating_type_1, self.rating_type_2,
        self.rating_type_3, self.rating_type_4
    ]
  end

end
