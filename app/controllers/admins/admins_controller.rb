class Admins::AdminsController < ApplicationController
  before_action :authenticate_admin!

  def me
    @admin = current_admin
  end
  
end
