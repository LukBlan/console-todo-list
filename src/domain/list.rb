class List
  attr_reader :name

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
