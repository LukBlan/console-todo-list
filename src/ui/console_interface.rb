# frozen_string_literal: true

class ConsoleInterface
  def initialize
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
    print_formatted_message("Write commands in the console to Create, Delete, Read and Update Todos")
    print_formatted_message("When you want to close the program write Exit")
    print_formatted_message("All you type is case insensitive")
  end

  def print_formatted_message(message)
    puts("    - #{message}")
  end

  def show_command_list
    puts("Commands: ")
    print_formatted_message("exit")
  end

  def command_line_interface_loop
    loop do
      print("Enter a Command: ")
      command = gets.chomp.downcase

      if command == "exit"
        break
      end

      print_formatted_message("Invalid command, Try again")
    end
  end

  def show_exit_message
    puts("Bye!")
  end

end
