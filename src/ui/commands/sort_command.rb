class SortCommand < Command
  def execute(todo_database, arguments, formatter)
    list_name = arguments["list_name"]
    todo_database.sort_list_by_deadline(list_name)
  end

  def hash_arguments(arguments)
    mapped_arguments = Hash.new
    mapped_arguments["list_name"] = arguments[1]
    mapped_arguments
  end
end
