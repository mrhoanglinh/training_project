class AddDatePublicToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :datePublic, :datetime
  end
end
