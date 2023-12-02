require_relative './ui/console_interface'
require_relative './ui/commands/command_line'
require_relative './ui/commands/commands_factory'
require_relative './domain/todo_database'
require_relative './ui/message_print_formatter'

todo_database = TodoDatabase.new
message_print_formatter = MessagePrintFormatter.new

# Create object responsible of creating commands of command-line
commands_factory = CommandsFactory.new(message_print_formatter)

# commands_hash -> hash of commands available on command-line interface
commands_hash = commands_factory.build_commands_hash
commands = CommandLine.new(commands_hash)

console_interface = ConsoleInterface.new(todo_database, commands, message_print_formatter)
console_interface.init