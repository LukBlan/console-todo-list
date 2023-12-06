require_relative '../commands/exit_command'
require_relative '../commands/ls_command'
require_relative '../commands/mklist_command'
require_relative '../commands/mktodo_command'
require_relative '../commands/show_all_command'
require_relative '../commands/toggle_command'
require_relative '../commands/rm_command'
require_relative '../commands/purge_command'
require_relative '../commands/up_command'
require_relative '../commands/down_command'
require_relative '../commands/swap_command'
require_relative '../commands/sort_command'
require_relative '../commands/priority_command'
require_relative '../commands/print_command'
require_relative './command_line'

class CommandLineFactory
  def initialize
    @commands_hash = Hash.new
  end

  def create
    self.add_mk_list_command
    self.add_mk_todo_command
    self.add_toggle_command
    self.add_rm_command
    self.add_purge_command
    self.add_sort_command
    self.add_up_command
    self.add_down_command
    self.add_swap_command
    self.add_ls_command
    self.add_show_all_command
    self.add_print_command
    self.add_priority_command
    self.add_exit_command

    CommandLine.new(@commands_hash)
  end

  def add_sort_command
    name = "sort"
    description = "[#{name} list_name]: sort list by deadline"
    command = SortCommand.new(description, [2])
    add(name, command)
  end

  def add_print_command
    name = "print"
    description = "[#{name} list_name optional_item_index]: print all items of the given list or specific item on list"
    command = PrintCommand.new(description, [2, 3])
    add(name, command)
  end

  def add_priority_command
    name = "priority"
    description = "[#{name} list_name]: swap the positions of the specified items on the given list"
    command = PriorityCommand.new(description, [2])
    add(name, command)
  end

  def add_swap_command
    name = "swap"
    description = "[#{name} list_name item_1_index item_2_index]: swap the positions of the specified items on the given list"
    command = SwapCommand.new(description, [4])
    add(name, command)
  end

  def add_rm_command
    name = "rm"
    description = "[#{name} list_name item_index]: remove the specified item on the given list"
    command = RmCommand.new(description, [3])
    add(name, command)
  end

  def add_down_command
    name = "down"
    description = "[#{name} list_name item_index optional_amount]: move the specified item higher on the given list"
    command = DownCommand.new(description, [3,4])
    add(name, command)
  end

  def add_up_command
    name = "up"
    description = "[#{name} list_name item_index optional_amount]: move the specified item lower on the given list"
    command = UpCommand.new(description, [3,4])
    add(name, command)
  end

  def add_purge_command
    name = "purge"
    description = "[#{name} list_name]: remove all 'done' items on the given list"
    command = PurgeCommand.new(description, [2])
    add(name, command)
  end

  def add_mk_list_command
    name = "mklist"
    command = MklistCommand.new("[mklist list_name]: make a new list with the given name", [2])
    add(name, command)
  end

  def add_ls_command
    name = "ls"
    command = LsCommand.new("[#{name}]: print all lists names", [1])
    add(name, command)
  end

  def add_toggle_command
    name = "toggle"
    description = "[#{name} list_name item_index]: toggle 'done' for the specified item on the given list"
    command = ToggleCommand.new(description, [3])
    add(name, command)
  end

  def add_mk_todo_command
    name = "mktodo"
    desciption = "[#{name} list_name item_title item_deadline(yyyy-mm-dd) optional_description]: make a todo from given list"
    command = MktodoCommand.new(desciption, [4,5])
    add(name, command)
  end

  def add_exit_command
    name = "exit"
    command = ExitCommand.new("[#{name}]: terminate the program", [1])
    add(name, command)
  end

  def add_show_all_command
    name = "showall"
    command = ShowAllCommand.new("[#{name}]: print all list and items with format", [1])
    add(name, command)
  end

  def add(name, command)
    @commands_hash[name] = command
  end

end
