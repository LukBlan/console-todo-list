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

  def move_item(item_index, amount)
    amount ||= 1
    new_order_items = []
    computed_position = item_index - amount.to_i
    new_position = (computed_position < 0)? 0 : computed_position
    moved_item = get_item_by_index(item_index)

    @items.each_with_index do |item, index|
      if index == new_position
        new_order_items << moved_item
      end

      if index != item_index
        new_order_items << item
      end
    end

    @items = new_order_items
  end
end
