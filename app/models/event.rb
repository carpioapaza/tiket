# == Schema Information
#
# Table name: events
#
#  id             :bigint           not null, primary key
#  admin_status   :integer          default(0)
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
#  user_id        :bigint
#
# Indexes
#
#  index_events_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Event < ApplicationRecord
  belongs_to :user
  
  enum restriction: { all_ages: 0, adults: 1}
  enum visibility: { visibility_private: 0, visibility_public: 1 }
  enum admin_status: { pending_approval: 0, approved: 1, rejected: 2, deleted: 3 }

end
