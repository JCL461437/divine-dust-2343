class AirlinesController < ApplicationController
  def show
    @airline = Airline.find(params[:id])
    @adults_for_airline = @airline.adult_passengers
  end
end