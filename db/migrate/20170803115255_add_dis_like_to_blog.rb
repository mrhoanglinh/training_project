class AddDisLikeToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :dislike, :integer
  end
end
