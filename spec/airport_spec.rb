require 'airport'

describe Airport do
  subject(:airport) { described_class.new(20) }
  let(:plane) { double :plane }

  describe '#land' do
    context 'while not full' do
      it 'allows a plane to land' do
        expect(airport).to respond_to(:land).with(1).argument
      end
    end

    context 'when full' do
      before do
        20.times do
          airport.land(plane)
        end
      end

      it 'raises an error' do
        expect { airport.land(plane) }.to raise_error 'Airport at full capacity'
      end
    end
  end

  describe '#take_off' do
    context 'while not stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      it 'allows a plane to take off' do
        expect(airport).to respond_to(:take_off).with(1).argument
      end
    end

    context 'when stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return true
      end

      it 'raises an error when trying to take off in stormy wheather' do
        expect { airport.take_off(plane) }.to raise_error 'Stormy wheather'
      end
    end
  end
end
