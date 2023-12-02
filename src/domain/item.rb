# frozen_string_literal: true

class Item
  attr_reader :name, :deadline, :description

  def initialize(name, deadline, description="")
    @name = name
    @deadline = deadline
    @description = description
    @done = false
  end
end
