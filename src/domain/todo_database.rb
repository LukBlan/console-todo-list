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
    list = get_list_by_name(list_name)
    list.add_item(item)
  end

  def toggle_item_from_list(list_name, item_index)
    list = get_list_by_name(list_name)
    list.toggle_item_by_index(item_index)
  end

  def remove_item_from_list(list_name, item_index)
    list = get_list_by_name(list_name)
    list.remove_item_by_index(item_index)
  end

  def get_list_by_name(list_name)
    @hash_of_lists[list_name]
  end

  def remove_done_items_from_list(list_name)
    list = get_list_by_name(list_name)
    list.remove_done_items
  end

  def move_item_on_list(list_name, item_index, amount)
    list = get_list_by_name(list_name)
    list.move_item(item_index, amount)
  end

  def swap(list_name, first_index, second_index)
    list = get_list_by_name(list_name)
    list.swap(first_index, second_index)
  end

  def sort_list_by_deadline(list_name)
    list = get_list_by_name(list_name)
    list.sort_by_deadline
  end

  def get_priority_item_from_list(list_name)
    list = get_list_by_name(list_name)
    list.get_priority_item
  end

  def list_have_item?(list_name, item_title)
    list = get_list_by_name(list_name)
    list.have_item?(item_title)
  end

  def index_exist_on_list?(list_name, item_index)
    list = get_list_by_name(list_name)
    list.index_exist?(item_index)
  end

end
