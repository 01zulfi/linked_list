# frozen_string_literal: true

require_relative './linked_list'

linked_list = LinkedList.new
linked_list.prepend(1)
linked_list.prepend(2)
linked_list.append(2222)
linked_list.prepend(3)
linked_list.append(0)
linked_list.append(-1)
linked_list.append(21)
p linked_list.to_s
