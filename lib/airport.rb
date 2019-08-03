class Airport
  def initialize(capacity)
    @capacity = capacity
    @fleet = []
  end

  def land(plane)
    raise 'Airport at full capacity' if full?
    @fleet << plane
  end

  def take_off(plane)
    raise 'Stormy wheather' if stormy?
  end

  private

  def full?
    @fleet.size >= @capacity
  end

  def stormy?
    rand(1..3) > 2
  end
end
