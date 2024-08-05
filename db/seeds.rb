# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@alaskan = Airline.create!(name: "Alaskan Airlines")
@delta = Airline.create!(name: "Delta")
@united = Airline.create!(name: "United Airlines")
#delta
@flight1 = Flight.create!(number: "1", date: "1/1/2024", departure_city: "Atlanta", arrival_city: "Salt Lake City", airline: @delta)
@flight4 = Flight.create!(number: "3", date: "5/4/2024", departure_city: "Los Angelus", arrival_city: "Seattle", airline: @delta)
#united
@flight3 = Flight.create!(number: "4", date: "5/4/2024", departure_city: "Salt Lake City", arrival_city: "Seattle", airline: @united)
#alaskan
@flight2 = Flight.create!(number: "2", date: "2/4/2024", departure_city: "Seattle", arrival_city: "Anchorage", airline: @alaskan)

@passenger1 = Passenger.create!(name: "Bill", age: 17)
@passenger2 = Passenger.create!(name: "John", age: 18)
@passenger3 = Passenger.create!(name: "Guy", age: 38)
@passenger4 = Passenger.create!(name: "Ron", age: 11)
@passenger5 = Passenger.create!(name: "Becky", age: 27)
@passenger6 = Passenger.create!(name: "Barbara", age: 40)

#delta
@pass_flight4 = PassengerFlight.create!(passenger: @passenger2, flight: @flight1 )
@pass_flight7 = PassengerFlight.create!(passenger: @passenger3, flight: @flight1 )
@pass_flight7 = PassengerFlight.create!(passenger: @passenger3, flight: @flight4 )
@pass_flight8 = PassengerFlight.create!(passenger: @passenger4, flight: @flight4 )
@pass_flight9 = PassengerFlight.create!(passenger: @passenger5, flight: @flight4 )
#united
@pass_flight4 = PassengerFlight.create!(passenger: @passenger2, flight: @flight2 )
@pass_flight5 = PassengerFlight.create!(passenger: @passenger1, flight: @flight2 )
@pass_flight6 = PassengerFlight.create!(passenger: @passenger6, flight: @flight2 )
#alaskan
@pass_flight1 = PassengerFlight.create!(passenger: @passenger1, flight: @flight3 )
@pass_flight2 = PassengerFlight.create!(passenger: @passenger2, flight: @flight3 )
@pass_flight3 = PassengerFlight.create!(passenger: @passenger3, flight: @flight3 )