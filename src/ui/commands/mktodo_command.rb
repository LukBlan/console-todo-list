require_relative '../../domain/item'

class MktodoCommand < Command
  def execute(todo_database, arguments, formatter)
    list_name = arguments["list_name"]
    item_name = arguments["item_name"]
    item_deadline = arguments["item_deadline"]
    optional_description = arguments["optional_description"]

    item = Item.new(item_name, item_deadline, optional_description)
    todo_database.add_item(list_name, item)
  end

  def hash_arguments(arguments)
    mapped_arguments = Hash.new
    mapped_arguments["list_name"] = arguments[1]
    mapped_arguments["item_name"] = arguments[2]
    mapped_arguments["item_deadline"] = arguments[3]
    mapped_arguments["optional_description"] = arguments[4]
    mapped_arguments
  end
end
