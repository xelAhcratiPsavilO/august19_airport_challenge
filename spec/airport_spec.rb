require 'airport'

describe Airport do
  subject(:airport) { described_class.new(20) }
  let(:plane) { double :plane }

  describe '#land' do
    it 'allows a plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'raises an error when hangar is at full capacity' do
      20.times do
        airport.land(plane)
      end
      expect { airport.land(plane) }.to raise_error 'Airport at full capacity'
    end
  end

  describe '#take_off' do
    it 'allows a plane to take off' do
      allow(airport).to receive(:stormy?).and_return false
      expect(airport).to respond_to(:take_off).with(1).argument
    end
    it 'raises an error when trying to take off in stormy wheather' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.take_off(plane) }.to raise_error 'Stormy wheather'
    end
  end
end
