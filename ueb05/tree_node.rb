require 'BaumModul.rb'


class TreeNode
    include BaumModul
    include Enumerable
    
    attr_accessor :content, :nodes
    
    def initialize(content, nodes=[])
        @content = content
        @nodes = nodes        
    end    
##################################################################################################################    
    def <<(child)
        add(child)
    end

    def add(node)     
      @nodes << node      
      return node
    end
##################################################################################################################
    def == (other) #???????????
        return true if self.content == other.content
        return false
    end
##################################################################################################################
    def children#: gibt die Kindknoten eines Baumes als Liste zuruck
        list = []
        @nodes.each {|node| list << node }
        return list
    end
##################################################################################################################      
    def each(&block)
        
        block.call(self)        
        @nodes.each {|node| node.each(&block) }
    end
##################################################################################################################
    def my_each(depth=0, &block)
        
        block.call(depth, self)        
        @nodes.each {|node| node.my_each(depth+1, &block) }
    end  
##################################################################################################################      
    def getPosition(node, position)
        
        if self == node
            if position == nil #if wurzel
                return nil
            end
            return position 
        end
        #puts "position: " + position.to_s
        @nodes.length.times {|i| 
            pos = @nodes[i].getPosition(node, [self,i])
            
            return pos if pos != false
        }
        return false
    end    
##################################################################################################################
    def max_depth
        max_dep = 0
        self.each { |pself, depth| max_dep = depth if depth > max_dep }
        max_dep
    end
##################################################################################################################      
    def delete(node)#: loscht einen Knoten mit seinem Unterbaum aus dem Baum.
        
        position = getPosition(node, nil)
       # p position[0]
        #p position[1]
        position[0].nodes.delete_at(position[1])
        
        return self
    end
##################################################################################################################    
    def swap_subtree(node1,node2)#: tauscht node1 gegen node2 mit den jeweiligen Unterbaumen im Baum.
        
        position1 = getPosition(node1, nil)
        position2 = getPosition(node2, nil)

        position1[0].nodes[position1[1]] = node2
        position2[0].nodes[position2[1]] = node1
        
        return self
    end
##################################################################################################################
    def swap_nodes(node1,node2)#: tauscht nur  node1 gegen node2 im Baum. D.h. die Unterbaume von node1 mussen auf  node2 umgehangt werden und umgekehrt.
        
        swap_subtree(node1,node2)        
        node1.nodes, node2.nodes = node2.nodes, node1.nodes 
        
        return self
    end
##################################################################################################################
    def replace(node1, node2)#: ersetzt node1 durch node2 im Baum.
        
        position = getPosition(node1, nil)
        position[0].nodes[position[1]] = node2 if position!=nil
        node2.nodes = node1.nodes
        
        return self
    end
##################################################################################################################
    def is_leaf?
        @nodes.empty?
    end
##################################################################################################################    
    def contains?(node)#: liefert true, wenn der Baum den Knoten enthalt.
        
        return true if self == node
        @nodes.each {|cur_node| 
            return true if(cur_node.contains?(node) == true)
        }
        return false
    end
##################################################################################################################    
    def to_s#: gibt den Baum als String aus
        s = ''        
        self.my_each {|depth, node| s+= "\t"*depth + "#{node.content.to_s}\n"} 
        return s
    end

end