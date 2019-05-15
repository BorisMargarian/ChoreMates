class Api::V1::HousesController < ApplicationController
  def index
    render json: {
      houses: House.all.order(created_at: :desc),
      current_user: current_user
    }
  end

  def create
    @house = House.create(house_params)
    render json: {
      houses: House.all.order(created_at: :desc)
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
    if @chore.user && params["status"] == "unclaimed"
      @chore.assign_attributes(status: params["status"], user_id: nil)
    elsif params["status"] == "claimed"
      @chore.assign_attributes(status: params["status"], user: current_user)
    elsif params["status"] == "complete"
      @chore.assign_attributes(status: params["status"], user: current_user)
    end
    @chore.save!
    @house = House.find(params["id"])
    ordered_chores = @house.chores.order(:due)
    @chores = ordered_chores.map do |chore|
      ChoreSerializer.new(chore)
    end

    render json: {
      chores: @chores
    }
  end

  private

  def house_params
    params.require(:house).permit(:name, :password)
  end
end
