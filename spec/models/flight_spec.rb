require "rails_helper"

RSpec.describe Flight, type: :model do
  describe "relationships" do
    it { should belong_to :airline }
    it { should have_many :passenger_flights }
    it { should belong_to (:passengers).through(:passenger_flights) }
  end
end
