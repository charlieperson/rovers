require 'plateau.rb'

describe Plateau do
  subject(:plateau) {described_class.new([5, 5])}

  describe '#initialize' do
    it 'initializes with appropriate values' do
      expect(plateau.upper_right).to eq([5, 5])
    end
  end
end
