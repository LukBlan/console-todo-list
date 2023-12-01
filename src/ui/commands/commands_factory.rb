require_relative './command'

class CommandsFactory
  def initialize
    @commands_hash = Hash.new
  end

  def build_commands_hash
    self.add_exit_command
    self.add_mklist_command
    @commands_hash
  end

  def add_exit_command
    exit_proc = Proc.new {}
    exit_command = Command.new("exit: terminate the program", 1, exit_proc)
    @commands_hash["exit"] = exit_command
  end

  def add_mklist_command
    mklist_proc = Proc.new {}
    mklist_command = Command.new("mklist <new_list_label>: make a new list with the given label", 2, mklist_proc)
    @commands_hash["mklist"] = mklist_command
  end

end
