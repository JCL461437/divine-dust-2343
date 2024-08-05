class Airline < ApplicationRecord
   has_many :flights

   def adult_passengers
      self.flights.joins(:passengers)
         .select(:passengers)
         .where("airline = self")
         .where("passengers.age >= 18").distinct
   end
end
