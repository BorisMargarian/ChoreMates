class HomesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  def index
    if current_user && current_user.house
      redirect_to house_path(current_user.house)
    elsif current_user
      redirect_to houses_path
    end
  end
end
