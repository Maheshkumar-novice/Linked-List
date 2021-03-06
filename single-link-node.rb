#!/usr/bin/env ruby
# frozen_string_literal: true

# Single Link Node
class SingleLinkNode
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
