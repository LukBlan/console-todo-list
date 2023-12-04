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
end
