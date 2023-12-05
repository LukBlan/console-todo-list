class DownCommand < Command
  def execute(todo_database, arguments, formatter)
    list_name = arguments[1]
    item_index = arguments[2].to_i
    amount = arguments[3]

    if !todo_database.have_list?(list_name)
      puts("list doesn't exit try again")
      return
    end

    if amount == nil
      todo_database.move_item_on_list(list_name, item_index)
    else
      todo_database.move_item_on_list(list_name, item_index, - amount.to_i)
    end
  end
end
