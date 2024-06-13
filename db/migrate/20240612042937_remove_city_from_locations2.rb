class RemoveCityFromLocations2 < ActiveRecord::Migration[5.2]
  def change
      remove_column :locations, :city, :string
  end
end
