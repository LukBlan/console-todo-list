class Command
  ITEM_NAME_MAX_LENGTH = 19
  ABSTRACT_CLASS_ERROR = "Class is a Abstract class"
  attr_reader :name, :description, :arguments

  def initialize(name, description, number_arguments)
    @name = name
    @description = description
    @number_arguments = number_arguments
  end

  def execute(database, arguments, formatter)
    raise ABSTRACT_CLASS_ERROR
  end

  def incorrect_number_of_arguments(number)
    !@number_arguments.include?(number)
  end
end
