class SuperAdmins::AdminsController < SuperAdminController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action :authorize_super_admin

  def index
    @admins = SuperAdmin.where.not(role: :super_admin)
  end

  def show
  end

  def new
    @admin = SuperAdmin.new
  end

  def create
    @admin = SuperAdmin.new(admin_params)
    if @admin.save
      redirect_to admin_admins_path, notice: 'Administrador creado exitosamente.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @admin.update(admin_params)
      redirect_to admin_admins_path, notice: 'Administrador actualizado exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @admin.destroy
    redirect_to admin_admins_path, notice: 'Administrador eliminado exitosamente.'
  end

  private

  def set_admin
    @admin = SuperAdmin.find(params[:id])
  end

  def admin_params
    params.require(:super_admin).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role)
  end

  def authorize_super_admin
    redirect_to admin_root_path, alert: 'Acceso Restringido' unless current_super_admin.super_admin?
  end
end