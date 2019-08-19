class EquipmentsController < ApplicationController
  before_action :set_equipment, only: %i[show edit destroy]
  def index
    @equipments = Equipment.all
  end

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipment_params)
    if @equipment.save
      redirect_to @equipment, notice: 'your kitesurf has been successfully created.'
    else
      render :new
    end
  end

  def edit
    if @equipment.save
      redirect_to @equipment, notice: 'your kitesurf has been successfully updated.'
    else
      render :new
    end
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_equipment
    @equipment = Equipment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def equipment_params
    params.require(:equipment).permit(:brand, :model, :size, :style, :rating, :price, :active, :location, :photo)
  end
end
