class Api::V1::ChoresController < ApplicationController
  def show
    @chore = Chore.find(params["id"])
    @chore = ChoreSerializer.new(@chore)
    render json: {
      chore: ChoreSerializer.new(@chore),
      current_user: current_user
    }
  end

  def update
    @chore = Chore.find(params["chore"]["id"])
    if @chore.user && params["status"] == "unclaimed"
      @chore.assign_attributes(status: params["status"], user_id: nil)
    elsif params["status"] == "claimed"
      @chore.assign_attributes(status: params["status"], user: current_user)
    elsif params["status"] == "complete"
      @chore.assign_attributes(status: params["status"], user: current_user)
    end
    @chore.save!
    # @house = House.find(params["id"])
    # ordered_chores = @house.chores.order(:due)
    # @chores = ordered_chores.map do |chore|
    #   ChoreSerializer.new(chore)
    # end
    render json: {
      chore: ChoreSerializer.new(@chore)
    }
  end

end
