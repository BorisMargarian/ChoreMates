class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]
  # GET /houses
  # GET /houses.json
  def index
    @houses = House.all
  end

  def join
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
    render :show
  end

  # GET /houses/new
  def new
    @house = House.new
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = House.new(house_params)

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.fetch(:house, {})
    end
end
