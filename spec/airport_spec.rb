require 'airport'

describe Airport do

  subject(:airport) { described_class.new }

    it 'lands a plane' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'allows a plant to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

end
