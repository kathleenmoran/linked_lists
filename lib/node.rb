# frozen_string_literal: true

# an element of a linked list
class Node
  attr_reader :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def to_s
    "( #{@value} ) -> "
  end
end
