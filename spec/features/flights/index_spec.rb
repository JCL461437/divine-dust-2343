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
    @pass_flight4 = PassengerFlight.create!(passenger: @passenger2, flight: @flight2 )
    @pass_flight5 = PassengerFlight.create!(passenger: @passenger1, flight: @flight2 )
    @pass_flight6 = PassengerFlight.create!(passenger: @passenger6, flight: @flight2 )
    #alaskan
    @pass_flight1 = PassengerFlight.create!(passenger: @passenger1, flight: @flight3 )
    @pass_flight2 = PassengerFlight.create!(passenger: @passenger2, flight: @flight3 )
    @pass_flight3 = PassengerFlight.create!(passenger: @passenger3, flight: @flight3 )
  end

  it "I see all flight numbers and next to each number I see the name of the airline and flight passengers " do
    visit flights_path

    within "##{@flight1.id}" do
      expect(current_path).to eq(flights_path)

      expect(page).to have_content("Flight Number: #{@flight1.number}")
      expect(page).to have_content("Flight Airline: #{@delta.name}")
      expect(page).to have_content("Flight Passengers:")
      expect(page).to have_content("#{@passenger2.name}")
      expect(page).to_not have_content("Flight Number: #{@flight3.number}")
    end

    within "##{@flight4.id}" do
      expect(page).to have_content("Flight Number: #{@flight4.number}")
      expect(page).to have_content("Flight Airline: #{@delta.name}")
      expect(page).to have_content("Flight Passengers:")
      expect(page).to have_content("#{@passenger3.name}")
      expect(page).to have_content("#{@passenger4.name}")
      expect(page).to have_content("#{@passenger5.name}")
      expect(page).to_not have_content("Flight Number: #{@flight3.number}")
    end

    within "##{@flight3.id}" do
      expect(page).to have_content("Flight Number: #{@flight3.number}")
      expect(page).to have_content("Flight Airline: #{@united.name}")
      expect(page).to have_content("Flight Passengers:")
      expect(page).to have_content("#{@passenger1.name}")
      expect(page).to have_content("#{@passenger2.name}")
      expect(page).to have_content("#{@passenger3.name}")
      expect(page).to_not have_content("Flight Number: #{@flight2.number}")
    end

    within "##{@flight2.id}" do
      expect(page).to have_content("Flight Number: #{@flight2.number}")
      expect(page).to have_content("Flight Airline: #{@alaskan.name}")
      expect(page).to have_content("Flight Passengers:")
      expect(page).to have_content("#{@passenger1.name}")
      expect(page).to have_content("#{@passenger2.name}")
      expect(page).to have_content("#{@passenger6.name}")

      expect(page).to_not have_content("Flight Number: #{@flight4.number}")
    end
    
    it "I see a button next to each passenger name to remove them from the flight " do
      visit flights_path
    end
  end
end