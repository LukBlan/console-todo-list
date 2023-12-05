class PriorityCommand < Command
  def execute(todo_database, arguments, formatter)
    list_name = arguments[1]

    if !todo_database.have_list?(list_name)
      puts("list doesn't exit try again")
      return
    end

    item = todo_database.get_priority_item_from_list(list_name)
    item_entry = formatter.item_entry(item)
    formatter.print_formatted_message(item_entry)
  end
end
