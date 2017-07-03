require_relative 'binary_search_tree'
class Node

  attr_reader :score, :title
  attr_accessor :left, :right, :depth

  def initialize(score, title)
  @title = title
  @score = score
  @left = nil
  @right = nil
  @depth = 0
  end

end
