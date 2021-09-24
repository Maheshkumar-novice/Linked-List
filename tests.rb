#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'singly-linked-list'

puts "\nAdd:\n"
# Add Tests
add = SinglyLinkedList.new
puts add
# insert_at & update_at on empty list raises an error
# add.insert_at(1, 3)
# add.update_at(1, 3)
# add.remove_at(1)
add.append(1)
add.prepend(2)
puts add
add.insert_at(10, 1)
puts add
add.update_at(100, 1)
puts add
# insert_at on out of bound raises an error
# add.insert_at(100, 3)

puts "\nRemove:\n"
# Remove Tests
remove = SinglyLinkedList.new
puts remove
# remove_at on empty list raises an error
# remove.remove_at(1)
p remove.pop
p remove.shift
remove.append(1)
remove.prepend(2)
puts remove
remove.insert_at(10, 1)
puts remove
remove.pop
puts remove
remove.shift
puts remove
remove.remove_at(0)
puts remove

puts "\nExistence:\n"
# Existence
exist = SinglyLinkedList.new
p exist.at(1)
p exist.find(100)
p exist.contains?(100)
exist.append(1)
exist.prepend(2)
exist.insert_at(133, 1)
puts exist
p exist.at(2)
p exist.find(133)
p exist.contains?(2)
