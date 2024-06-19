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

  validate :quantity_within_event_capacity

  private

  def quantity_within_event_capacity
    total_tickets = event.tickets.where.not(id: id).sum(:quantity_available) + quantity_available
    if total_tickets > event.capacity
      errors.add(:base, "El total de entradas supera la capacidad del evento")
    end
  end
end
