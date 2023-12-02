# frozen_string_literal: true

class MessagePrintFormatter
  CONSOLE_LINE_length= 48

  def print_formatted_message(message)
    puts("    - #{message}")
  end

  def print_list(list)
    list_name = list.name
    line = self.get_dash_line
    list_name_in_middle = self.get_text_in_middle(list_name)
    table_title = self.get_list_table_title

    puts(line)
    puts(list_name_in_middle)
    puts(line)
    puts(table_title)
    puts(line)
  end

  def get_dash_line
    line = ""
    CONSOLE_LINE_length.times do
      line += "-"
    end

    line
  end

  def get_text_in_middle(text)
    text_in_middle = ""
    middle_point = CONSOLE_LINE_length / 2
    white_spaces_amount = middle_point - text.length / 2

    white_spaces_amount.times do
      text_in_middle += " "
    end

    text_in_middle + text[0].upcase + text[1..-1]
  end

  def get_list_table_title
    "Index | Item                | Deadline   | Done"
  end
end
