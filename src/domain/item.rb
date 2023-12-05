class Item
  attr_reader :title, :deadline, :done

  def initialize(title, deadline, description="")
    @title = title
    @deadline = deadline
    @description = description
    @done = false
  end

  def toggle
    @done = !@done
  end

  def has_early_deadline?(compare_item)
    item_deadline_array = get_deadline_as_array
    compare_deadline_array = compare_item.get_deadline_as_array

    item_year = item_deadline_array[0]
    compare_year = compare_deadline_array[0]
    if item_year < compare_year
      return true
    elsif item_year > compare_year
      return false
    end

    item_month = item_deadline_array[1]
    compare_month = compare_deadline_array[1]
    if item_month < compare_month
      return true
    elsif item_month > compare_month
      return false
    end

    return item_deadline_array[2] < compare_deadline_array[2]
  end

  def get_deadline_as_array
    @deadline.split("/").map { |element| element.to_i}
  end
end
