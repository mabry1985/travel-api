class V1::ReviewsController < ApplicationController
  include Response

  def index
    @destination = Destination.find(params[:destination_id])
    @reviews = @destination.reviews.all
    json_response(@reviews)
  end

  def show
    @destination = Destination.find(params[:destination_id])
    @review = Review.find(params[:id])
    json_response(@review)
  end

  def create
    @destination = Destination.find(params[:destination_id])
    @review = @destination.reviews.create!(review_params)
    json_response(@review)
  end

  def update
    @destination = Destination.find(params[:destination_id])
    @review = Review.find(params[:id])
    @destination.reviews.update(review_params)
  end

  def destroy
    @destination = Destination.find(params[:destination_id])
    @review = Review.find(params[:id])
    @review.destroy
  end

  private

  def review_params
    params.permit(:author, :content)
  end

end
