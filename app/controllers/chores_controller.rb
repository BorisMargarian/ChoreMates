class ChoresController < ApplicationController
  def new
    @chore = Chore.new
  end

  def create
    @chore = Chore.new(chore_params)
    @chore.house = current_user.house
    if @chore.save
      redirect_to house_path(current_user.house)
      flash[:notice] = "Your chore has been added successfully!"
    else
      flash.now[:notice] =
      @chore.errors.full_messages.join(', ')
      render :new
    end
  end

  private
    def chore_params
      params.require(:chore).permit(:name, :description, :cost, :due, :chore_photo)
    end
end
