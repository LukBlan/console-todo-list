class Command
  attr_reader :description, :arguments

  def initialize(description, number_arguments)
    @description = description
    @number_arguments = number_arguments
  end

  def execute(database, arguments, formatter)
    raise "Class is a Abstract class"
  end
end
