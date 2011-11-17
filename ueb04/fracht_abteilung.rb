##
# @autor $Autor: Alexander Albrant$
# @autor $Autor: Mikhail Goldenzweig$
# @version $Revision: 0.1 $ 

require 'container.rb'
require 'frachtgut.rb'
#require 'easy_move.rb'


class FrachtAbteilung
    
    def initialize (auftrag_abwicklung)
        
        @c_anzahl = 2   #Anzahl der Container
        c_laenge = 6   #Container Laenge
        c_breite = 5   #Container Breite 
        c_hoehe  = 5   #Container Hoehe
        
        @c_cur = 0      #Laufender Container
        @gut            #Laufender Frachtgut
                
        @containers = Array.new  #Array von Containers
        #Container erstellen
        @c_anzahl.times { @containers.push(Container.new(c_breite, c_hoehe, c_laenge)) }
        
        @auftrag_abwicklung = auftrag_abwicklung
        
    end
    
    def PaintTop
        
        puts "\nIn Container #{@c_cur+1} passt #{@containers[@c_cur].fracht(@gut)} Frachtgueter:\n\n"
        puts "\t             #######################################################################"
        puts "\t           #                                                                     # #"
        puts "\t         #                                                                     #   #"
        puts "\t       #######################################################################     #"
        puts "\t       #                                                                     #     #"
    end
    
    def PaintBottom
        
        puts "\t       #                                                                     #   #"
        puts "\t       #                                                                     # #"
        puts "\t       #######################################################################\n\n"
    end   
    
    
    def auftrag_verladen(auftrag_array)
       
       puts "Anzahl der Auftr�ge: " + (auftrag_array.size).to_s
       
       auftrag_array_clone = auftrag_array.clone
       
        @gut = Frachtgut.new(auftrag_array[0].masse[1], auftrag_array[0].masse[2], auftrag_array[0].masse[0])
        PaintTop()

        auftrag_array_clone.each {|auftrag|
        
            p auftrag            
            p "frei: " + ((@containers[0].fracht(@gut))*(@c_anzahl-@c_cur-1)+(@containers[0].fracht(@gut)-@containers[@c_cur].Aktuelle_Pos)).to_s
            
            if (auftrag.anzahl <= (@containers[0].fracht(@gut))*(@c_anzahl-@c_cur-1)+(@containers[0].fracht(@gut)-@containers[@c_cur].Aktuelle_Pos))
                while (auftrag.anzahl > 0)
                    if !@containers[@c_cur].beladen(@gut)
                        @c_cur+=1
                        PaintBottom()
                        PaintTop()                        
                        redo                            
                    end
                    #Erzeugen einen Frachtgut
                    gut = Frachtgut.new(auftrag_array[0].masse[1], auftrag_array[0].masse[2], auftrag_array[0].masse[0])
                    #Anzahl der Frachtg�ter decrementieren
                    auftrag.anzahl-=1                
                end
                @auftrag_abwicklung.auftrag_erledigt(auftrag)
            else
                puts "\nAuftrag:\n #{auftrag}kann  nicht verladegern werden da zu wenige Container...\n"
            end                     
        }  
        PaintBottom()
    end   
    
end