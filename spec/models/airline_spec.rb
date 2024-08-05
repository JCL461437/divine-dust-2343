require "rails_helper"

RSpec.describe Airline, type: :model do
  before :each do
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
  end

  describe "relationships" do
    it { should have_many :flights }
  end

  describe "model methods" do
    describe "instance methods" do
      describe ":adult_passengers" do 
        it "returns only adult passengers for an airline" do
          expect(@delta.adult_passengers).to eq([@passenger2, @passenger3, @passenger5])
        end
      end
    end
  end
end
