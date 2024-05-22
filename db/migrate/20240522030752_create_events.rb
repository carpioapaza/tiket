class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.integer :visibility
      t.integer :restriction
      t.integer :capacity
      t.integer :admin_status, default: 0
      t.string :video_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
