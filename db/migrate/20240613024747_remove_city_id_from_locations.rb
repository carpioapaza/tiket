class RemoveCityIdFromLocations < ActiveRecord::Migration[5.2]
  def change
    remove_reference :locations, :city, index: true, foreign_key: true
  end
end
