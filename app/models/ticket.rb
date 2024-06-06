# == Schema Information
#
# Table name: tickets
#
#  id                 :bigint           not null, primary key
#  currency           :string
#  price              :decimal(, )
#  quantity_available :integer
#  ticket_name        :string
#  event_id           :bigint
#
# Indexes
#
#  index_tickets_on_event_id  (event_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#
class Ticket < ApplicationRecord
  belongs_to :event

  validates :ticket_name, :quantity_available, :price, :currency, presence: true
  validates :quantity_available, numericality: { greater_than_or_equal_to: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
