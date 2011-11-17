##
# @autor $Autor: Alexander Albrant$
# @autor $Autor: Mikhail Goldenzweig$
# @version $Revision: 0.1 $ 

require 'auftrag_abwicklung.rb'
require 'fracht_abteilung.rb'


class EasyMove
    
    attr_reader :auftrag_abwicklung
    def initialize
        @auftrag_abwicklung = AuftragAbwicklung.new()
        @fracht_abteilung = FrachtAbteilung.new(@auftrag_abwicklung)
        
        vorsortierte_auftraege = @auftrag_abwicklung.run(Date.new(2008,5,1), 'Hamburg', 'Dubai', [2,1,1])        
        if vorsortierte_auftraege.size!=0 
            @fracht_abteilung.auftrag_verladen(vorsortierte_auftraege) 
        else 
            puts "Nix zu verlagern!"
        end
        
        puts "\nAuftragsliste nach Verlagerung: \n\n" + @auftrag_abwicklung.auftrag_liste.to_s
    end    
    
end


easyMoveObj = EasyMove.new()
