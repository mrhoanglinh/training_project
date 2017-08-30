class BlogUser < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  enum action: {not_action: 0, interest: 1, like: 2, dislike: 3, disappoint: 4}

  scope :action_interest, -> {
    where('action = 1').select(:action).group(:blog_id).count
  }

  scope :action_like, -> {
    where('action = 2').select(:action).group(:blog_id).count
  }

  scope :action_dislike, -> {
    where('action = 3').select(:action).group(:blog_id).count
  }

  scope :action_disappoint, -> {
    where('action = 4').select(:action).group(:blog_id).count
  }

end
