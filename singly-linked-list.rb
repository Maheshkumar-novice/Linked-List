#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'single-link-node'
require_relative 'colors/color'

# Singly Linked List
# rubocop: disable Metrics/ClassLength
class SinglyLinkedList
  include Color

  attr_accessor :head, :tail
  attr_reader :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def prepend(value)
    insert_node_at_first(value)
  end

  def append(value)
    insert_node_at_last(value)
  end

  def insert_at(value, index)
    insert_node_at_index(value, index)
  end

  def shift
    remove_node_at_first
  end

  def pop
    remove_node_at_last
  end

  def remove_at(index)
    remove_node_at_index(index)
  end

  def update_at(value, index)
    update_node_value(value, index)
  end

  def at(index)
    node_at_index(index)
  end

  def contains?(value)
    return false if index_of_value(value).nil?

    true
  end

  def find(value)
    index_of_value(value)
  end

  def to_s
    return empty_linked_list_string_version if @size.zero?

    string_version
  end

  private

  def add_first_node(value)
    @head = @tail = SingleLinkNode.new(value)

    complete_adding_a_node
  end

  def insert_node_at_first(value)
    return add_first_node(value) if @size.zero?

    @head = SingleLinkNode.new(value, @head)
    complete_adding_a_node
  end

  def insert_node_at_last(value)
    return add_first_node(value) if @size.zero?

    @tail = @tail.next_node = SingleLinkNode.new(value)
    complete_adding_a_node
  end

  def insert_node_at_index(value, index)
    raise_error_if_needed(index)
    return insert_node_at_first(value) if index.zero?
    return insert_node_at_last(value) if index.equal?(@size - 1)

    node_at_index(index - 1).next_node = SingleLinkNode.new(value, node_at_index(index))

    complete_adding_a_node
  end

  def remove_node_at_first
    return nil if @size.zero?
    return reset_to_initial_state if @size.equal?(1)

    removed_node = @head
    @head = @head.next_node
    removed_node.next_node = nil

    complete_removing_a_node(removed_node)
  end

  def remove_node_at_last
    return nil if @size.zero?
    return reset_to_initial_state if @size.equal?(1)

    removed_node = @tail
    @tail = node_at_index(@size - 2)
    @tail.next_node = nil

    complete_removing_a_node(removed_node)
  end

  def remove_node_at_index(index)
    raise_error_if_needed(index)
    return remove_node_at_first if index.zero?
    return remove_node_at_last if index.equal?(@size - 1)

    node_to_remove, previous_node = current_and_previous_nodes(index)
    previous_node.next_node = node_to_remove.next_node
    node_to_remove.next_node = nil

    complete_removing_a_node(node_to_remove)
  end

  def update_node_value(value, index)
    raise_error_if_needed(index)

    node_at_index(index).value = value
    to_s
  end

  def node_at_index(index, node = @head)
    return node if index.zero?
    return nil if @size.zero?
    return nil unless index.between?(0, @size - 1)

    index -= 1
    node_at_index(index, node.next_node)
  end

  def index_of_value(value, node = @head, index = 0)
    return nil if @size.zero? || node.nil?
    return index if node.value == value

    index += 1
    index_of_value(value, node.next_node, index)
  end

  def current_and_previous_nodes(index)
    [node_at_index(index), node_at_index(index - 1)]
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

  def raise_error_if_needed(index)
    raise StandardError, 'Empty Linked List' if @size.zero?
    raise StandardError, 'Index Out Of Bound' unless index.between?(0, @size - 1)
  end

  def reset_to_initial_state
    @head = nil
    @tail = nil
    @size = 0
  end

  def string_version(node = @head, string = '')
    return string += color_text('nil', :red) if node.nil?

    string += create_color_node(node.value)
    string_version(node.next_node, string)
  end

  def create_color_node(value)
    "#{color_text('(',
                  :yellow)} #{color_text(value,
                                         :red)} #{color_text(')',
                                                             :yellow)} #{color_text('->',
                                                                                    :green)} "
  end

  def empty_linked_list_string_version
    "#{color_text('nil', :red)} #{color_text('->', :green)} #{color_text('nil', :red)}"
  end
end
# rubocop: enable Metrics/ClassLength
