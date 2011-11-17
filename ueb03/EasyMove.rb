##
# @autor $Autor: Alexander Albrant$
# @autor $Autor: Mikhail Goldenzweig$
# @version $Revision: 0.1 $ 

require 'tempfile'
require 'auftrag_liste'
require 'auftrag'

puts 'Geben Sie die Datei ein:'
datei = gets.chomp

if !File.exist?(datei)   
    puts 'Die datei existiert nicht!'
    exit
end



def deleteSpaces(filename)
    # Erzeuge eine tempor�re Datei
    temp = Tempfile.new('temp')
    file = File.open(filename, "r")
    file.each { |line| 
        # Hier werden alle whitespaces durch 1 leerzeichen ersetzt.
        line.gsub!(/(\s*::\s*)+/, " :: ")
        line.gsub!(/(\s*\|\s*)+/, " | ")
        line.gsub!(/\s*$/, "")
        # in eine tempor�re Datei reingeschrieben.
        temp << line + "\n"       
    }
    # tempor�re und originale Datei mit korigierten Werten werden geschlossen
    temp.close 
    file.close   
    # originale Datei wird gel�scht
    File.delete(filename)
    # tempor�re Datei wird umbenannt und verschoben
    File.rename("#{temp.path}", filename)
end



auftrag_liste = AuftragListe.new

begin
    file = File.open(datei, "r")
    kunde = (file.gets.chomp).sub(/Kunde\s*::\s*/,'').sub(/\s*$/,'')
    
    file.each { |line|

        auftragsarray = line.chomp.split("|")
        #p auftragsarray         
     
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
        p auftrag
        auftrag_liste.append(auftrag)
        puts "\n"
    }    
    
ensure
    file.close unless file.nil?
end

puts "Anzahl der Auftraggruppen: " + auftrag_liste.auftrags_liste.length.to_s + "\n\n"
puts auftrag_liste.to_s
