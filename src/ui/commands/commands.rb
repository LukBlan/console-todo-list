class Commands
  attr_reader :commands_hash

  def initialize(commands)
    @commands_hash = commands
  end

  def all_commands
    @commands_hash.values
  end

  def have_command?(command_name)
    @commands_hash.has_key?(command_name)
  end
end
