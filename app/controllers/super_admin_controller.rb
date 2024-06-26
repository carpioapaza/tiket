class SuperAdminController < ApplicationController

  before_action :authenticate_super_admin!
  layout :dashboard

  private

  def dashboard
    'dashboard'
  end
end
