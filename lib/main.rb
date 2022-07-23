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
p "Size: #{linked_list.size}"
p "Head: #{linked_list.head.value}"
p "Tail: #{linked_list.tail.value}"
p "At index 0: #{linked_list.at(0).value}"
p "At index 5: #{linked_list.at(5).value}"
p "At index 6: #{linked_list.at(6).value}"
linked_list.pop
p "After popping: #{linked_list.to_s}"
p "Contains -1: #{linked_list.contains?(-1)}"
p "Contains -11: #{linked_list.contains?(-11)}"
p "Find 3: #{linked_list.find(3)}"
p "Find -1: #{linked_list.find(-1)}"
p "Find 4: #{linked_list.find(4)}"
linked_list.insert_at(5, 3)
p "Insert 5 at 3: #{linked_list.to_s}"
linked_list.insert_at(8, linked_list.size)
p "Insert 8 at #{linked_list.size}: #{linked_list.to_s}"
linked_list.remove_at(3)
p "Remote at 3: #{linked_list.to_s}"
