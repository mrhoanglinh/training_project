class AddLikeToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :like, :integer
  end
end
