module BaumModul
    def children 
        # gibt die Kindknoten eines Baumes als Liste zurück
        abstract
    end
	 
    def delete(node)
        # löscht einen Knoten mit seinem Unterbaum aus dem Baum.
        abstract
    end
    
    def swap_subtree(node1,node2)
        # : tauscht node1 gegen node2 mit den jeweiligen Unterbäumen im Baum.
        abstract
    end
    
    def swap_nodes(node1,node2)
        # : tauscht nur  node1 gegen node2 im Baum. 
        # D.h. die Unterbäume von node1 müssen auf  node2 umgehängt werden und umgekehrt.
        abstract
    end
    
    def replace(node1, node2)
        #: ersetzt node1 durch node2 im Baum.
        abstract
    end 
    
    def is_leaf?
        #: liefert true, wenn ein Knoten ein Blatt eines Baumes ist
        abstract
    end 
    
    def contains?(node)
        #: liefert true, wenn der Baum den Knoten enthält.
        abstract
    end 
    
    def to_s
        #: gibt den Baum als String aus
        abstract
    end

end