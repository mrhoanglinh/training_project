class Category < ApplicationRecord
  has_many :blogs, dependent: :nullify
end
