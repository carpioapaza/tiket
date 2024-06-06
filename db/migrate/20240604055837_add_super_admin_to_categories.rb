class AddSuperAdminToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :super_admin, foreign_key: true
  end
end
