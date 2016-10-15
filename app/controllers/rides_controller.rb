class RidesController < ApplicationController
  def create
    @ride = Ride.new(rides_params)
    if @ride.save
      message = @ride.take_ride
      redirect_to user_path(@ride.user), notice: message
    else
      render attraction_path(@ride.attraction)
    end
  end

  private
  def rides_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
