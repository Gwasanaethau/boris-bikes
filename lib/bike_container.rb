module BikeContainer
  DEFAULT_CAPACITY = 20
  attr_writer :capacity

  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def dock bike
    fail 'Station Full' if full?
    bikes << bike
    nil
  end

  def release_bike
    fail 'No Bikes Available' if empty?
    bikes.pop
  end

  def bike_count
    bikes.length
  end

  private

  def full?
    bikes.length >= capacity
  end

  def empty?
    bikes.reject(&:broken?).length == 0
  end
end
