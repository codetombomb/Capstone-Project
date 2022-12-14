class SessionsController < ApplicationController
  def create
    guest = Guest.find_by(username: params[:username])
    if guest&.authenticate(params[:password]) 
      session[:guest_id] = guest.id
      render json: guest, status: :created
    else
      render json: { errors: { "Invalid Username or Password" } }, status: :unauthorized
    end
  end

  def destroy
    session.delete :guest_id
    head :no_content
  end
end
