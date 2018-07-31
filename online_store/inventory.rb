

class Inventory

  # attr_reader :seller, :buyer, :store

  def initialize (items)
    @items = {buttplug: 40, farts: 10, chips: 5}
  end

  def display
    puts @items
  end


end
