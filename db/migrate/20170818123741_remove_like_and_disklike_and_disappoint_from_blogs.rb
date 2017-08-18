class RemoveLikeAndDisklikeAndDisappointFromBlogs < ActiveRecord::Migration[5.0]
  def change
    remove_column :blogs, :like, :integer
    remove_column :blogs, :dislike, :integer
    remove_column :blogs, :disappoint, :integer
  end
end
