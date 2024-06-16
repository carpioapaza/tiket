class Admins::DashboardController < ApplicationController
  before_action :authenticate_admin!

   def index
    @admin = current_admin
  end
end