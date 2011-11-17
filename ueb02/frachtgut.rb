##
# @autor $Autor: Alexander Albrant$
# @autor $Autor: Mikhail Goldenzweig$
# @version $Revision: 0.1 $ 

##
# Class der Frachtgueter
# mit Eigenschaften Breite, Laenge, Hoehe
class Frachtgut
    
    def initialize (breite, hoehe, laenge)
                
        @breite  = breite
        @hoehe   = hoehe
        @laenge  = laenge
        
    end
    
    # Getter Methoden fue die Groessen
    def getBreite
        @breite
    end
    
    def getHoehe
        @hoehe
    end
    
    def getLaenge
        @laenge
    end
end