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
    {
      :card_number => @rental_log[boat].card_number,
      :amount => rental_cost(boat)
    }
  end
  
  def hours_rented(boat)
    [boat.hours_rented, @max_rental_time].min
  end
  
  def rental_cost(boat)
    hours_rented(boat) * boat.price
  end
end