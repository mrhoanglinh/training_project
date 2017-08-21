class BlogUser < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  enum action: {not_action: 0, interest: 1, like: 2, dislike: 3, disappoint: 4}

end
