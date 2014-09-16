require './lib/van'

describe Van do 

let(:van) { Van.new(:capacity => 30) }
let(:station) { DockingStation.new }

def fill_station(station)
	10.times { station.dock(Bike.new) }
end

	it "should allow setting default capacity on initialising" do
		expect(van.capacity).to eq(30)
	end

	it "should fill the station" do
		fill_station station
		expect(station).to be_full
	end
end
