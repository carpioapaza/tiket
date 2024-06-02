class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :ticket_name
      t.integer :quantity_available
      t.decimal :price
      t.string :currency
      t.references :event, foreign_key: true
    end
  end
end
