# frozen_string_literal: true

class DeadlineFormatValidation
  def invalid_arguments?(todo_database, mapped_arguments)
    item_deadline = mapped_arguments["item_deadline"]
    self.invalid_format?(item_deadline)
  end

  def invalid_format?(item_deadline)
    deadline_array = item_deadline.split("/")

    if deadline_array.length != 3
      return true
    end

    year = deadline_array[0]
    month = deadline_array[1]
    day = deadline_array[2]

    if year.length != 4
      return true
    end

    if month.length != 2
      return true
    end

    day.length != 2
  end

  def message(arguments)
    "invalid deadline format, correct format: yyyy/mm/dd"
  end

  def name
    "deadline_format"
  end
end
