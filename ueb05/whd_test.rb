require 'binaer_baum.rb'
require 'deep_clone.rb'
require 'tree_node.rb'
begin
    bnode1 = BinaerBaum.new(1)
    
    bnode2 = BinaerBaum.new(2)
    bnode3 = BinaerBaum.new(3)
    bnode4 = BinaerBaum.new(4)
    bnode5 = BinaerBaum.new(5)
    bnode6 = BinaerBaum.new(6)
    
    #bnode7 = TreeNode.new(1,[TreeNode.new(2),TreeNode.new(23),TreeNode.new(3)])
    
    
    bnode1.left = bnode2
    bnode1.right = bnode3
    bnode1.right = bnode3
    
    bnode3.left = bnode4
    bnode3.right = bnode5
    bnode5.right = bnode6
    
    # Zunaechst klonen
    bnode6_clone = bnode6.deep_clone
    bnode5_clone = bnode5.deep_clone
    bnode4_clone = bnode4.deep_clone
    bnode3_clone = bnode3.deep_clone
    bnode2_clone = bnode2.deep_clone
    bnode1_clone = bnode1.deep_clone
    
    puts bnode1
    p bnode1.is_leaf?
    p bnode3.is_leaf?
    p bnode4.is_leaf?
    p bnode1.max_depth
    p bnode3.max_depth
    p bnode6.max_depth
    
    #bnode6.replace(node1, node7)
    puts bnode1_clone.delete(bnode2_clone)
    puts bnode1_clone.contains?(bnode2_clone)
    puts bnode1_clone.contains?(bnode4_clone)
    puts bnode1_clone = bnode1.clone
    puts bnode1_clone.swap_subtree(bnode2_clone,bnode3_clone)
    puts bnode1_clone = bnode1.deep_clone
    
    
    puts bnode1_clone.swap_nodes(bnode2_clone,bnode3_clone)
    
    collected = bnode1.collect do |n|
        n.content +=1
    end
    puts bnode1
    
    p "collected [#{collected.join(' ')}]"
    
    res = bnode1.inject(0) do |acc,n|
        acc + n.content 
    end
    p res
rescue ArgumentError 
    puts  "#{$!.backtrace}: Here could be your advertisement! Just for 200$ per Day!!!"
end
