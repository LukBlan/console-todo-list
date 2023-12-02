require_relative './command'

class MklistCommand < Command
  def execute(todo_database, arguments, formatter)
    list_name = arguments[1]

    if todo_database.have_list?(list_name)
      formatter.print_formatted_message("list '#{list_name}' already exits")
    else
      todo_database.create_list(list_name)
    end
  end
end
