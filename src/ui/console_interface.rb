class ConsoleInterface
  def initialize(commands)
    @commands = commands
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
    @command

    print_formatted_message("Write commands in the console to Create, Delete, Read and Update Todos")
    print_formatted_message("When you want to close the program write ExitCommand")
    print_formatted_message("All you type is case insensitive")
  end

  def print_formatted_message(message)
    puts("    - #{message}")
  end

  def show_command_list
    puts("Commands: ")
    commands = @commands.all_commands

    commands.each do |command|
      print_formatted_message(command.description)
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
        puts("Have it")
      else
        print_formatted_message("Invalid commands, Try again")
      end
    end
  end

  def show_exit_message
    puts("Bye!")
  end

end
