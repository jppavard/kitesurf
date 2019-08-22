class EquipmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]
  before_action :set_equipment, only: %i[show edit destroy]

  def index
    if params[:style]
      @equipments = policy_scope(Equipment.where(style: params[:style]))
    else
      @equipments = policy_scope(Equipment)
    end
  end

  def new
    @equipment = Equipment.new
    authorize(@equipment)
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
      redirect_to equipment_path(@equipment), notice: 'your kitesurf has been successfully updated.'
    else
      render :new
    end
  end

  def update
  end

  def my_index
    @equipments = current_user.owned_equipments
    authorize(@equipments)
  end

  def show
  end

  def destroy
    @equipment.destroy
    redirect_to equipments_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_equipment
    @equipment = Equipment.find(params[:id])
    authorize(@equipment)
  end

  # Only allow a trusted parameter "white list" through.
  def equipment_params
    params.require(:equipment).permit(:brand, :model, :size, :style, :rating, :price, :active, :location, :photo)
  end
end
