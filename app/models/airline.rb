class Airline < ApplicationRecord
   has_many :flights

   def adult_passengers
      Passenger.joins(:flights)
         .where(flights: { airline_id: id })
         .where('passengers.age >= 18')
         .distinct
   end
end
