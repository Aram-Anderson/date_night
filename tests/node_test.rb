require 'minitest/autorun'
require 'minitest/pride'
require './lib/node.rb'
require 'pry'

class NodeTest < Minitest::Test

  def test_exists
    node = Node.new(54, "Wayne's World")
    assert_instance_of Node, node
  end

  def test_node_has_a_score
    node = Node.new(54, "Wayne's World")
    assert_equal 54, node.score
  end

  def test_node_has_a_title
    node = Node.new(54, "Wayne's World")
    assert_equal "Wayne's World", node.title
  end


end
