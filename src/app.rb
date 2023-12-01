require_relative './ui/console_interface'
require_relative './ui/commands/commands'
require_relative './ui/commands/commands_factory'

commands_factory = CommandsFactory.new
commands_hash = commands_factory.build_commands_hash
commands = Commands.new(commands_hash)
console_interface = ConsoleInterface.new(commands)
console_interface.init