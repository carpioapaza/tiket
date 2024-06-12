class SuperAdmins::AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_super_admin!

  def index
    @admins = Admin.all
  end

  def show
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.invite_and_create(admin_params.merge(super_admin_id: current_super_admin.id))
    if @admin
      redirect_to super_admins_admins_path, notice: 'Administrador creado exitosamente.'
    else
      render :new
    end
  end


  def edit
  end

  def update
    if @admin.update(admin_params)
      redirect_to super_admins_admins_path, notice: 'Administrador actualizado exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @admin.destroy
    redirect_to super_admins_admins_path, notice: 'Administrador eliminado exitosamente.'
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role)
  end

  # def authorize_super_admin
  #   redirect_to admin_root_path, alert: 'Acceso Restringido' unless current_super_admin.super_admin?
  # end
end