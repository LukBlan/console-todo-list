require_relative './list'

class TodoDatabase
  def initialize
    @hash_of_lists = Hash.new
  end

  def have_list?(list_name)
    @hash_of_lists.has_key?(list_name)
  end

  def create_list(list_name)
    @hash_of_lists[list_name] = List.new(list_name)
  end

  def lists_names
    @hash_of_lists.keys
  end

  def lists
    @hash_of_lists.values
  end

  def add_item(list_name, item)
    list = @hash_of_lists[list_name]
    list.add_item(item)
  end

  def toggle_todo(list_name, item_index)
    list = @hash_of_lists[list_name]
    list.toggle_element_by_index(item_index)
  end
end