require_relative 'binary_search_tree'
class Node

  attr_reader :score, :title, :data
  attr_accessor :left, :right, :depth, :visited

  def initialize(score, title)
  @title = title
  @score = score
  @left = nil
  @right = nil
  @depth = 0
  @data = {title => score}
  @visited = false
  end
end
