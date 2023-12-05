class SwapCommand < Command
  def execute(todo_database, arguments, formatter)
    list_name = arguments[1]
    first_index = arguments[2].to_i
    second_index = arguments[3].to_i

    if !todo_database.have_list?(list_name)
      puts("list doesn't exit try again")
      return
    end

    todo_database.swap(list_name, first_index, second_index)
  end

end
