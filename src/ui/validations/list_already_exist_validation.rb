class ListAlreadyExistValidation
  def invalid_arguments?(todo_database, mapped_arguments)
    list_name = mapped_arguments["list_name"]
    todo_database.have_list?(list_name)
  end

  def message(arguments)
    list_name = arguments["list_name"]
    "list '#{list_name}' already exist"
  end

  def name
    "list_exist"
  end
end
