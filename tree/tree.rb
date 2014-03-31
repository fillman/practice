class Tree
  attr_reader :value, :nodes

  def initialize(value, *nodes)
    @value = value
    @nodes = nodes || []
  end


  def tree_levels
    current_level = [*nodes]
    result = [[value]]

    until current_level.empty? do
      raise 'Some objects are not Tree instances' unless current_level.all? { |n| n.instance_of?(Tree) }

      next_level = []
      tmp = []
      current_level.each do |node|
        tmp << node.value
        next_level.push(*node.nodes)
      end
      result << tmp
      current_level = next_level
    end

    result
  end
end