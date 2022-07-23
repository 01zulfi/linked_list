# frozen_string_literal: true

require_relative './node'

# LinkedList class
class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(value)
    if head_empty?
      @head = Node.new(value)
      return
    end

    tail = last_node
    tail.next_node = Node.new(value)
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def size
    return 0 if head_empty?

    current = @head
    counter = 0
    until current.next_node.nil?
      counter += 1
      current = current.next_node
    end
    counter + 1
  end

  def tail
    return nil if head_empty?

    last_node
  end

  def at(index)
    return nil if head_empty?

    current = @head
    iteration = 0
    until current.next_node.nil?
      break if iteration == index

      iteration += 1
      current = current.next_node
    end

    return nil unless iteration == index

    current
  end

  def pop
    return if head_empty?

    current = @head
    previous = nil

    until current.next_node.nil?
      previous = current
      current = current.next_node
    end

    # rubocop:disable Lint/UselessAssignment
    current = nil
    # rubocop:enable Lint/UselessAssignment
    previous.next_node = nil
  end

  def contains?(value)
    return false if head_empty?
    return true if @head.value == value

    current = @head

    until current.next_node.nil?
      current = current.next_node
      return true if current.value == value
    end
    false
  end

  def find(value)
    return 'Not found.' if head_empty?

    current = @head
    index = 0

    until current.next_node.nil?
      break if current.value == value

      index += 1
      current = current.next_node
    end

    return 'Not found.' unless current.value == value

    index
  end

  def insert_at(value, index)
    return 'Not possible.' if head_empty? && !index.zero?
    return 'Not possible.' unless index.between?(0, size)

    return prepend(value) if index.zero?

    current = at(index)
    previous = at(index - 1)
     
    previous.next_node = Node.new(value, current)
  end

  def remove_at(index)
    return 'Not possible.' if head_empty?
    return 'Not possible.' unless index.between?(0, size - 1)

    if index.zero?
      @head = @head.next_node
      return
    end

    to_remove = at(index)
    previous = at(index - 1)

    previous.next_node = to_remove.next_node
    to_remove = nil
  end

  def to_s
    return '( nil )' if head_empty?

    nodes = []
    current = @head
    nodes << current.value
    until current.next_node.nil?
      current = current.next_node
      nodes << current.value
    end
    nodes.map { |value| "( #{value} ) -> " }.push(' nil').join
  end

  private

  def head_empty?
    @head.nil?
  end

  def last_node
    current = @head
    current = current.next_node until current.next_node.nil?
    current
  end
end
