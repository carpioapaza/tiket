# == Schema Information
#
# Table name: events
#
#  id             :bigint           not null, primary key
#  admin_status   :integer          default("pending_approval")
#  capacity       :integer
#  description    :text
#  end_datetime   :datetime
#  name           :string
#  restriction    :integer
#  start_datetime :datetime
#  video_url      :string
#  visibility     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  admin_id       :bigint
#  category_id    :bigint
#  city_id        :bigint
#  user_id        :bigint
#
# Indexes
#
#  index_events_on_admin_id     (admin_id)
#  index_events_on_category_id  (category_id)
#  index_events_on_city_id      (city_id)
#  index_events_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (admin_id => admins.id)
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (city_id => cities.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
