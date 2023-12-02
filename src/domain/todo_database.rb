require_relative './list'

class TodoDatabase
  def initialize
    @hash_of_lists = Hash.new
  end

  def have_list?(list_name)
    @hash_of_lists.has_key?(list_name)
  end

  def create_list(list_name)
    @hash_of_lists[list_name] = List.new
  end

  def lists_names
    @hash_of_lists.keys
  end

  def add_item(list_name, item)
    list = @hash_of_lists[list_name]
    list.add_item(item)
  end
end
