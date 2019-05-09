class Api::V1::UsersController < ApplicationController
  def update
    current_user.assign_attributes(house_id: params["id"])
    if current_user.save
      render json: {
        current_user: current_user
      }
    end
  end
end
