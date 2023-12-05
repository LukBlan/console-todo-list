class ConsoleInterface
  def initialize(todo_database, command_line, formatter)
    @todo_database = todo_database
    @command_line = command_line
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
    self.show_exit_message
  end

  def show_welcome_message
    line = @formatter.get_dash_line
    text = @formatter.get_text_in_middle("Welcome to Todo List")

    puts(line)
    puts(text)
    puts(line)
  end

  def show_program_instructions
    puts("Instructions: ")

    @formatter.print_formatted_message("Write commands in the console to Create, Delete, Read and Update Todos")
    @formatter.print_formatted_message("When you want to close the program write exit")
    @formatter.print_formatted_message("All you type is case insensitive and lowercase by default")
    @formatter.print_formatted_message("You need to write commands without brackets")
  end

  def show_command_list
    puts("Commands: ")
    commands = @command_line.all_commands

    commands.each do |command|
      @formatter.print_formatted_message(command.description)
    end
  end

  def command_line_interface_loop
    loop do
      user_input = get_user_input
      arguments = user_input.split(" ")
      command_name = arguments[0]

      if command_name == "exit"
        break
      elsif @command_line.have_command?(command_name)
        command = @command_line.get_command(command_name)

        if command.incorrect_number_of_arguments(arguments.length)
          @formatter.print_formatted_message("Incorrect number of arguments")
        else
          command.execute(@todo_database, arguments, @formatter)
        end

      else
        @formatter.print_formatted_message("Invalid commands, Try again")
      end

      puts
    end
  end

  def show_exit_message
    @formatter.print_formatted_message("Bye!")
  end

  def get_user_input
    print("Enter a Command: ")
    gets.chomp.downcase
  end

end
