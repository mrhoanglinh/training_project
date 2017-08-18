class RemoveInterestFromBlogs < ActiveRecord::Migration[5.0]
  def change
    remove_column :blogs, :interest, :integer
  end
end
