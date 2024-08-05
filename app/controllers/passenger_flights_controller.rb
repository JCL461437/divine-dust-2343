class PassengerFlightsController < ApplicationController
  def destroy
    pass_flight = PassengerFlight.find(flight: params[:flight_id], passenger: params[:id])
    pass_flight.destroy 
  end
end