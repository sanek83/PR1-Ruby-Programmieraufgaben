##
# @autor $Autor: Alexander Albrant$
# @autor $Autor: Mikhail Goldenzweig$
# @version $Revision: 0.1 $ 

class Auftrag
    attr_accessor :kunde, :position, :anzahl, :datum, :von, :nach, :masse
    def initialize
        @kunde #String
        @position #String
        @anzahl #Integer
        @datum #Datumsobjekt
        @von #String
        @nach #String
        @masse #L�nge, Breite, H�he als Array
    end 
    
#    def eql?(other)
#        return false if !other.class==self.class
#        return true  if self.equal?(other)
#        return  if  kunde.eql?other.kunde and
#                    position.eql?other.position and
#                    anzahl.eql?other.anzahl and
#                    datum.eql?other.datum and
#                    von.eql?other.von and
#                    nach.eql?other.nach and
#                    masse.eql?other.masse
#    end
    
    def to_s
        "*  Kunde: " + @kunde + "   Position: " + @position.to_s + "   Anzahl: " + @anzahl.to_s + "   Datum: " + datum.to_s + 
        "   Von: " + @von + "   Nach: " + @nach + "   Masse: " + @masse.join(', ') + "\n"
    end
end