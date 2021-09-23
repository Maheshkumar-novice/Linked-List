#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'nodes/single-link-node'

# Singly Linked List
class SinglyLinkedList
  attr_accessor :head, :tail
  attr_reader :size

  def initialize(value = nil, next_node = nil)
    @head = SinglyLinkedListNode.new(value, next_node)
    @tail = @head
    @size = 1
  end

  def append(value)
    append_helper(value)
    increase_size
  end

  def prepend(value)
    prepend_helper(value)
    increase_size
  end

  private

  def append_helper(value)
    @tail.next_node, @tail = SinglyLinkedListNode.new(value)
  end

  def prepend_helper(value)
    new_node = SinglyLinkedListNode.new(value)
    new_node.next_node = @head
    @head = new_node
  end

  def increase_size
    @size += 1
  end
end
