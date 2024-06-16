# == Schema Information
#
# Table name: admins
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :string           default(NULL)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  super_admin_id         :bigint           not null
#
# Indexes
#
#  index_admins_on_email                 (email) UNIQUE
#  index_admins_on_reset_password_token  (reset_password_token) UNIQUE
#  index_admins_on_super_admin_id        (super_admin_id)
#
# Foreign Keys
#
#  fk_rails_...  (super_admin_id => super_admins.id)
#
class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :super_admin
  has_many :events

  # enum role: { junior: 'junior', senior: 'senior' }
  enum role: { event_admin: 'event_admin', customer_support: 'customer_support' }
  # before_update :check_and_reassign_events

  def self.invite_and_create(attributes)
    password = Devise.friendly_token.first(8) # Generar una contraseña aleatoria
    admin = new(attributes.merge(password: password))
    if admin.save
      puts "Admin saved successfully"
      AdminMailer.invite_email(admin, password).deliver_later # Enviar correo electrónico de invitación
      puts "Invite email sent"
      admin
    else
      puts "Error saving admin"
      nil
    end
  end

  # def check_and_reassign_events
  #   if role_was == 'event_admin' && role != 'event_admin'
  #     if !reassign_events
  #       errors.add(:base, 'No se puede cambiar el rol porque este administrador es el único administrador de eventos con eventos pendientes.')
  #       throw(:abort)
  #     end
  #   end
  # end

  # def reassign_events
  #   event_admins = Admin.where(role: :event_admin)
  #   pending_events = events.where(admin_status: :pending_approval)

  #   if event_admins.count == 1 && pending_events.any?
  #     return false
  #   end
  #   pending_events.each do |event|
  #     next_admin = event_admins.min_by { |admin| admin.events.pending_approval.count }
  #     event.update(admin_id: next_admin.id) if next_admin
  #   end
  #   true
  # end
      
end