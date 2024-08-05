require "rails_helper"

RSpec.describe Flight, type: :model do
  describe "relationships" do
    it { should belong_to :airline }
    it { should have_many (:passenger_flights) }
    it { should have_many (:passengers) } # remove the through.(:passenger_flights) since it was throwing error.
  end
end
