# frozen_string_literal: true

require_relative 'node'

# a series of nodes that are linked together
class LinkedList
  def initialize(head)
    @head = head
  end

  def to_s
    cur = @head
    result = ''
    until cur.nil?
      result += cur.to_s
      cur = cur.next_node
    end
    "#{result}nil"
  end
end
