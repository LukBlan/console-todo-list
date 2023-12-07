class PrintCommand < Command
  def execute(todo_database, arguments, formatter)
    list_name = arguments["list_name"]
    item_index = arguments["item_index"]
    list = todo_database.get_list_by_name(list_name)

    if item_index == nil
      formatter.print_list(list)
    else
      item = list.get_item_by_index(item_index.to_i)
      formatter.print_item(item)
    end
  end

  def hash_arguments(arguments)
    mapped_arguments = Hash.new
    mapped_arguments["list_name"] = arguments[1]
    mapped_arguments["item_index"] = arguments[2]
    mapped_arguments
  end
end
