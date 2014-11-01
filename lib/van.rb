require_relative 'bike_container'

class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def take_broken_bikes(station)
		station.broken_bike.each do |bike| 	
		  bikes << station.release(bike) 
		end
	end

 	def take_available_bikes(garage)
    	garage.available_bikes.each do |bike|
      	  bikes << garage.release(bike)
    	end
  	end

end