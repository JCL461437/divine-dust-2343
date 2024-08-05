require "rails_helper"

RSpec.describe "flights index" do
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

    @passenger1 = Passenger.create!(name: "Bill", age: 32)
    @passenger2 = Passenger.create!(name: "John", age: 18)
    @passenger3 = Passenger.create!(name: "Guy", age: 38)
    @passenger4 = Passenger.create!(name: "Ron", age: 71)
    @passenger5 = Passenger.create!(name: "Becky", age: 27)
    @passenger6 = Passenger.create!(name: "Barbara", age: 40)

    #delta
    @pass_flight4 = PassengerFlight.create!(passenger: @passenger2, flight: @flight1 )
    @pass_flight7 = PassengerFlight.create!(passenger: @passenger3, flight: @flight4 )
    @pass_flight8 = PassengerFlight.create!(passenger: @passenger4, flight: @flight4 )
    @pass_flight9 = PassengerFlight.create!(passenger: @passenger5, flight: @flight4 )
    #united
    @pass_flight4 = PassengerFlight.create!(passenger: @passenger2, flight: @flight3 )
    @pass_flight5 = PassengerFlight.create!(passenger: @passenger1, flight: @flight3 )
    @pass_flight6 = PassengerFlight.create!(passenger: @passenger6, flight: @flight3 )
    #alaskan
    @pass_flight1 = PassengerFlight.create!(passenger: @passenger1, flight: @flight2 )
    @pass_flight2 = PassengerFlight.create!(passenger: @passenger2, flight: @flight2 )
    @pass_flight3 = PassengerFlight.create!(passenger: @passenger3, flight: @flight2 )
  end

  it "I see all flight numbers and next to each number I see the name of the airline and flight passengers " do
    visit flights_index_path

    expect(current_path).to eq(flights_index_path)

    expect(page).to have_content("Flight Number: #{@flight1.number} | Flight Airline #{@delta.name}")
    expect(page).to have_content("Coupon Code #{@coupon1.unique_code}")
    expect(page).to have_content("Dollar off $#{@coupon1.dollar_off*0.01}")
    expect(page).to have_content("Percent off #{@coupon1.percent_off} %")
    expect(page).to have_content("Coupon Status: #{@coupon1.status}")
    expect(page).to have_content("Times Used: #{@coupon1.times_used}")

    
  end