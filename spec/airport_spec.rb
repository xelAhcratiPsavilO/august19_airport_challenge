require 'airport'

describe Airport do

  subject(:airport) { described_class.new(20) }

    it 'allows a plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'allows a plane to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    it 'raises an error when hangar is at full capacity' do
      plane = double :plane
      20.times do
        airport.land(plane)
      end
      expect { airport.land(plane) }.to raise_error 'Airport at full capacity'
    end

end
