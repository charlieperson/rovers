require 'rover.rb'

describe Rover do
  subject(:rover) {described_class.new(plateau, [1, 2, 'N'])}
  let(:plateau) {double(:plateau)}

  describe 'Initialize' do

    it 'initializes with appropriate values' do
      expect(rover.plateau).to eq(plateau)
      expect(rover.heading).to eq('N')
      expect(rover.location).to eq([1, 2])
    end
  end
end
