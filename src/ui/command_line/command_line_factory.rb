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
    @commands = [
      MklistCommand.new(
        "mklist",
        "[mklist list_name]: make a new list with the given name",
        [2]),
      MktodoCommand.new(
        "mktodo",
        "[mktodo list_name item_title item_deadline(yyyy-mm-dd) optional_description]: make a todo from given list",
        [4,5]
      ),
      ToggleCommand.new(
        "toggle",
        "[toggle list_name item_index]: toggle 'done' for the specified item on the given list",
        [3]
      ),
      RmCommand.new(
        "rm",
        "[rm list_name item_index]: remove the specified item on the given list",
        [3]
      ),
      PurgeCommand.new(
        "purge",
        "[purge list_name]: remove all 'done' items on the given list",
        [2]
      ),
      UpCommand.new(
        "up",
        "[up list_name item_index optional_amount]: move the specified item lower on the given list",
        [3,4]
      ),
      DownCommand.new(
        "down",
        "[down list_name item_index optional_amount]: move the specified item higher on the given list",
        [3,4]
      ),
      SortCommand.new(
        "sort",
        "[sort list_name]: sort list by deadline",
        [2]
      ),
      SwapCommand.new(
        "swap",
        "[swap list_name item_1_index item_2_index]: swap the positions of the specified items on the given list",
        [4]
      ),
      LsCommand.new(
        "ls",
        "[ls]: print all lists names",
        [1]
      ),
      ShowAllCommand.new(
        "showall",
        "[showall print all list and items with format",
        [1]
      ),
      PrintCommand.new(
        "print",
        "[print list_name optional_item_index]: print all items of the given list or specific item on list",
        [2, 3]
      ),
      PriorityCommand.new(
        "priority",
        "[priority list_name]: swap the positions of the specified items on the given list",
        [2]
      ),
      ExitCommand.new(
        "exit",
        "[exit]: terminate the program",
        [1]
      )
    ]
  end

  def create
    @commands.each { |command| add(command) }
    CommandLine.new(@commands_hash)
  end


  def add(command)
    name = command.name
    @commands_hash[name] = command
  end

end
