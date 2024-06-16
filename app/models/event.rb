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
class Event < ApplicationRecord
  belongs_to :user
  belongs_to :admin
  belongs_to :category
  belongs_to :city
  
  has_one :location, dependent: :destroy
  has_one_attached :image
  has_many :tickets, dependent: :destroy
  accepts_nested_attributes_for :location, :tickets, allow_destroy: true

  enum restriction: { all_ages: 0, adults: 1 }
  enum visibility: { visibility_private: 0, visibility_public: 1 }
  enum admin_status: { pending_approval: 0, approved: 1, rejected: 2, deleted: 3 }

  before_validation :assign_to_event_admin, on: :create
  after_initialize :set_default_admin_status, if: :new_record?

  private

  def set_default_admin_status
    self.admin_status ||= :pending_approval
  end

  def assign_to_event_admin
    event_admins = Admin.where(role: :event_admin)
    return if event_admins.empty?
    
    self.admin = if event_admins.count == 1
                   event_admins.first
                 else
                   event_admins.min_by { |admin| admin.events.pending_approval.count }
                 end
  end
end

