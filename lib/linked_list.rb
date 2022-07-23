# frozen_string_literal: true

require_relative './node'

# LinkedList class
class LinkedList
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
