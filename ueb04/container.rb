class Container
    
    attr_reader :Aktuelle_Pos
    
    #constructor
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
    
    def getFrachtgut(bPos, hPos, lPos)
        @frachtgueter[(lPos-1)*ReihenBmax(@frachtgueter[0])*ReihenHmax(@frachtgueter[0])+ReihenBmax(@frachtgueter[0])*(hPos-1)+bPos-1]
    end    
    
    def ReihenBmax (frachtgut)
        (@breite/frachtgut.breite).to_i     
    end
    
    def ReihenHmax (frachtgut)
        (@hoehe/frachtgut.hoehe).to_i
    end
    
    def ReihenLmax (frachtgut)    
        (@laenge/frachtgut.laenge).to_i
    end
    
    def fracht(frachtgut)        
       ReihenLmax(frachtgut)*ReihenBmax(frachtgut)*ReihenHmax(frachtgut)        
    end

    def beladen(frachtgut)
        
        if((fracht(frachtgut)-@Aktuelle_Pos) > 0)
            @frachtgueter.push(frachtgut)
                      
            if (@Aktuelle_Pos == 0)                
                @ReihenB = ReihenBmax(frachtgut)
                @ReihenH = ReihenHmax(frachtgut)
                @ReihenL = ReihenLmax(frachtgut)
            end
            puts "\t       #  #{frachtgut} Reihe in der Breite: #{ReihenBmax(frachtgut)-@ReihenB+1}, Hoehe: #{ReihenHmax(frachtgut)-@ReihenH+1} Laenge: #{ReihenLmax(frachtgut)-@ReihenL+1}  #     #"
            
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