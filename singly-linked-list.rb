#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'nodes/single-link-node'

# Singly Linked List
class SinglyLinkedList
  attr_accessor :head, :tail

  def initialize(value = nil, next_node = nil)
    @head = SinglyLinkedListNode.new(value, next_node)
    @tail = @head
  end
end

