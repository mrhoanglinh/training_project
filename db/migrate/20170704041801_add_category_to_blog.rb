class AddCategoryToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :category, :integer
  end
end
