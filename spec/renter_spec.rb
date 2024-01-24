require 'pry'
require './lib/boat'
require './lib/renter'

RSpec.describe Renter do
  # before :each do
    let (:rent1) {Renter.new("Patrick Star", "4242424242424242")}
    let (:boat1) {Boat.new(type: :kayak, price: 20)}
  # end
  
  describe '#Initialize' do
    it 'exists' do
      expect(rent1).to be_a(Renter)
    end
    
    it 'has attributes' do
      expect(rent1.name).to eq("Patrick Star")
      expect(rent1.card_number).to eq("4242424242424242")
    end
  end
end
