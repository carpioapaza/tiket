class AddSuperAdminToCities < ActiveRecord::Migration[5.2]
  def change
    add_reference :cities, :super_admin, foreign_key: true
  end
end
