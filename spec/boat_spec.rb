require 'pry'
require './lib/boat'

RSpec.describe Boat do
  # before :each do
    let (:boat1) {Boat.new(type: :kayak, price: 20)}
  # end
  
  describe '#Initialize' do
    it 'exists' do
      expect(boat1).to be_a(Boat)
    end
    
    it 'has attributes' do
      expect(boat1.type).to eq(:kayak)
      expect(boat1.price).to eq(20)
      expect(boat1.hours_rented).to eq(0)
    end
  end
  
end