class RmCommand < Command
  def execute(todo_database, arguments, formatter)
    list_name = arguments[1]
    item_index = arguments[2].to_i

    if !todo_database.have_list?(list_name)
      puts("list doesn't exit try again")
      return
    end

    todo_database.remove_item_from_list(list_name, item_index)

  end
end