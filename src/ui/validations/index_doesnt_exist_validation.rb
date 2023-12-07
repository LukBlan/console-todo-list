# frozen_string_literal: true

class IndexDoesntExistValidation
  def invalid_arguments?(todo_database, mapped_arguments)
    list_name = mapped_arguments["list_name"]
    item_index = mapped_arguments["item_index"].to_i
    !todo_database.index_exist_on_list?(list_name, item_index)
  end

  def message(arguments)
    "item index doesn't exist on list"
  end

  def name
    "index_doesnt_exist"
  end
end
