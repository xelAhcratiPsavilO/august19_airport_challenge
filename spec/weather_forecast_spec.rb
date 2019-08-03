require 'weather_forecast'

describe WeatherForecast do
  subject(:weather_forecast) { described_class.new }

  describe '#stormy?' do
    context 'when random is stubbed to return 3' do
      before { srand(3) }
      it 'can be true' do
        expect(weather_forecast.stormy?).to be true
      end
    end

    context 'when random is stubbed to return 1 or 2' do
      before { srand(2) }
      it 'can be false' do
        expect(weather_forecast.stormy?).to be false
      end
    end
  end
end
