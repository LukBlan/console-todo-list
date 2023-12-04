class Command
  ITEM_NAME_MAX_LENGTH = 19
  ABSTRACT_CLASS_ERROR = "Class is a Abstract class"
  attr_reader :description, :arguments

  def initialize(description, number_arguments)
    @description = description
    @number_arguments = number_arguments
  end

  def execute(database, arguments, formatter)
    raise ABSTRACT_CLASS_ERROR
  end

  def incorrect_number_of_arguments(number)
    number != @number_arguments
  end
end
