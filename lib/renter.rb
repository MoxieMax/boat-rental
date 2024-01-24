class Renter
  attr_reader :name,
              :card_number
  
  def initialize(name, card)
    @name = name
    @card_number = card
  end
end