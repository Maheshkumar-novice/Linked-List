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
    insert_node_at_last(value)
    increase_size_by_one
  end

  def prepend(value)
    insert_node_at_first(value)
    increase_size_by_one
  end

  def at(index)
    return nil if index >= size

    find_node_at_index(index)
  end

  private

  def insert_node_at_last(value)
    new_node = SinglyLinkedListNode.new(value)
    @tail.next_node = new_node
    @tail = new_node
  end

  def insert_node_at_first(value)
    new_node = SinglyLinkedListNode.new(value)
    new_node.next_node = @head
    @head = new_node
  end

  def find_node_at_index(index)
    node = @head
    (index % @size).times do
      node = node.next_node
    end
    node
  end

  def increase_size_by_one
    @size += 1
  end
end
