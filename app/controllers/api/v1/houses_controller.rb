class Api::V1::HousesController < ApplicationController
  def index
    render json: {
      houses: House.all,
      current_user: current_user
    }
  end

  def show
    @house = House.find(params["id"])
    ordered_chores = @house.chores.order(:due)
    @chores = ordered_chores.map do |chore|
      ChoreSerializer.new(chore)
    end
    render json: {
      house: @house,
      chores: @chores,
      current_user: current_user
    }
  end

  def update
    @chore = Chore.find(params["house"]["id"])
    if @chore.user
      @chore.update_attributes(status: params["status"], user_id: nil)
    else
      @chore.update_attributes(status: params["status"], user: current_user)
    end
    @house = House.find(params["id"])
    ordered_chores = @house.chores.order(:due)
    @chores = ordered_chores.map do |chore|
      ChoreSerializer.new(chore)
    end

    render json: {
      chores: @chores
    }
  end
end
