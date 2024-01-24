require 'pry'
require './lib/boat'
require './lib/renter'
require './lib/dock'

RSpec.describe Dock do
  # before :each do
    let (:dock1) {Dock.new("The Rowing Dock", 3)}
    let (:rent1) {Renter.new("Patrick Star", "4242424242424242")}
    let (:boat1) {Boat.new(type: :kayak, price: 20)}
  # end
  describe '#initialize' do
    it 'exists' do
      expect(dock1).to be_a(Dock)
    end
    
    it 'has attributes' do
      expect(dock1.name).to eq("The Rowing Dock")
      expect(dock1.max_rental_time).to eq(3)
    end
  end
end