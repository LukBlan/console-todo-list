class PriorityCommand < Command
  def execute(todo_database, arguments, formatter)
    list_name = arguments["list_name"]
    item = todo_database.get_priority_item_from_list(list_name)
    formatter.print_item(item)
  end

  def hash_arguments(arguments)
    mapped_arguments = Hash.new
    mapped_arguments["list_name"] = arguments[1]
    mapped_arguments
  end
end
