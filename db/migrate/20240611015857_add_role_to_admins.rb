class AddRoleToAdmins < ActiveRecord::Migration[5.2]
  def change
      add_column :admins, :role, :string, default: "junior"
  end
end
