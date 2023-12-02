require_relative '../../domain/item'

class MktodoCommand < Command
  def execute(todo_database, arguments, formatter)
    list_name = arguments[1]
    item_name = arguments[2]
    item_deadline = arguments[3]
    optional_description = arguments[4]

    if todo_database.have_list?(list_name)
      item = Item.new(item_name, item_deadline, optional_description)
      todo_database.add_item(list_name, item)
    else
      formatter.print_formatted_message("list '#{list_name}' doesn't exist, create it first")
    end

  end
end
