class PriorityCommand < Command
  def execute(todo_database, arguments, formatter)
    list_name = arguments[1]

    if !todo_database.have_list?(list_name)
      puts("list doesn't exit try again")
      return
    end

    item = todo_database.get_priority_item_from_list(list_name)
    formatter.print_item(item)
  end
end
