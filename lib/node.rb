require_relative 'binary_search_tree'
class Node

  attr_reader :score, :title, :data
  attr_accessor :left, :right, :depth

  def initialize(score, title)
  @title = title
  @score = score
  @left = nil
  @right = nil
  @depth = 0
  @data = {title => score}
  @sorted = []
  end

def walk_nodes
  self.each do |node|
    case node
    when self.left  then @sorted << left.data && left.walk_nodes
    when self  then yield self
    when self.right then @sorted << right.data && right.walk_nodes
    end
  end
end

end
