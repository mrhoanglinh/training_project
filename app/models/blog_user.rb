class BlogUser < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  enum action: %i{not_choose interest like dislike disappoint}

  def self.update_action_count(blog_id)
    count_update = BlogUser.where(blog_id: blog_id).select(:action).group(:action).count
    count_update['interest'] = 0 unless count_update['interest']
    count_update['like'] = 0 unless count_update['like']
    count_update['dislike'] = 0 unless count_update['dislike']
    count_update['disappoint'] = 0 unless count_update['disappoint']
    Blog.find(blog_id).update(interest: count_update['interest'],
                              like: count_update['like'],
                              dislike: count_update['dislike'],
                              disappoint: count_update['disappoint'])
  end
end
