class PositiveAmountValidation
  def invalid_arguments?(todo_database, mapped_arguments)
    amount = mapped_arguments["amount"].to_i
    amount <= 0
  end

  def message(arguments)
    "insert a value greater than 0"
  end

  def name
    "positive_amount"
  end
end
