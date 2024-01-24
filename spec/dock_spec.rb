require 'pry'
require './lib/boat'
require './lib/renter'
require './lib/dock'

RSpec.describe Dock do
  # before :each do
    let (:boat1) {Boat.new(type: :kayak, price: 20)}
    let (:boat2) {Boat.new(type: :kayak, price: 20)}
    let (:boat3) {Boat.new(type: :standup_paddle_board, price: 15)}
    
    let (:rent1) {Renter.new("Patrick Star", "4242424242424242")}
    let (:rent2) {Renter.new("Eugene Crabs", "1313131313131313")}
    
    let (:dock1) {Dock.new("The Rowing Dock", 3)}
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
    it 'assigns a boat to a renter and updates the #rental_log' do
      expect(dock1.rental_log).to eq({})
      
      dock1.rent(boat1, rent1)
      dock1.rent(boat2, rent1)
      dock1.rent(boat3, rent2)
      
      expect(dock1.rental_log).to eq({
                                      boat1 => rent1,
                                      boat2 => rent1,
                                      boat3 => rent2
                                    })
    end
  end
end