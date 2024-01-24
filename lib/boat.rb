class Boat
  attr_reader :type,
              :price,
              :hours_rented
  
  def initialize(attributes)
    @type = attributes.fetch(:type)
    @price = attributes.fetch(:price)
    @hours_rented = 0
  end
end