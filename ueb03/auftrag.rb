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
    
    def to_s
        "*  Kunde: " + @kunde + "   Position: " + @position.to_s + "   Anzahl: " + @anzahl.to_s + "   Datum: " + datum.to_s + 
        "   Von: " + @von + "   Nach: " + @nach + "   Masse: " + @masse.join(', ') + "\n"
    end
end