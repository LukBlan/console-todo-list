require_relative './command'

class CommandsFactory
  def initialize
    @commands_hash = Hash.new
  end

  def build_commands_hash
    self.add_mklist_command
    self.add_exit_command
    @commands_hash
  end

  def add_exit_command
    exit_proc = Proc.new {}
    exit_command = Command.new("exit: terminate the program", 1, exit_proc)
    @commands_hash["exit"] = exit_command
  end

  def add_mklist_command
    mklist_proc = Proc.new do |todo_database, arguments|
      list_name = arguments[1]
      if todo_database.have_list?(list_name)
        puts("List already exits")
      else
        todo_database.create_list(list_name)
      end
    end

    mklist_command = Command.new("mklist <new_list_label>: make a new list with the given label", 2, mklist_proc)
    @commands_hash["mklist"] = mklist_command
  end

end
