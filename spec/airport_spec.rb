require 'airport'

describe Airport do

  subject(:airport) { described_class.new(20, weather_forecast) }
  let(:plane) { double :plane }
  let(:weather_forecast) { double :weather_forecast }

  describe '#land' do
    context 'while not stormy and not full' do
      before do
        allow(weather_forecast).to receive(:stormy?).and_return false
      end
      it 'allows a plane to land' do
        expect(airport).to respond_to(:land).with(1).argument
      end
    end

    context 'when not stormy, but full' do
      before do
        allow(weather_forecast).to receive(:stormy?).and_return false
        20.times do
          airport.land(plane)
        end
      end
      it 'raises an error' do
        expect { airport.land(plane) }.to raise_error 'Airport at full capacity'
      end
    end

    context 'when stormy' do
      before do
        allow(weather_forecast).to receive(:stormy?).and_return true
      end
      it 'raises an error' do
        expect { airport.land(plane) }.to raise_error 'Stormy weather'
      end
    end
  end

  describe '#take_off' do
    context 'while not stormy' do
      before do
        allow(weather_forecast).to receive(:stormy?).and_return false
      end
      it 'allows a plane to take off' do
        expect(airport).to respond_to(:take_off).with(1).argument
      end
    end

    context 'when stormy' do
      before do
        allow(weather_forecast).to receive(:stormy?).and_return true
      end
      it 'raises an error' do
        expect { airport.take_off(plane) }.to raise_error 'Stormy weather'
      end
    end
  end
end
