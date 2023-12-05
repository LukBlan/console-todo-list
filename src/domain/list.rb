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
    new_position = item_index - amount
    new_position = (new_position < 0)? 0 : new_position
    new_position = (new_position > @items.length - 1)? @items.length - 1 : new_position
    current_index = item_index
    swaps = (amount).abs

    while new_position != current_index && swaps > 0
      delta = (current_index > new_position)? -1 : 1
      next_position = current_index + delta
      @items[current_index], @items[next_position] = @items[next_position], @items[current_index]

      current_index += delta
      swaps -= 1
    end
  end

  def swap(first_index, second_index)
    @items[first_index], @items[second_index] = @items[second_index], @items[first_index]
  end

  def sort_by_deadline
    unsorted = true
    i = 0

    while unsorted
      unsorted = false
      list_last_index = @items.length - 1

      j = 0
      while j < list_last_index - 1 - i
        first_item = @items[j]
        next_item = @items[j + 1]

        if next_item.has_early_deadline?(first_item)
          swap(j, j+1)
          unsorted = true
        end

        j += 1
      end

      i += 1
    end

  end
end
