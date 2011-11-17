##
# @autor $Autor: Alexander Albrant$
# @autor $Autor: Mikhail Goldenzweig$
# @version $Revision: 0.1 $ 

require 'auftrag_liste.rb'
require 'auftrag.rb'

class AuftragAbwicklung
    
    attr_reader :auftrag_liste
    
    def initialize
        @auftrag_liste = AuftragListe.new
    end

    
    def run(datum, von, nach, masse)
            
        file = File.open("kunda.txt", "r")
        kunde = (file.gets.chomp).sub(/Kunde\s*::\s*/,'').sub(/\s*$/,'')
    
        file.each { |line|

            auftragsarray = line.chomp.split("|")         
     
            auftrag = Auftrag.new        
            auftrag.kunde = kunde      

            for i in 0..auftragsarray.size-1 do
            
                schlussel = auftragsarray[i].sub(/\s*/,'').sub(/\s*::.*/,'').downcase
                case schlussel
                when "position"
                    auftrag.position = (auftragsarray[i].sub(/^.*::\s*/,'')).sub(/\s*$/,'')
                when "anzahl"                
                    auftrag.anzahl = (auftragsarray[i].sub(/^.*::\s*/,'')).sub(/\s*$/,'').to_i
                when "datum"
                    day   = (auftragsarray[i].sub(/.*::\s*/,'')).sub(/\..*\s*/,'').to_i                
                    month = (auftragsarray[i].sub(/.*::\s*\d\./,'')).sub(/\..*\s*/,'').to_i
                    year  = (auftragsarray[i].sub(/.*::\s*\d\.\d\./,'')).sub(/\s*/,'').to_i
                    auftrag.datum = Date.new(year, month, day)
                when "von"
                    auftrag.von = (auftragsarray[i].sub(/^.*::\s*/,'')).sub(/\s*$/,'')
                when "nach"
                    auftrag.nach = (auftragsarray[i].sub(/^.*::\s*/,'')).sub(/\s*$/,'')
                when "masse"
                    masse = []
                    masse[0] = (auftragsarray[i].sub(/.*::\s*/,'')).sub(/\s.*\s*/,'').to_i
                    masse[1] = (auftragsarray[i].sub(/.*::\s*\d\s/,'')).sub(/\s\d\s\d\s*$/,'').to_i
                    masse[2] = (auftragsarray[i].sub(/.*::\s*\d\s\d\s/,'')).sub(/\s*$/,'').to_i
                    auftrag.masse = masse
                
                else 
                    raise ArgumentError, "Falscher Schl�ssel\"#{schlussel}\" in der Auftragsdatei!", caller
                end
             
            end            
            @auftrag_liste.append(auftrag)            
         }
        
        @auftrag_liste.filter_auftrag([datum, von, nach, masse])    
        
    end    
    
    
    def auftrag_erledigt(auftrag)  
        @auftrag_liste.delete(auftrag)
    end
    
end