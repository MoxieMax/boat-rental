require 'pry'
require './lib/boat'
require './lib/renter'
require './lib/dock'

RSpec.describe Dock do
  # before :each do
    let (:dock1) {Dock.new("The Rowing Dock", 3)}
    
    let (:rent1) {Renter.new("Patrick Star", "4242424242424242")}
    let (:rent1) {Renter.new("Eugene Crabs", "1313131313131313")}
    
    let (:boat1) {Boat.new(type: :kayak, price: 20)}
    let (:boat2) {Boat.new(type: :kayak, price: 20)}
    let (:boat3) {Boat.new(type: :standup_paddle_board, price: 15)}
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
  
  describe '#rent' do
    it 'assigns a boat to a renter' do
      
    end
    
    it 'updates the #rental_log' do
      
    end
  end
end