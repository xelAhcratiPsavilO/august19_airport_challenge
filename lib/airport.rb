class Airport

  def initialize(capacity)
    @capacity = capacity
    @hangar = []
  end

  def land(plane)
    raise 'Airport at full capacity' if full?
    @hangar << plane
  end

  def take_off(plane)

  end

  private

  def full?
    @hangar.size >= @capacity
  end

end
