class CommandLine
  attr_reader :commands_hash

  def initialize(commands_hash)
    @commands_hash = commands_hash
  end

  def all_commands
    @commands_hash.values
  end

  def have_command?(command_name)
    @commands_hash.has_key?(command_name)
  end

  def get_command(command_name)
    @commands_hash[command_name]
  end

end
