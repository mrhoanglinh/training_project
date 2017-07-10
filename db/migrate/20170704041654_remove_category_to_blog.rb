class RemoveCategoryToBlog < ActiveRecord::Migration[5.0]
  def change
    remove_column :blogs, :category, :string
  end
end
