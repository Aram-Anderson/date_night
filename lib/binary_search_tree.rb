require_relative 'node'

class BinarySearchTree

  attr_accessor :root, :insert
  attr_reader :total_nodes

  def initialize
    @root = nil
  end

  def insert(score, title, node = @root, depth = 0)
    if @root.nil?
      @root = Node.new(score, title)
      return depth
    else
      node.children += 1
      case node.score <=> score
      when -1 then right_node(score, title, node, depth)
      when 1 then left_node(score, title, node, depth)
      when 0 then return "That score already exists."
      end
    end
  end

  def right_node(score, title, node, depth)
    depth += 1
    if node.right.nil?
      node.right = Node.new(score, title)
      node.right.depth = depth
      return depth
    else
      insert(score, title, node.right, depth)
    end
  end

  def left_node(score, title, node, depth)
    depth += 1
    if node.left.nil?
      node.left = Node.new(score, title)
      node.left.depth = depth
      return depth
    else
      insert(score, title, node.left, depth)
    end
  end

  def include?(score, node = @root)
    if @root.nil?
      return "There are no nodes in the tree"
    elsif @root.score == score
      true
    else
      case node.score <=> score
      when -1 then right_node_include?(score, node)
      when 1 then left_node_include?(score, node)
      when 0 then true
      end
    end
  end

  def right_node_include?(score, node)
    if node.right.nil?
      false
    else
      include?(score, node.right)
    end
  end

  def left_node_include?(score, node)
    if node.left.nil?
      false
    else
      include?(score, node.left)
    end
  end

  def depth_of?(score, node = @root)
    if node.nil?
      return "There are no nodes in the tree"
    elsif node.score == score
      return node.depth
    else
      case node.score <=> score
      when -1 then right_node_depth_of?(score, node)
      when 1 then left_node_depth_of?(score, node)
      when 0 then return node.depth
      end
    end
  end

  def right_node_depth_of?(score, node)
    if node.right.nil?
      return nil
    else
      depth_of?(score, node.right)
    end
  end

  def left_node_depth_of?(score, node)
    if node.left.nil?
      return nil
    else
      depth_of?(score, node.left)
    end
  end

  def max(node = root)
    until node.right.nil?
      node = node.right
    end
    node.data
  end

  def min(node = root)
    until node.left.nil?
      node = node.left
    end
    node.data
  end

  def load(file)
    movies_inserted = 0
    parse_file(file).each do |score_title|
      insert(score_title[0].to_i, score_title[1])
      movies_inserted += 1
    end
    return "There were #{movies_inserted} movies successfully added to the tree!"
  end

  def parse_file(file)
    movies = File.readlines(file)
    movies.map do |movie|
      movie.strip.split(", ")
    end
  end

  def sort(node = @root, sorted = [])
    if node.nil?
      return "There are no nodes in the tree."
    end
    sort(node.left, sorted)
    sorted << node.data
    sort(node.right, sorted)
    sorted
  end

  def health(depth, node = @root, output = [])
    if node.nil?
      return
    end
    health(depth, node.right, output)
    if node.depth == depth
    output << [node.score, node.children + 1, ((node.children + 1).to_f / sort.count.to_f * 100).round]
    end
    health(depth, node.left, output)
    if output.empty?
      return "There are no nodes at that depth"
    else
      output
    end
  end

  def leaves(node = @root, output = [])
    if node.nil?
      return "There are no nodes in the tree."
    end
    leaves(node.left, output)
    if node.left.nil? && node.right.nil?
      output << node.data
    end
    leaves(node.right, output)
    output.count
  end

  def height(node = @root, all_depths = [])
    if node.nil?
      return "There are no nodes in the tree."
    end
    height(node.left, all_depths)
    all_depths << node.depth
    height(node.right, all_depths)
    all_depths.sort.pop
  end

  def delete()
  end

end
