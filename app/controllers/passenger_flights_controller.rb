class PassengerFlightsController < ApplicationController
  def destroy
    pass_flight = PassengerFlight.where(flight_id: params[:flight_id], passenger_id: params[:passenger_id])
    pass_flight.destroy(pass_flight)
    redirect_to flights_path
  end
end