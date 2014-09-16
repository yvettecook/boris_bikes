require_relative 'bike_container'

class Van

	include BikeContainer



	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def take_broken_bike(station)
		station.broken_bike.each do |bike| 	
		  bikes << station.release(bike) 
		end
	
	end

end