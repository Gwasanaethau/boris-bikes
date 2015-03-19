require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  def initialize
    @bikes = []
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

  private

  attr_reader :bikes

  def full?
    bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    bikes.empty?
  end
end
