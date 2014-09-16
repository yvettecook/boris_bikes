require_relative 'bike_container'

class Garage

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def take_broken_bike(van)
		van.broken_bike.each do |bike|
			bikes << van.release(bike)
		end
	end

	

end

