class CreateTicketPurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_purchases do |t|
      t.references :purchase, foreign_key: true
      t.references :ticket, foreign_key: true
      t.integer :quantity
      t.decimal :subtotal, precision: 10, scale: 2

      t.timestamps
    end
  end
end
