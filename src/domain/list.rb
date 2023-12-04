class List
  attr_reader :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def toggle_item_by_index(index)
    item = get_item_by_index(index)
    item.toggle
  end

  def remove_item_by_index(index)
    @items.delete_at(index)
  end

  def get_item_by_index(index)
    @items[index]
  end

  def remove_done_items
    @items = @items.reject { |item| item.done }
  end
end
