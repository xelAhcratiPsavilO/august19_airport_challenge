class Airport
  DEFAULT_CAPACITY = 20
  def initialize(weather_forecast, capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @fleet = []
    @weather_forecast = weather_forecast
  end

  def land(plane)
    raise 'Stormy weather' if stormy?
    raise 'Airport at full capacity' if full?
    @fleet << plane
  end

  def take_off(plane)
    raise 'Stormy weather' if stormy?
  end

  private

  def full?
    @fleet.size >= @capacity
  end

  def stormy?
    @weather_forecast.stormy?
  end
end
