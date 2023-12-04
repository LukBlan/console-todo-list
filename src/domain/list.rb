class List
  attr_reader :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def toggle_element_by_index(index)
    item = @items[index]
    item.toggle
  end
end
