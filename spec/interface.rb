require 'interface.rb'

describe Interface do
  subject(:interface) {described_class.new}

  describe '#initialize' do
    it 'initializes with appropriate values' do
      expect(interface.plateau).to eq([5, 5])
    end
  end
end
