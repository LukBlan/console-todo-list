class SwapCommand < Command
  def execute(todo_database, arguments, formatter)
    list_name = arguments["list_name"]
    first_index = arguments["item_index"][0].to_i
    second_index = arguments["item_index"][1].to_i
    todo_database.swap(list_name, first_index, second_index)
  end

  def hash_arguments(arguments)
    mapped_arguments = Hash.new
    mapped_arguments["list_name"] = arguments[1]
    mapped_arguments["item_index"] = [arguments[2], arguments[3]]
    mapped_arguments["amount"] = arguments[3] || "1"
    mapped_arguments
  end
end
