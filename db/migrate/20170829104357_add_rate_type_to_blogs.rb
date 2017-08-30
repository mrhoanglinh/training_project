class AddRateTypeToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :rating_type_1, :integer, default: 0
    add_column :blogs, :rating_type_2, :integer, default: 0
    add_column :blogs, :rating_type_3, :integer, default: 0
    add_column :blogs, :rating_type_4, :integer, default: 0
  end
end
