##
# @autor $Autor: Alexander Albrant$
# @autor $Autor: Mikhail Goldenzweig$
# @version $Revision: 0.1 $ 


##
# Hauptprogramm


# Import von Classfiles
require 'container.rb'
require 'frachtgut.rb'

#liest ein Integer ein bis eine richtige Zahl eingegeben wird
def get_int    
    while true        
        zahl=gets.chomp    
        return zahl.to_i if zahl==zahl.to_i.to_s       
        puts '- wie bitte? : '  
    end      
end

#liest ein float ein bis eine richtige Zahl eingegeben wird (kann sowohl int als float sein)
def get_float    
    while true        
        zahl=gets.chomp    
        return zahl.to_f if (zahl==zahl.to_f.to_s or zahl==zahl.to_i.to_s)   
        puts '- wie bitte? : '  
    end      
end

puts "###################################################################"
puts "#                                                                 #"
puts "#      #      #      #      #        #          #####      #      #"
puts "#      #      #     # #     #        #         #     #     #      #"
puts "#      #      #    #   #    #        #        #       #    #      #"
puts "#      ########    #####    #        #        #       #    #      #"
puts "#      #      #   #     #   #        #         #     #            #"
puts "#      #      #   #     #   #######  #######    #####      #      #"
puts "#                                                                 #"
puts "#      Author1: Mikhail Goldenzweig                               #"
puts "#      Author2: Alexander Albrant                                 #"
puts "###################################################################\n\n"



#Auftrag abfragen
puts 'Wie viele Frachtguetern muessen transportiert werden? '
f_anzahl = get_int()
puts 'Geben Sie die Laenge einer Frachtguter ein:'
f_laenge = get_float()
puts 'Geben Sie die Breite einer Frachtguter ein:'
f_breite = get_float()
puts 'Geben Sie die Hoehe einer Frachtguter ein:'
f_hoehe = get_float()

#Container Masse definieren
c_anzahl = 10
c_laenge = 20 
c_breite = 10 
c_hoehe  = 10

#Array mit Containers
containers = Array.new

#Befuehlen von ContainerArray mit Containers
c_anzahl.times { containers.push(Container.new(c_breite, c_hoehe, c_laenge)) }

#Erstes Frachtgut. Auch zum Testzweck
gut = Frachtgut.new(f_breite, f_hoehe, f_laenge)

#Container Array beladen
#wenn die ganze Frachtgueter reinpassen...
if (f_anzahl <= (containers[0].fracht(gut))*c_anzahl)
    #dann, fuer jeden Container
    c_anzahl.times { |c_cur|
        
        puts "In Container #{c_cur+1} passt #{containers[c_cur].fracht(gut)} Frachtgueter:\n\n"
        puts "\t             #######################################################################"
        puts "\t           #                                                                     # #"
        puts "\t         #                                                                     #   #"
        puts "\t       #######################################################################     #"
        puts "\t       #                                                                     #     #"
        
        #Laden einen Frachtguter in den zu befuellender Container ein bis er voll
        #oder Frachtgueter alle sind
        while (f_anzahl > 0 and containers[c_cur].beladen(gut))
            #Erzeugen eines Frachtgut
            gut = Frachtgut.new(f_breite, f_hoehe, f_laenge)
            #Anzahl der Frachtgueter dekrementieren
            f_anzahl-=1
        end
        puts "\t       #                                                                     #   #"
        puts "\t       #                                                                     # #"
        puts "\t       #######################################################################\n\n"
    }
else
    puts 'Passt nicht rein!!!'    
end

containers.each { |container|
    puts "container beinhaltet #{container.aktuelle_Pos()} Frachtgueter"
}

# Rauspicken der Pakete

while (puts "\n\nWollen Sie einen Frachtgut rausnehmen? (J/N)") == nil and gets.chomp.downcase == 'j' do
    
    puts "welches Container?"
    c = get_int
    puts "Welche Reihe in der Breite?"
    b = get_int
    puts "Welche Reihe in der Hoehe?"
    h = get_int
    puts "Welche Reihe in der Laenge?"
    l = get_int

    puts containers[c-1].getFrachtgut(b,h,l)

end 
puts '                                                     #  #                             '			
puts '##############    #####        #####    #      #   #      #     #####      #####     #'
puts '      #          #     #      #     #   #      #   #      #    #     #    #     #    #'
puts '      #           #          #          #      #   #      #     #          #         #'
puts '      #             ##       #          ########   #      #       ##         ##      #'
puts '      #          #     #      #     #   #      #   #      #    #     #    #     #     '
puts '      #           #####        #####    #      #    ######      #####      #####     #'