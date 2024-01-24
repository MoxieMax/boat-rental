class Dock
  attr_reader :name,
              :max_rental_time,
              :rental_log
  
  def initialize(name, time)
    @name = name
    @max_rental_time = time
    @rental_log = Hash.new
  end
  
  def rent(boat, renter)
    # @rental_log = {boat => renter} #Didn't work, would just replace the whole hash
    
    @rental_log.store(boat, renter)
  end
  
  def charge(boat)
    Hash.new({
              :card_number => "card from customer",
              :amount => "Need to use Boat.hours_rented * Boat.time to get :amount"
            })
    # Need to prevent a Boat from being rented longer than Dock max_rental_time 
    # Need to use Boat.hours_rented * Boat.time to get :amount
  end
end