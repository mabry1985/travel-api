class V1::DestinationsController < ApplicationController
  include Response

  def index
    @destinations = Destination.all
    json_response(@destinations)
  end

  def show
    @destination = Destination.find(params[:id])
    json_response(@destination)
  end

  def create
    @destination = Destination.create!(destination_params)
    json_response(@destination, :created)
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update!(destination_params)
      render status: 200, json: {
        message: "You did it kid."
      }
    end
  end

  def destroy
    @destination = Destination.find(params[:id])
    if @destination.destroy!
      render status: 200, json: {
        message: "It is done"
      }
    end
  end

  def random
    @destination = Destination.random
   json_response(@destination)
  end

  private

  def destination_params
    params.permit(:name)
  end

end
