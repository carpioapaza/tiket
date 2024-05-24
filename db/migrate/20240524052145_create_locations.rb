class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :address
      t.string :reference
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
