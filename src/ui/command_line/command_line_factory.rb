require_relative '../commands/exit_command'
require_relative '../commands/ls_command'
require_relative '../commands/mklist_command'
require_relative '../commands/mktodo_command'
require_relative '../commands/show_all_command'
require_relative './command_line'

class CommandLineFactory
  def initialize
    @commands_hash = Hash.new
  end

  def build
    self.add_mk_list_command
    self.add_mk_todo_command
    self.add_ls_command
    self.add_show_all_command
    self.add_exit_command
    CommandLine.new(@commands_hash)
  end

  def add_mk_list_command
    name = "mklist"
    command = MklistCommand.new("mklist list_name: make a new list with the given name", 2)
    add(name, command)
  end

  def add_ls_command
    name = "ls"
    command = LsCommand.new("#{name}: print all lists names", 1)
    add(name, command)
  end

  def add_mk_todo_command
    name = "mktodo"
    desciption = "#{name} list_name item_title item_deadline(yyyy-mm-dd) optional_description: make a todo from given list"
    command = MktodoCommand.new(desciption, 4)
    add(name, command)
  end

  def add_exit_command
    name = "exit"
    command = ExitCommand.new("#{name}: terminate the program", 1)
    add(name, command)
  end

  def add_show_all_command
    name = "showall"
    command = ShowAllCommand.new("#{name}: print all list and items with format", 1)
    add(name, command)
  end

  def add(name, command)
    @commands_hash[name] = command
  end

end
