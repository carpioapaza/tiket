# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  address    :string
#  reference  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :bigint
#
# Indexes
#
#  index_locations_on_event_id  (event_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#
class Location < ApplicationRecord
  belongs_to :event


  # PERU_CITIES = ["Lima", "Arequipa", "Trujillo", "Cusco", "Piura", "Iquitos", "Chiclayo", "Huancayo", "Tacna", "Ica", "Cajamarca", "Pucallpa", "Sullana", "Juliaca", "Ayacucho", "Chimbote", "Huaraz", "Tarapoto", "Tumbes", "Huanuco", "Puno", "Moquegua", "Chachapoyas", "Cerro de Pasco", "Puerto Maldonado", "Jaen", "Moyobamba", "Ilo", "Tarma", "Tingo Maria"]
  # validates :city, inclusion: { in: PERU_CITIES, message: "%{value} is not a valid city in Peru" }

end
