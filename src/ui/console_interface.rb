# frozen_string_literal: true

class ConsoleInterface
  def initialize
  end

  def init
    self.show_welcome_message
  end

  def show_welcome_message
    puts("----------------------")
    puts(" Welcome to Todo List")
    puts("----------------------")
  end
end
