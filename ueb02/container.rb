##
# @autor $Autor: Alexander Albrant$
# @autor $Autor: Mikhail Goldenzweig$
# @version $Revision: 0.1 $ 

# Container Klasse
# enthaetl array mit Frachtguetern

class Container
    
    # default Construktor
    def initialize (breite, hoehe, laenge)
        
        @frachtgueter = []
        
        @breite  = breite
        @hoehe   = hoehe
        @laenge  = laenge
        
        @ReihenB = 0
        @ReihenH = 0
        @ReihenL = 0
        
        @Aktuelle_Pos = 0
                            
    end
    
    # Liefert Adresse des Frachtgutes auf der bestimmten Position
    def getFrachtgut(bPos, hPos, lPos)
        @frachtgueter[(lPos-1)*ReihenBmax(@frachtgueter[0])*ReihenHmax(@frachtgueter[0])+ReihenBmax(@frachtgueter[0])*(hPos-1)+bPos-1]
    end
    
    # Getter Methode
    def aktuelle_Pos
        @Aktuelle_Pos
    end
    
    # Berechnung der Maximalen Anzahl der Plaetze fuer Frachtgueter in der Breite
    private
    def ReihenBmax (frachtgut)
        (@breite/frachtgut.getBreite).to_i     
    end
    # Berechnung der Maximalen Anzahl der Plaetze fuer Frachtgueter in der Hoehe 
    def ReihenHmax (frachtgut)
        (@hoehe/frachtgut.getHoehe).to_i
    end
    
    #Berechnung der Maximalen Anzahl der Plaetze fuer Frachtgueter in der Laenge
    def ReihenLmax (frachtgut)    
        (@laenge/frachtgut.getLaenge).to_i
    end
    
    
    # Fracht - Anzahl der Elemente, die in den Container passen 
    public
    def fracht(frachtgut)        
       ReihenLmax(frachtgut)*ReihenBmax(frachtgut)*ReihenHmax(frachtgut)        
    end

#   Liefert true,  wenn das Frachtgut noch geladen werden konnte. 
#   Liefert false, wenn der Container voll beladen ist. 
#   Nach dem Beladen ist die aktuelle Position der nächste freie Platz, 
#   oder der erste nicht freie Platz
    def beladen(frachtgut)
        
        if((fracht(frachtgut)-@Aktuelle_Pos) > 0)
            # Packe Frachtgut ins Array
            @frachtgueter.push(frachtgut)
                      
            if (@Aktuelle_Pos == 0)                
                @ReihenB = ReihenBmax(frachtgut)
                @ReihenH = ReihenHmax(frachtgut)
                @ReihenL = ReihenLmax(frachtgut)
            end
            
            puts "\t       #  #{frachtgut} Reihe in der Breite: #{ReihenBmax(frachtgut)-@ReihenB+1}, Hoehe: #{ReihenHmax(frachtgut)-@ReihenH+1} Laenge: #{ReihenLmax(frachtgut)-@ReihenL+1}  #     #"
            
            # Ueberpruefung  der Breite, hoehe, lange, ob's voll
            if (@ReihenB > 1)
                @ReihenB -= 1                
            else 
                @ReihenB = ReihenBmax(frachtgut)
                if (@ReihenH > 1)
                    @ReihenH -= 1
                else
                    @ReihenH = ReihenHmax(frachtgut)                    
                    if (@ReihenL > 1)
                        @ReihenL -= 1
                    else
                        puts "\t       #  Container ist voll!                                                #     #"                        
                    end
                end
            end            
            @Aktuelle_Pos+=1           
            return true
        end
        return false        
    end
end