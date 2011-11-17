##
# @autor $Autor: Alexander Albrant$
# @autor $Autor: Mikhail Goldenzweig$
# @version $Revision: 0.1 $ 

class AuftragListe
    
    #attr_accessor :auftrags_liste
    
    def initialize        
        @auftrags_liste = Hash.new
    end    

     def to_s
        s = String.new        
        @auftrags_liste.each_key { |index|
            
            s += "[Datum: " + index[0].to_s + "\tVon: " + index[1] + "\tNach: " + index[2] + "\tMasse: " + index[3].join(', ') + "] ===>\n"
            
            @auftrags_liste[index].each { |auftrag|
                s += auftrag.to_s
            }
            s+="\n"
        }
        return s
    end

    def delete(auftrag)
        @auftrags_liste[[auftrag.datum, auftrag.von, auftrag.nach, auftrag.masse]].delete(auftrag)        
        if (@auftrags_liste.has_key?([auftrag.datum, auftrag.von, auftrag.nach, auftrag.masse]) and \
            @auftrags_liste[[auftrag.datum, auftrag.von, auftrag.nach, auftrag.masse]].empty?)
            @auftrags_liste.delete([auftrag.datum, auftrag.von, auftrag.nach, auftrag.masse])
        end
    end

    def filter_auftrag(index)        
        return @auftrags_liste[index]
    end
    
    def append(auftrag)                

        index = [auftrag.datum, auftrag.von, auftrag.nach, auftrag.masse]

        
        @auftrags_liste.each_key { |key|
            if (key.eql?(index))
                @auftrags_liste[key] = @auftrags_liste[key].push(auftrag)
                return self
            end
        }
        
        @auftrags_liste[index] = [auftrag]
        return self
        
    end
end