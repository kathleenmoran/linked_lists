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
      at(size - 1)
    end
  end

  def at(index)
    if index >= 0
      cur = @head
      index.times do
        return cur if cur.nil?

        cur = cur.next_node
      end
      return cur
    end
    nil
  end

  def pop
    if head.nil? || head.next_node.nil?
      @head = nil
    else
      at(size - 2).next_node = nil
    end
    self
  end

  def contains?(value)
    !find(value).nil?
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

  def insert_at(value, index)
    if index.between?(0, size)
      if index.zero?
        prepend(value)
      elsif index == size
        append(value)
      else
        at(index - 1).next_node = Node.new(value, at(index))
      end
    end
    self
  end

  def remove_at(index)
    if index.between?(0, size - 1)
      if index.zero?
        @head = @head.next_node
      else
        at(index - 1).next_node = index == size - 1 ? nil : at(index + 1)
      end
    end
    self
  end
end
