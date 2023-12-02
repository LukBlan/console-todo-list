class LsCommand < Command
  def execute(todo_database, arguments, formatter)
    lists_names = todo_database.lists_names

    if lists_names.empty?
      formatter.print_formatted_message("You don't have any list, create one first")
    else
      lists_names.each do |name|
        formatter.print_formatted_message(name)
      end
    end
  end
end
