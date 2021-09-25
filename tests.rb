#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'singly-linked-list'

puts "\nAdd:\n"
# Add Tests
add = SinglyLinkedList.new
puts "#append('adam'), #prepend('otis'), #insert_at('erie', 1), #update_at('eric', 1)"
puts add
# insert_at & update_at on empty list raises an error
# add.insert_at(1, 3)
# add.update_at(1, 3)
# add.remove_at(1)
add.append('adam')
puts add
add.prepend('otis')
puts add
add.insert_at('erie', 1)
puts add
add.update_at('eric', 2)
puts add
# insert_at on out of bound raises an error
# add.insert_at(100, 3)

puts "\nRemove:\n"
# Remove Tests
remove = SinglyLinkedList.new
puts remove
# remove_at on empty list raises an error
# remove.remove_at(1)
# p remove.pop
# p remove.shift
remove.append('adam')
puts remove
remove.prepend('otis')
puts remove
remove.insert_at('eric', 1)
puts remove
puts '#pop, #shift, #remove_at(0)'
remove.pop
puts remove
remove.shift
puts remove
remove.remove_at(0)
puts remove

puts "\nExistence:\n"
# Existence
exist = SinglyLinkedList.new
puts "#at(0), #find('otis'), #contains?('eric')"
p exist.at(0)
p exist.find('otis')
p exist.contains?('eric')
exist.append('adam')
exist.prepend('otis')
exist.insert_at('eric', 1)
puts exist
puts "#at(0), #find('otis'), #contains?('eric')"
p exist.at(0)
p exist.find('otis')
p exist.contains?('eric')
