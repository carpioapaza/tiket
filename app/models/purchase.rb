# == Schema Information
#
# Table name: purchases
#
#  id             :bigint           not null, primary key
#  payment_status :string
#  total_amount   :decimal(10, 2)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  event_id       :bigint
#  transaction_id :string
#  user_id        :bigint
#
# Indexes
#
#  index_purchases_on_event_id  (event_id)
#  index_purchases_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#  fk_rails_...  (user_id => users.id)
#
class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :ticket_purchases, dependent: :destroy
  
end
