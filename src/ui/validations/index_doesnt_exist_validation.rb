# frozen_string_literal: true

class IndexDoesntExistValidation
  def invalid_arguments?(todo_database, mapped_arguments)
    list_name = mapped_arguments["list_name"]
    check_values = mapped_arguments["item_index"]

    if check_values == nil
      return false
    end

    if !check_values.is_a?(Array)
      check_values = [check_values]
    end

    check_values.any? do |item_index|
      !todo_database.index_exist_on_list?(list_name, item_index.to_i)
    end
  end

  def message(arguments)
    "item index doesn't exist on list"
  end

  def name
    "index_doesnt_exist"
  end
end
