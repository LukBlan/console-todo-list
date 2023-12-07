class DownCommand < Command
  def execute(todo_database, arguments, formatter)
    list_name = arguments["list_name"]
    item_index = arguments["item_index"].to_i
    amount = arguments["amount"]
    todo_database.move_item_on_list(list_name, item_index, - amount.to_i)
  end

  def hash_arguments(arguments)
    mapped_arguments = Hash.new
    mapped_arguments["list_name"] = arguments[1]
    mapped_arguments["item_index"] = arguments[2]
    mapped_arguments["amount"] = arguments[3] || "1"
    mapped_arguments
  end
end
