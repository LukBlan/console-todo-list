class SortCommand < Command
  def execute(todo_database, arguments, formatter)
    list_name = arguments[1]

    if !todo_database.have_list?(list_name)
      puts("list doesn't exit try again")
      return
    end

    todo_database.sort_list_by_deadline(list_name)
  end
end
