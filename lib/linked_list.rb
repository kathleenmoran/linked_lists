# frozen_string_literal: true

require_relative 'node'

# a series of nodes that are linked together
class LinkedList
  attr_reader :head

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

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      tail.next_node = Node.new(value)
    end
    self
  end

  def prepend(value)
    @head = Node.new(value, @head)
    self
  end

  def size
    length = 0
    cur = @head
    until cur.nil?
      length += 1
      cur = cur.next_node
    end
    length
  end

  def tail
    if @head.nil?
      @head
    else
      cur = @head
      cur = cur.next_node until cur.next_node.nil?
      cur
    end
  end

  def at(index)
    cur = @head
    index.times do
      break if cur.nil?

      cur = cur.next_node
    end
    cur
  end

  def pop
    if head.nil? || head.next_node.nil?
      @head = nil
    else
      prev = @head
      cur = @head.next_node
      until cur.next_node.nil?
        prev = prev.next_node
        cur = cur.next_node
      end
      prev.next_node = nil
    end
    self
  end

  def contains?(value)
    unless @head.nil?
      cur = @head
      until cur.nil?
        return true if cur.value == value

        cur = cur.next_node
      end
    end
    false
  end

  def find(value)
    index = 0
    unless @head.nil?
      cur = @head
      until cur.nil?
        return index if cur.value == value

        cur = cur.next_node
        index += 1
      end
    end
    nil
  end
end
