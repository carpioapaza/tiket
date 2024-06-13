# == Schema Information
#
# Table name: cities
#
#  id             :bigint           not null, primary key
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  super_admin_id :bigint
#
# Indexes
#
#  index_cities_on_super_admin_id  (super_admin_id)
#
# Foreign Keys
#
#  fk_rails_...  (super_admin_id => super_admins.id)
#
class City < ApplicationRecord
  has_many :events
  belongs_to :super_admin
end
