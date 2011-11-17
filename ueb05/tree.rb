require 'tree_node.rb'

gnode6 = TreeNode.new(6) 
gnode7 = TreeNode.new(7)
gnode3 = TreeNode.new(3,[gnode6,gnode7])

gnode2 = TreeNode.new(2)
gnode4 = TreeNode.new(4)
gnode5 = TreeNode.new(5)

gnode1 = TreeNode.new(1,[gnode2,gnode3,gnode4,gnode5])

puts gnode1.to_s

gnode1.delete(gnode6)

puts gnode1.to_s