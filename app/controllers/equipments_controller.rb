class EquipmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]
  before_action :set_equipment, only: %i[show edit destroy]

  def index
    p params[:style]
    p 'toto'
    if params[:style]
      @equipments = policy_scope(Equipment.all).geocoded #returns equipments with coordinates
    else
      @equipments = policy_scope(Equipment.all).geocoded
    end
    @markers = @equipments.map do |equipment|
      {
        lat: equipment.latitude,
        lng: equipment.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { equipment: equipment }),
        image_url: helpers.asset_url('kitesurf_north.jpg')
      }
     end
    # @equipments = Equipment.all
  end

  def new
    @equipment = Equipment.new
    authorize(@equipment)
  end

  def create
    @equipment = Equipment.new(equipment_params)
    @equipment.owner = current_user
    @equipment.rating = 0
    authorize(@equipment)
    if @equipment.save
      redirect_to @equipment, notice: 'your kitesurf has been successfully created.'
    else
      render '/my_equipments'
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
    @newequipment = Equipment.new
    authorize(@equipments)
  end

  def show
    @reservation = Reservation.new
  end

  def destroy
    @equipment.destroy
    redirect_to my_equipment_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_equipment
    @equipment = Equipment.find(params[:id])
    authorize(@equipment)
  end

  # Only allow a trusted parameter "white list" through.
  def equipment_params
    params.require(:equipment).permit(:brand, :model, :title, :size, :style, :rating, :price, :active, :location, :photo, :description)
  end
end
