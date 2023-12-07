class PurgeCommand < Command
  def execute(todo_database, arguments, formatter)
    list_name = arguments["list_name"]
    todo_database.remove_done_items_from_list(list_name)
  end

  def hash_arguments(arguments)
    mapped_arguments = Hash.new
    mapped_arguments["list_name"] = arguments[1]
    mapped_arguments
  end
end
