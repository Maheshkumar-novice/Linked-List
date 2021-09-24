#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'single-link-node'

# Singly Linked List
# rubocop: disable Metrics/ClassLength
class SinglyLinkedList
  attr_accessor :head, :tail
  attr_reader :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  # Add a Node
  def prepend(value)
    insert_node_at_first(value)
  end

  def append(value)
    insert_node_at_last(value)
  end

  def insert_at(value, index)
    insert_node_at_index(value, index)
  end

  # Delete a Node
  def shift
    remove_node_at_first
  end

  def pop
    remove_node_at_last
  end

  def remove_at(index)
    remove_node_at_index(index)
  end

  # Update a Node
  def update_at(value, index)
    update_node_value(value, index)
  end

  # Node Existence
  def at(index)
    return_node_at_index(index)
  end

  def contains?(value)
    return false if index_of_value(value).nil?

    true
  end

  def find(value)
    index_of_value(value)
  end

  # String Form
  def to_s
    return 'nil -> nil' if @size.zero?

    string_version
  end

  private

  # Add Node Helpers
  def add_first_node(value)
    new_node = SingleLinkNode.new(value)
    @head = @tail = new_node

    complete_adding_a_node
  end

  def insert_node_at_first(value)
    return add_first_node(value) if @size.zero?

    new_node = SingleLinkNode.new(value)
    new_node.next_node = @head
    @head = new_node

    complete_adding_a_node
  end

  def insert_node_at_last(value)
    return add_first_node(value) if @size.zero?

    new_node = SingleLinkNode.new(value)
    @tail.next_node = new_node
    @tail = new_node

    complete_adding_a_node
  end

  def insert_node_at_index(value, index)
    index = index % @size unless @size.zero?
    raise StandardError, 'Invalid Index' if index >= @size || @size.zero?
    return insert_node_at_first(value) if @size == 1 || index.zero?
    return insert_node_at_last(value) if index == @size - 1

    new_node = SingleLinkNode.new(value)
    current_node, previous_node = previous_and_current_nodes(index)
    previous_node.next_node = new_node
    new_node.next_node = current_node

    complete_adding_a_node
  end

  # Remove Node Helpers
  def remove_node_at_first
    return nil if @size.zero?
    return reset_to_initial_state if @size == 1

    node = @head
    @head = @head.next_node
    return_value = node
    node.next_node = nil

    complete_removing_a_node(return_value)
  end

  def remove_node_at_last
    return nil if @size.zero?
    return reset_to_initial_state if @size == 1

    node = @head
    node = node.next_node until node.next_node == @tail
    node.next_node = nil
    return_value = @tail
    @tail = node

    complete_removing_a_node(return_value)
  end

  def remove_node_at_index(index)
    index = index % @size unless @size.zero?
    raise StandardError, 'Invalid Index' if index >= @size || @size.zero?
    return remove_node_at_first if index.zero?
    return remove_node_at_last if index == @size - 1

    current_node, previous_node = previous_and_current_nodes(index)
    return_value = current_node
    previous_node.next_node = current_node.next_node
    current_node.next_node = nil

    complete_removing_a_node(return_value)
  end

  # Update Node Helpers
  def update_node_value(value, index)
    index = index % @size unless @size.zero?
    raise StandardError, 'Invalid Index' if index >= @size || @size.zero?

    iteration_index = 0
    node = @head
    until iteration_index == index
      node = node.next_node
      iteration_index += 1
    end
    node.value = value
    to_s
  end

  # Node Existence Helpers
  def return_node_at_index(index)
    index = index % @size unless @size.zero?
    return nil if index >= size || @size.zero?

    node = @head
    index.times do
      node = node.next_node
    end

    node
  end

  def index_of_value(value)
    return nil if @size.zero?

    node = @head
    index = 0
    loop do
      return index if node.value == value
      break if node == @tail

      node = node.next_node
      index += 1
    end

    nil
  end

  # Util Helpers
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

  def complete_adding_a_node
    increase_size_by_one
    to_s
  end

  def complete_removing_a_node(value)
    decrease_size_by_one
    value
  end

  def string_version
    node = @head
    str = ''
    loop do
      str += "( #{node.value.inspect} ) -> "
      node = node.next_node
      return str += ' nil ' if node.nil?
    end
  end

  def reset_to_initial_state
    @head = nil
    @tail = nil
    @size = 0
  end
end
# rubocop: enable Metrics/ClassLength
