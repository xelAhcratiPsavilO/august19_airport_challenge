class Airport

  def initialize(capacity)
    @capacity = capacity
    @hangar = []
  end

  def land(plane)
    raise 'Airport at full capacity' if @hangar.size >= @capacity
    @hangar << plane
  end

  def take_off(plane)

  end

end
