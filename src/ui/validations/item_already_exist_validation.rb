class ItemAlreadyExistValidation
  def invalid_arguments?(todo_database, mapped_arguments)
    list_name = mapped_arguments["list_name"]
    item_name = mapped_arguments["item_title"]
    todo_database.list_have_item?(list_name, item_name)
  end

  def message(arguments)
    item_title = arguments["item_title"]
    "item '#{item_title}' already exist"
  end

  def name
    "item_exist"
  end
end
