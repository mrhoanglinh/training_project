class AddInterestToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :interest, :integer, default: 0
  end
end
