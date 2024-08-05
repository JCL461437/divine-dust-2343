class PassengerFlightsController < ApplicationController
  def destroy
    @flights = Flight.all
  end
end