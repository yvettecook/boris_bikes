require './lib/van'

describe Van do 

let(:bike) { Bike.new }
let(:van) { Van.new(:capacity => 30) }
let(:station) { DockingStation.new }

def fill_station(station)
	10.times { station.dock(Bike.new) }
end

	it "should allow setting default capacity on initialising" do
		expect(van.capacity).to eq(30)
	end

	it "should only transfer broken bikes from docking station" do
		5.times { station.dock(Bike.new.break!) }
		3.times { station.dock(Bike.new) }
		expect(station.bike_count).to eq(8)
		van.take_broken_bike(station)
		expect(van.bike_count).to eq(5)
		expect(station.bike_count).to eq(3)
	end

end
