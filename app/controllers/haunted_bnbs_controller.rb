class HauntedBnbsController < ApplicationController
  def index
    haunted_bnbs = HauntedBnb.all
    render json: haunted_bnbs
  end

  def show
    haunted_bnb = HauntedBnb.find(params[:id])
    render json: haunted_bnb
  end
end
