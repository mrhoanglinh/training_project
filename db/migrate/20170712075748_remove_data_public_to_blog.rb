class RemoveDataPublicToBlog < ActiveRecord::Migration[5.0]
  def change
    remove_column :blogs, :dataPublic, :datetime
  end
end
