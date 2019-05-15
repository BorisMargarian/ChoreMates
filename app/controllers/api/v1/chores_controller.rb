class Api::V1::ChoresController < ApplicationController
  def show
    @chore = Chore.find(params["id"])
    # @chore = ChoreSerializer.new(chore)
    render json: {
      chore: @chore,
      current_user: current_user
    }
  end
end
