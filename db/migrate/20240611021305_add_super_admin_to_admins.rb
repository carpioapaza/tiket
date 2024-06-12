class AddSuperAdminToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_reference :admins, :super_admin, null: false, foreign_key: true
  end
end
