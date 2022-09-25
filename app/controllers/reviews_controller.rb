class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :update, :destroy]
  before_action :is_authorized, only: [:update, :destroy]
  before_action :is_owner, only: [:update, :destroy]
  validate :title, presence: true, capitalize: true, length: { maximum: 50 }
  validate :content, presence: true, capitalize: true, length: { maximum: 250 }
  validate :rating, presence: true, numericality: { less_than_or_equal_to: 5 }, only: :update

  def index
    reviews = Review.all
    render json: reviews, status: :ok
  end

  def show
    render json: review, status: :ok 
  end

  def create
    if Date.today > reservation.check_out
      review = Review.create!(review_params)
      render json: review, status: :created
    else
      render json: { error: "You can't review a reservation before it's completed" }, status: :unprocessable_entity
    end
  end

  def update
    review.update!(review_params)
    render json: review, status: :accepted
  end

  def destroy
    review.destroy
    head :no_content
  end

  private 

  def find_review
    review = Review.find(params[:id])
  end

  def review_params
    params.permit(:title, :content, :rating)
  end 
end
