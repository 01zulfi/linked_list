# frozen_string_literal: true

# Node class
class Node
  attr_reader :data
  attr_accessor :next_node

  def initialize(data = nil, next_node = nil)
    @data = data
    @next_node = next_node
  end
end

# LinkedList class
class LinkedList
end
