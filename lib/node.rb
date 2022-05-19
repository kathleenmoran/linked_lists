# frozen_string_literal: true

# an element of a linked list
class Node
  def initalize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
