module BikeContainer

DEFAULT_CAPACITY = 10

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bikes.count
	end

	def dock(bike)
		raise "There is no more room for bikes" if full?
		bikes << bike
	end

	def release(bike)
		bikes.delete(bike)
	end

	def release_available_bike
		bikes.delete(available_bikes.pop)
	end

	def release_broken_bike
		bikes.delete(broken_bike.pop)
	end

	def full?
		bike_count == capacity
	end

	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end

	def broken_bike
		bikes.select {|bike| bike.broken?}
	end

end