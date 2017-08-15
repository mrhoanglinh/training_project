# Update likes, dislike
class UpdateactionJob < ApplicationJob
  queue_as :default

  def perform(params_blog_id)
    BlogUser.update_action_count(params_blog_id)
  end
end