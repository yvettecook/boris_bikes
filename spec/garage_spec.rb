require './lib/garage'

describe Garage do  
	let(:bike) { Bike.new }
	let(:van) { Van.new }
	let(:garage) { Garage.new }

	it "should transfer bikes from van" do
		10.times { van.dock(Bike.new.break!) }
		expect(van.bike_count).to eq(10)
		garage.take_broken_bikes(van)
		expect(van.bike_count).to eq(0)
		expect(garage.bike_count).to eq(10)
	end

	it "should fix bikes" do
		10.times { garage.dock(Bike.new.break!) }
		garage.fix_all_bikes
		expect(garage.available_bikes.count).to eq(10)
	end

end

