class Api::V1::HousesController < ApplicationController
  def index
    render json: {
      houses: House.all,
      current_user: current_user
    }
  end
end
