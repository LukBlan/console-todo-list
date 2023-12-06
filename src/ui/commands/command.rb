class Command
  ITEM_NAME_MAX_LENGTH = 19
  ABSTRACT_CLASS_ERROR = "Class is a Abstract class"
  attr_reader :name, :description, :arguments

  def initialize(name, description, number_arguments, validations)
    @name = name
    @description = description
    @number_arguments = number_arguments
    @validations = validations
  end

  def execute(database, mapped_arguments, formatter)
    raise ABSTRACT_CLASS_ERROR
  end

  def incorrect_number_of_arguments(number)
    !@number_arguments.include?(number)
  end

  def map_arguments(arguments)
    hash = Hash.new
    max_arguments_amount = @number_arguments[-1]
    hash["extra"] = arguments[(max_arguments_amount + 1)..-1] || []
    hash
  end

  def count_arguments(mapped_arguments)
    arguments_amount = mapped_arguments.count do |key, value|
      key != "extra" && value != nil
    end

    extra_arguments_amount = mapped_arguments["extra"].length

    arguments_amount + extra_arguments_amount
  end

  def valid_command?(todo_database, mapped_arguments, formatter)
    arguments_count = self.count_arguments(mapped_arguments)

    if self.incorrect_number_of_arguments(arguments_count)
      formatter.print_formatted_message("Incorrect number of arguments")
      return false
    end
    
    @validations.each do |validation|
      if validation.invalid_arguments?(todo_database, mapped_arguments)
        message = validation.message(mapped_arguments)
        formatter.print_formatted_message(message)
        return false
      end
    end

    true
  end
end
