class Command
  attr_reader :description, :arguments

  def initialize(description, arguments, proc)
    @description = description
    @arguments = arguments
    @proc = proc
  end

  def execute(database, arguments)
    @proc.call(database, arguments)
  end
end
