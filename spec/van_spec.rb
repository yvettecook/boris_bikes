require './lib/van'

describe Van do 

let(:bike) { Bike.new }
let(:van) { Van.new(:capacity => 30) }
let(:station) { DockingStation.new }
let(:garage) { Garage.new }

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
		van.take_broken_bikes(station)
		expect(van.bike_count).to eq(5)
		expect(station.bike_count).to eq(3)
	end

	it "should transfer all bikes to garage" do
		5.times { van.dock(Bike.new.break!) }
		garage.take_broken_bikes(van)
		expect(garage.bike_count).to eq(5)
		expect(van.bike_count).to eq(0)
	end

	it "should transfer bikes from garage" do
		10.times { garage.dock(Bike.new) }
		van.take_available_bikes(garage)
		expect(garage.bike_count).to eq(0)
		expect(van.bike_count).to eq (10)
	end

	it "should transfer all bikes to docking station" do
		10.times { van.dock(Bike.new) }
		station.take_available_bikes(van)
		expect(station.bike_count).to eq(10)
		expect(van.bike_count).to eq(0)
	end


end
