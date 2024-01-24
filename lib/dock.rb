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
end