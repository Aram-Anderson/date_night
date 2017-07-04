require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree'
require 'pry'


class TreeTest < Minitest::Test

  def test_that_root_begins_at_nil
    tree_1 = BinarySearchTree.new
    assert_nil tree_1.root
  end

  def test_it_has_a_root_that_has_a_title
    tree_1 = BinarySearchTree.new
    tree_1.insert(88, "Wayne's World")
    assert_equal "Wayne's World", tree_1.root.title
  end

  def test_it_can_insert_at_nodes
    tree_1 = BinarySearchTree.new
    tree_1.insert(99, "The Big Lebowski")
    tree_1.insert(88, "Wayne's World")
    tree_1.insert(93, "Life Aquatic")
    tree_1.insert(77, "I Heart Huckabees")
    assert_equal "I Heart Huckabees", tree_1.root.left.left.title
    assert_equal "Life Aquatic", tree_1.root.left.right.title
  end

  def test_it_can_check_if_a_score_is_included
    tree_1 = BinarySearchTree.new
    tree_1.load('./tests/movies2.txt')
    assert tree_1.include?(71)
    refute tree_1.include?(43)
  end

  def test_it_can_return_depth_for_a_given_score
    tree_1 = BinarySearchTree.new
    assert_equal "There are no nodes in the tree", tree_1.depth_of?(71)
    tree_1.load('./tests/movies2.txt')
    assert_equal 0, tree_1.depth_of?(71)
    assert_equal nil, tree_1.depth_of?(10)
    assert_equal 2, tree_1.depth_of?(11)
  end

  def test_max_score
    tree_1 = BinarySearchTree.new
    tree_1.load('./tests/movies2.txt')
    assert_equal ({"Animals United" => 98}), tree_1.max
  end

  def test_min_score
    tree_1 = BinarySearchTree.new
    tree_1.load('./tests/movies2.txt')
    assert_equal ({"I Love You Phillip Morris" => 7}), tree_1.min
  end

  def test_it_can_load_a_file
    tree_1 = BinarySearchTree.new
    tree_2 = BinarySearchTree.new
    assert_equal "There were 99 movies successfully added to the tree!", tree_1.load('./tests/movies.txt')
    assert_equal "There were 20 movies successfully added to the tree!", tree_1.load('./tests/movies2.txt')
  end

end
