class ToggleCommand < Command
  def execute(todo_database, arguments, formatter)
    list_name = arguments["list_name"]
    item_index = arguments["item_index"].to_i
    todo_database.toggle_item_from_list(list_name, item_index)
  end

  def hash_arguments(arguments)
    mapped_arguments = Hash.new
    mapped_arguments["list_name"] = arguments[1]
    mapped_arguments["item_index"] = arguments[2]
    mapped_arguments
  end
end
