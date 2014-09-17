require './lib/docking_station'

describe DockingStation do 

let(:station) { DockingStation.new(:capacity => 123) }
let(:bike) { Bike.new }

	it "should allow setting default capacity on initilaising" do
		expect(station.capacity).to eq(123)
	end

	it 'should know when its empty' do
		expect(lambda {station.release(bike) }).to raise_error(RuntimeError)
	end	


end