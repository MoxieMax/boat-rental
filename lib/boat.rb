class Boat
  attr_reader :type,
              :price
  
  def initialize(attributes)
    @type = attributes.fetch(:type)
    @price = attributes.fetch(:price)
  end
end