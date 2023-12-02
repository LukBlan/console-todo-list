class ShowAllCommand < Command
  def execute(todo_database, arguments, formatter)
    lists = todo_database.lists

    if lists.empty?
      formatter.print_formatted_message("You don't have any list, create one first")
      return
    end

    lists.each do |list|
      formatter.print_list(list)
    end
  end
end
