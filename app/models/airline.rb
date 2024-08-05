class Airline < ApplicationRecord
   has_many :flights

   def adult_passengers
      # self.flights.joins(:passengers)
      #    .where("passengers.age >= 18")
      #    .select("passengers.*, passengers.age, passengers.name")
      #    .distinct

      Passenger.joins(:flights)
            .where(flights: { airline_id: id })
            .where('passengers.age >= 18')
            .distinct
   end
end
