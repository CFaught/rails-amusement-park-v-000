class AttractionsController < ApplicationController
  before_action :define_attraction, only: [:show, :edit, :update]

  def new
    @attraction = Attraction.new
    authorize @attraction
  end

  def create
    @attraction = Attraction.new(attraction_params)
    authorize @attraction
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def index
    authorize Attraction
    @attractions = Attraction.all
  end

  def show
    authorize @attraction
    @ride = @attraction.rides.build
  end

  def edit
    authorize @attraction
  end

  def update
    authorize @attraction
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private
  def define_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
