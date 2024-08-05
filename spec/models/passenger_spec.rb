require "rails_helper"

RSpec.describe Passenger, type: :model do
  describe "relationships" do
    it { should have_many :passenger_flights }
    it { should belong_to (:passengers).through(:passenger_flights) }
  end
end
