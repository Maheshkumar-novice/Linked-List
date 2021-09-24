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
  def append(value)
    insert_node_at_last(value)
  end

  def prepend(value)
    insert_node_at_first(value)
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
    return 'nil -> nil' if @head.nil?

    node = @head
    str = ''
    loop do
      str += "( #{node.value.inspect} ) -> "
      node = node.next_node
      return str += ' nil ' if node.nil?
    end
  end

  private

  # Add Node Helpers
  def add_first_node(value)
    new_node = SingleLinkNode.new(value)
    @head = @tail = new_node

    complete_adding_a_node
  end

  def insert_node_at_last(value)
    return add_first_node(value) if head_and_tail_nil?

    new_node = SingleLinkNode.new(value)
    @tail.next_node = new_node
    @tail = new_node

    complete_adding_a_node
  end

  def insert_node_at_first(value)
    return add_first_node(value) if head_and_tail_nil?

    new_node = SingleLinkNode.new(value)
    new_node.next_node = @head
    @head = new_node

    complete_adding_a_node
  end

  def insert_node_at_index(value, index)
    raise Standard Error, 'Invalid Index' if index >= @size || head_and_tail_nil?

    new_node = SingleLinkNode.new(value)
    current_node, previous_node = previous_and_current_nodes(index)
    previous_node.next_node = new_node
    new_node.next_node = current_node

    complete_adding_a_node
  end

  # Remove Node Helpers
  def remove_node_at_first
    return nil if head_and_tail_nil?
    return reset_to_initial_state if @size == 1

    node = @head
    @head = @head.next_node
    return_value = node
    node.next_node = nil

    complete_removing_a_node(return_value)
  end

  def remove_node_at_last
    return nil if head_and_tail_nil?
    return reset_to_initial_state if @size == 1

    node = @head
    node = node.next_node until node.next_node == @tail
    node.next_node = nil
    return_value = @tail
    @tail = node

    complete_removing_a_node(return_value)
  end

  def remove_node_at_index(index)
    return reset_to_initial_state if @size == 1
    raise Standard Error, 'Invalid Index' if index >= @size || head_and_tail_nil?

    current_node, previous_node = previous_and_current_nodes(index)
    return_value = current_node
    previous_node.next_node = current_node.next_node
    current_node.next_node = nil

    complete_removing_a_node(return_value)
  end

  # Update Node Helpers
  def update_node_value(value, index)
    return nil if head_and_tail_nil? || index >= @size

    iteration_index = 0
    node = @head
    until iteration_index == (index % @size)
      node = node.next_node
      iteration_index += 1
    end
    node.value = value
    to_s
  end

  # Node Existence Helpers
  def return_node_at_index(index)
    return nil if head_and_tail_nil? || index >= size

    node = @head
    (index % @size).times do
      node = node.next_node
    end

    node
  end

  def index_of_value(value)
    return nil if head_and_tail_nil?
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

  # Util Helpers
  def previous_and_current_nodes(index)
    index = index % @size
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

  def head_and_tail_nil?
    [@head, @tail].all?(&:nil?)
  end

  def reset_to_initial_state
    @head = nil
    @tail = nil
    @size = 0
  end
end
# rubocop: enable Metrics/ClassLength
