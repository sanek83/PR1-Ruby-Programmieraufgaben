require 'BaumModul.rb'

class BinaerBaum
    include BaumModul
	include Enumerable
    
    attr_accessor :left, :right, :content
    
    LEFT = 0
    RIGHT = 1
    
    def initialize(content,left=nil,right=nil)
       raise ArgumentError if  ! left.nil?&&!left.kind_of?(self.class)# || ! left.nil?
        raise ArgumentError if  !right.nil?&&!right.kind_of?(self.class) #|| !right.nil?
        @content = content
        @left = left
        @right = right 
    end
#--------------------------------------------------------------
	def == (other) #??????????
        return true if self.equal?(other)   
        #return false if !(self.class == other.class)
        
        return self.class == NilClass if other.class == NilClass  
        
        return (self.content == other.content)
        
	end  	
#--------------------------------------------------------------
    def is_leaf?
    	return  ((@left == nil) && (@right ==nil))
    end
#-------------------------------------------------------------- 
	def children 
		   # gibt die Kindknoten eines Baumes als Liste zurück     
		   return [@left, @right] 
	end	
#--------------------------------------------------------------    
	def each(&block)
			
		block.call(self)        
		if (! self.is_leaf?)
			if @left 
				@left.each(&block)
			end
			if @right
				@right.each(&block)
			end
		end	
    end
    def my_each(depth=0, &block)
            
        block.call(self, depth)        
        if (! self.is_leaf?)
            if @left 
                @left.my_each(depth+1,&block)
            end
            if @right
                @right.my_each(depth+1,&block)
            end
        end 
    end
#--------------------------------------------------------------
        
    def getPos(node, pos=nil)
        return pos if self == node
        
        if @left 
            position = @left.getPos(node,[self, LEFT])
            return position if position != false
        end
        if @right
            position = @right.getPos(node,[self, RIGHT])
            return position if position != false                
        end
        return false        
    end #--------------------------------------------------------------
    def delete(node)
        # löscht einen Knoten mit seinem Unterbaum aus dem Baum.
        
        pos = getPos(node)
        pos[0].left = nil if pos[1] == LEFT
        pos[0].right = nil if pos[1] == RIGHT
		return self    	
    end
    
    def max_depth
        max_dep = 0
        my_each { |this, depth| max_dep = depth if depth > max_dep }
        return max_dep
    end
    
    def swap_subtree(node1,node2)
        # : tauscht node1 gegen node2 mit den jeweiligen Unterbäumen im Baum. 
        pos1 = getPos(node1)
        pos2 = getPos(node2)
        
        pos1[0].left = node2 if pos1[1] == LEFT
        pos1[0].right = node2 if pos1[1] == RIGHT
        pos2[0].left = node1 if pos2[1] == LEFT
        pos2[0].right = node1 if pos2[1] == RIGHT
        
        return self
    end
    
    def swap_nodes(node1,node2)
        # : tauscht nur  node1 gegen node2 im Baum. 
    	# D.h. die Unterbäume von node1 müssen auf  node2 umgehängt werden und umgekehrt.
        
        swap_subtree(node1,node2)        
        node1.left, node2.left = node2.left, node1.left
        node1.right, node2.right = node2.right, node1.right
    	return self
    end
    
    def replace(node1, node2)
        #: ersetzt node1 durch node2 im Baum.
		raise ArgumentError if !node1.nil? && !node1.instance_of?(self.class) #|| !node1.nil?
        raise ArgumentError if !node2.nil? && !node2.instance_of?(self.class) #|| !node2.nil?
        
        pos = getPos(node1)
        if pos != nil
            pos[0].left = node2 if pos[1] == LEFT
            pos[0].right = node2 if pos[1] == RIGHT
        end
        node2.left = node1.left
        node2.right = node1.right 
        
    end 
    
      
    def contains?(node)
        #: liefert true, wenn der Baum den Knoten enthält.
        #return true if self == node
        each do |this|
            return true if(this == node)
        end
        return false	
    end 
    
    def to_s
        #: gibt den Baum als String aus
    	str = String.new("")
		my_each { |this, depth|
			 str += "\t"*depth + "#{this.content.to_s}\n"
		} 
		return str         
    end

end