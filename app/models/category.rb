# == Schema Information
#
# Table name: categories
#
#  id             :bigint           not null, primary key
#  description    :text
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  super_admin_id :bigint
#
# Indexes
#
#  index_categories_on_super_admin_id  (super_admin_id)
#
# Foreign Keys
#
#  fk_rails_...  (super_admin_id => super_admins.id)
#
class Category < ApplicationRecord
  has_many :events
  belongs_to :super_admin
end
