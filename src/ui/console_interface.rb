class ConsoleInterface
  def initialize(todo_database, commands, formatter)
    @todo_database = todo_database
    @commands = commands
    @formatter = formatter
  end

  def init
    self.show_welcome_message
    puts
    self.show_program_instructions
    puts
    self.show_command_list
    puts
    self.command_line_interface_loop
    puts
    self.show_exit_message
  end

  def show_welcome_message
    puts("----------------------")
    puts(" Welcome to Todo List")
    puts("----------------------")
  end

  def show_program_instructions
    puts("Instructions: ")

    @formatter.print_formatted_message("Write commands in the console to Create, Delete, Read and Update Todos")
    @formatter.print_formatted_message("When you want to close the program write ExitCommand")
    @formatter.print_formatted_message("All you type is case insensitive")
  end

  def show_command_list
    puts("Command List: ")
    commands = @commands.all_commands

    commands.each do |command|
      @formatter.print_formatted_message(command.description)
    end
  end

  def command_line_interface_loop
    loop do
      print("Enter a Command: ")
      command = gets.chomp.downcase
      arguments = command.split(" ")
      command_name = arguments[0]

      if command == "exit"
        break
      elsif @commands.have_command?(command_name)
        command = @commands.get_command(command_name)
        command.execute(@todo_database, arguments)
      else
        @formatter.print_formatted_message("Invalid commands, Try again")
      end
    end
  end

  def show_exit_message
    puts("Bye!")
  end

end
