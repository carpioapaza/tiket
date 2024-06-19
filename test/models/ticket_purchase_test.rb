# == Schema Information
#
# Table name: ticket_purchases
#
#  id          :bigint           not null, primary key
#  quantity    :integer
#  subtotal    :decimal(10, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  purchase_id :bigint
#  ticket_id   :bigint
#
# Indexes
#
#  index_ticket_purchases_on_purchase_id  (purchase_id)
#  index_ticket_purchases_on_ticket_id    (ticket_id)
#
# Foreign Keys
#
#  fk_rails_...  (purchase_id => purchases.id)
#  fk_rails_...  (ticket_id => tickets.id)
#
require 'test_helper'

class TicketPurchaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
