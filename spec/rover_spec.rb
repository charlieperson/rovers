require 'rover.rb'

describe Rover do
  let(:plateau) {double(:plateau)}
  subject(:rover) {described_class.new(plateau, [1, 2, 'N'])}

  describe '#initialize' do
    it 'initializes with appropriate values' do
      expect(rover.plateau).to eq(plateau)
      expect(rover.heading).to eq('N')
      expect(rover.location).to eq([1, 2])
    end
  end
  describe '#navigate' do
    it 'can find the coordinates if input is valid' do
      allow(plateau).to receive(:upper_right).and_return([5,5])
      rover.directions = ['L','M','L','M','L','M','L','M','M']
      expect(rover.navigate).to eq("1 3 N")
    end

    it 'raises error if rover falls off grid' do
      allow(plateau).to receive(:upper_right).and_return([5,5])
      rover.directions = ['L','M','R','L','M','R']
      expect{ rover.navigate }.to raise_error('You fell')
    end

    it 'raises error if directions are invalid' do
      rover.directions = ['this will not work']
      expect{ rover.navigate }.to raise_error('Not valid directions.')
    end
  end
end
