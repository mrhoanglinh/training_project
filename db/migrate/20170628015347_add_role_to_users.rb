class AddRoleToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :devises, :role, :boolean
  end
end
