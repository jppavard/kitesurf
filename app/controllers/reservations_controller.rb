  class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show destroy]

  def clients_reservations
    @reservations = current_user.owned_reservations
    authorize(@reservations)
  end

  def my_index
    @reservations = current_user.owned_equipments
    authorize(@reservations)
  end

  def new
    @reservation = Reservation.new
    @equipment = Equipment.find(params[:equipment_id])
    authorize(@reservation)
  end

  def create
    @equipment = Equipment.find(params[:equipment_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.equipment = @equipment
    authorize(@reservation)
    if @reservation.save
      redirect_to my_reservations_path, notice: 'your reservation has been successfully created.'
    else
      render :new
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.delete
    redirect_to equipment_reservations_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:reservation_id])
  end

  # Only allow a trusted parameter "white list" through.
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :paid, :equipment_id)
  end
end
