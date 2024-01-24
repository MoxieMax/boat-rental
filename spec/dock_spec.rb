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
  describe 'before each block' do
    before :each do
      dock1.rent(boat1, rent1)
      dock1.rent(boat2, rent1)
      dock1.rent(boat3, rent2)
    end
    
    describe '#hours_rented' do
      it 'determines the number of hours a boat has been rented' do
        expect(dock1.hours_rented(boat1)).to eq(0)
        expect(dock1.hours_rented(boat2)).to eq(0)
        expect(dock1.hours_rented(boat3)).to eq(0)
        
        boat1.add_hour
        boat1.add_hour
        boat2.add_hour
        
        expect(dock1.hours_rented(boat1)).to eq(2)
        expect(dock1.hours_rented(boat2)).to eq(1)
        expect(dock1.hours_rented(boat3)).to eq(0)
      end
      
      it 'prevents a boat from being rented for longer than allowed' do
        expect(dock1.hours_rented(boat1)).to eq(0)
        expect(dock1.max_rental_time).to eq(3)
        
        boat1.add_hour #1
        boat1.add_hour #2
        boat1.add_hour #3
        boat1.add_hour #4
        
        expect(dock1.hours_rented(boat1)).to eq(3)
      end
    end
    
    describe '#rental_cost' do
      it 'determines the cost of renting a boat based on time rented' do
        expect(dock1.hours_rented(boat1)).to eq(0)
        expect(dock1.rental_cost(boat2)).to eq(0)
        expect(dock1.rental_cost(boat1)).to eq(0)
        
        boat1.add_hour #1
        boat1.add_hour #2
        boat1.add_hour #3
        
        expect(dock1.rental_cost(boat1)).to eq(60)
        expect(dock1.rental_cost(boat2)).to eq(0)
      end
    end
    
    describe '#charge' do
      it 'takes a boat as an argument and returns a hash with charges' do
        expect(boat1.hours_rented).to eq(0)
        
        boat1.add_hour
        boat1.add_hour
        boat3.add_hour
        boat3.add_hour
        boat3.add_hour
        
        expect(boat1.hours_rented).to eq(2)
        
        expect(dock1.charge(boat1)).to eq({
                                          :card_number => "4242424242424242",
                                          :amount => 40
                                        })
        expect(dock1.charge(boat3)).to eq({
                                          :card_number => "1313131313131313",
                                          :amount => 45
                                        })
      end
    end
  end
end