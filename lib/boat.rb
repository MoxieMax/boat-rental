class Boat
  attr_reader :type,
              :price,
              :hours_rented
  
  def initialize(attributes)
    @type = attributes.fetch(:type)
    @price = attributes.fetch(:price)
    @hours_rented = 0
  end
  
  def add_hour
    @hours_rented += 1
    
    # Need to prevent a Boat from being rented longer than Dock max_rental_time 
  end
  
end