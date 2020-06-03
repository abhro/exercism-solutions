# frozen_string_literal: true

#
# Implementation of binary search tree and it's node
#
class Bst
  include Enumerable

  def initialize(value, parent = nil)
    @data = value
    @left = nil
    @right = nil
    @parent = parent
  end

  attr_reader :data, :left, :right

  def insert(value)
    if value < data
      insert_left(value)
    elsif value > data
      insert_right(value)
    end
  end

  def each(&block)
    # if left.nil?
    #   yield data
    # elsif !right.nil?
    #   right.each(&block)
    # else
    #   left.each(&block)
    # end
  end

  private

  def insert_left(value)
    if left.nil?
      @left = value.is_a?(Bst) ? value : Bst.new(value, self)
    else
      left.insert(value)
    end
  end

  def insert_right(value)
    if right.nil?
      @right = value.is_a?(Bst) ? value : Bst.new(value, self)
    else
      right.insert(value)
    end
  end
end
