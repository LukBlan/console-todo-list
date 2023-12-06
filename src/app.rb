require_relative './ui/console_interface'
require_relative './ui/command_line/command_line_factory'
require_relative './domain/todo_database'
require_relative './ui/message_print_formatter'
require_relative './ui/validations/validations_register'

todo_database = TodoDatabase.new
message_print_formatter = MessagePrintFormatter.new

validation_register = ValidationsRegister.new
validations = validation_register.validations

command_line_factory = CommandLineFactory.new(validations)
command_line = command_line_factory.create

console_interface = ConsoleInterface.new(todo_database, command_line, message_print_formatter)
console_interface.init