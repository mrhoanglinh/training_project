class AddDisAppointToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :disappoint, :integer, default: 0
  end
end
