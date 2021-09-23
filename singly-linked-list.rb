#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'single-link-node'

# Singly Linked List
# rubocop: disable Metrics/ClassLength
class SinglyLinkedList
  attr_accessor :head, :tail
  attr_reader :size

  def initialize(value = nil)
    @head = SingleLinkNode.new(value)
    @tail = @head
    @size = 1
  end

  def append(value)
    increase_size_by_one
    insert_node_at_last(value)
  end

  def prepend(value)
    increase_size_by_one
    insert_node_at_first(value)
  end

  def at(index)
    return nil if index >= size

    find_node_at_index(index)
  end

  def pop
    decrease_size_by_one
    remove_at_last
  end

  def contains?(value)
    return false if index_of_value(value).nil?

    true
  end

  def find(value)
    index_of_value(value)
  end

  def to_s
    node = @head
    str = ''
    loop do
      str += "( #{node.value.inspect} ) -> "
      node = node.next_node
      return str += ' nil ' if node.nil?
    end
  end

  # rubocop: disable Lint/UselessSetterCall
  def update_at(value, index)
    iteration_index = 0
    node = @head
    until iteration_index == index
      node = node.next_node
      iteration_index += 1
    end
    node.value = value
  end

  def insert_at(value, index)
    new_node = SingleLinkNode.new(value)
    current_node, previous_node = previous_and_current_nodes(index)
    previous_node.next_node = new_node
    new_node.next_node = current_node
  end

  def remove_at(index)
    current_node, previous_node = previous_and_current_nodes(index)
    previous_node.next_node = current_node.next_node
    current_node.next_node = nil
  end
  # rubocop: enable Lint/UselessSetterCall

  private

  def insert_node_at_last(value)
    new_node = SingleLinkNode.new(value)
    @tail.next_node = new_node
    @tail = new_node
  end

  def insert_node_at_first(value)
    new_node = SingleLinkNode.new(value)
    new_node.next_node = @head
    @head = new_node
  end

  def remove_at_last
    node = @head
    node = node.next_node until node.next_node == @tail
    node.next_node = nil
    to_return = @tail
    @tail = node
    to_return
  end

  def find_node_at_index(index)
    node = @head
    (index % @size).times do
      node = node.next_node
    end
    node
  end

  def index_of_value(value)
    return 0 if @head.value == value
    return size - 1 if @tail.value == value

    node = @head
    index = 0
    while node.next_node
      return index if node.value == value

      node = node.next_node
      index += 1
    end

    nil
  end

  def previous_and_current_nodes(index)
    current_node = @head.next_node
    previous_node = @head
    iteration_index = 1
    until iteration_index == index
      previous_node = current_node
      current_node = current_node.next_node
      iteration_index += 1
    end
    [current_node, previous_node]
  end

  def increase_size_by_one
    @size += 1
  end

  def decrease_size_by_one
    @size -= 1
  end
end
# rubocop: enable Metrics/ClassLength
