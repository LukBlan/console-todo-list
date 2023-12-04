class Item
  def initialize(title, deadline, description="")
    @title = title
    @deadline = deadline
    @description = description
    @done = false
  end

  def info
    done_text = (@done)? "[✔]" : "[ ]"
    [@title, @deadline, done_text]
  end
end
