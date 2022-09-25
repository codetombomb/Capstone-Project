class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :update, :destroy]
  before_action :is_owner, only: [:update, :destroy]
  before_action :is_authorized

  def index
    reservations = Reservation.all
    render json: reservations
  end

  def show
    render json: @reservation
  end

  def create
    reservation = Reservation.create!(reservation_params)
    render json: reservation, status: :created
  end

  def update
    @reservation.update!(reservation_params)
    render json: @reservation
  end

  def destroy
    @reservation.destroy
    head :no_content
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.permit(:check_in, :check_out)
  end
end
