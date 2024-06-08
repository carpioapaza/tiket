class AddRoleToSuperAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :super_admins, :role, :string, default: "super_admin"
  end
end
