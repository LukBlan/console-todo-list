class MklistCommand < Command
  def execute(todo_database, arguments, formatter)
    list_name = arguments["list_name"]
    todo_database.create_list(list_name)
  end

  def map_arguments(arguments)
    mapped_arguments = super(arguments)
    mapped_arguments["list_name"] = arguments[1]
    mapped_arguments
  end
end
