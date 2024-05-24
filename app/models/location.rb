# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  address    :string
#  city       :string
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
end
