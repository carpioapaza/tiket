class SuperAdmins::CitiesController < ApplicationController
  before_action :set_city, only: %i[show edit update destroy]
  before_action :authenticate_super_admin! 
  def index
    @cities = City.all
  end

  def show
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    @city.super_admin = current_super_admin 
    if @city.save
      redirect_to super_admins_city_path(@city), notice: 'City was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @city.update(city_params)
      redirect_to super_admins_city_path(@city), notice: 'City was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @city.destroy
    redirect_to super_admins_cities_path, notice: 'City was successfully destroyed.'
  end

  def event_statistics
    @cities = City.includes(:events)
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name)
  end
end
