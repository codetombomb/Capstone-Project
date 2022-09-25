class GuestsController < ApplicationController
  before_action :find_guest, only: [:show, :update, :destroy]
  skip_before_action :authorize, only: :create
  validate :first_name, :last_name, presence: true, capitalize: true, format: { with: /\A[a-zA-Z]+\z/, message: "Only allows letters" }
  validate :username, presence: true, uniqueness: true, only: :create

  def index
    guests = Guest.all
    render json: guests, only: [:id, :first_name, :last_name]
  end

  def show
    render json: guest, status: :ok 
  end

  def create
    guest = Guest.create!(guest_params) 
    session[:guest_id] = guest.id 
    render json: guest, status: :created
  end

  def update
    guest.update!(guest_params)
    render json: guest, status: :accepted
  end

  def destroy
    guest.destroy
    head :no_content
  end

  private 

  def find_guest
    guest = Guest.find(params[:id])
  end

  def guest_params
    params.permit(:first_name, :last_name, :username, :password)
  end 
end
