class AddCityToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :city, foreign_key: true
  end
end
