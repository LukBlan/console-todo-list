class PurgeCommand < Command
  def execute(todo_database, arguments, formatter)
    list_name = arguments[1]

    if !todo_database.have_list?(list_name)
      puts("list doesn't exit try again")
      return
    end

    todo_database.remove_done_items_from_list(list_name)
  end
end
