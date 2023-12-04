class MessagePrintFormatter
  CONSOLE_LINE_LENGTH= 48
  LIST_TABLE_SPACES = [6, 20, 11, 5]
  LIST_TABLE_WORDS = ["Index", "Item", "Deadline", "Done"]


  def print_formatted_message(message)
    puts("    - #{message}")
  end

  def print_list(list)
    list_name = list.name
    list_items = list.items
    line = self.get_dash_line
    list_name_in_middle = self.get_text_in_middle(list_name)
    list_table_header = get_formatted_entry_of_table(LIST_TABLE_WORDS)

    puts(line)
    puts(list_name_in_middle)
    puts(line)
    puts(list_table_header)
    puts(line)

    list_items.each_with_index do |item, index|
      item_info = [index] + item.info
      item_entry = get_formatted_entry_of_table(item_info)
      puts(item_entry)
    end

  end

  def get_dash_line
    line = ""
    CONSOLE_LINE_LENGTH.times do
      line += "-"
    end

    line
  end

  def get_text_in_middle(text)
    text_in_middle = ""
    middle_point = CONSOLE_LINE_LENGTH / 2
    white_spaces_amount = middle_point - text.length / 2

    white_spaces_amount.times do
      text_in_middle += " "
    end

    text_in_middle + text[0].upcase + text[1..-1]
  end

  def get_formatted_entry_of_table(info)
    table_entry = ""

    info.each_with_index do |element, index|
      word = element.to_s

      table_entry += word
      spaces_amount = LIST_TABLE_SPACES[index] - word.length
      spaces_amount.times { table_entry += " " }

      if index != info.length - 1
        table_entry += "| "
      end
    end

    table_entry
  end
end
