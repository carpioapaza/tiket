class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.decimal :total_amount, precision: 10, scale: 2
      t.string :payment_status
      t.string :transaction_id

      t.timestamps
    end
  end
end
