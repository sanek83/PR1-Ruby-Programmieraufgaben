#!/usr/bin/env ruby

##
#  Aufgabe 1b:
#
# Schreiben Sie eine Methode, die Eingaben von der Konsole liest, 
# diese in einem nx2 Array abspeichert und den Inhalt des Arrays als Inhaltsverzeichnis formatiert ausgibt. 
#
# Sie lesen immer Paare von Worten ein. Das erste Wort enthält den Namen des Kapitels, 
# das zweite Wort die Seite, an dem das  Kapitel beginnt. 
#
# Stellen Sie sicher, dass die Seitenzahlen gültige Zahlen sind.  Wenn nicht, fordern Sie eine erneute Eingabe an.
#
# @autor $Autor: Alexander Albrant$
# @autor $Autor: Mikhail Goldenzweig$
# @version $Revision: 0.1 $ 




##
# Funktion zum einlesen zweier Werte.
# 1. Sting, dieser ist die Beschreibung und kann aus belibigen Zeichen bestehen
# 2. ist ein Zahlenwert, diese ist die Seiten Zahl in einer Ihnhaltangabe
# Beispiele: 
#             Eingabe:
#                           Motivation
#                            6
#                           Basistypen in Ruby
#                             15
# wird wie folgt dargestellt
#                         Motivation            Seite 6
#                         Basistypen in Ruby          Seite 15


def readInput ()

  array = []
  textInput = '' 
  numInput = ''


  while textInput.downcase != 'done'  do
    puts'Bitte geben Sie Ihren Text ein oder beenden Sie mit \'done\''
    textInput = gets.chomp #Lese Text // Kapitelübersicht....
 
    # Prüfe of der Eingelesen String 'done' heisst
    if textInput.downcase != 'done'
      # Iteriere so lange bis man eine gültige Zahl hat / Zahlen die  Mehrere 0 am anfang haben werden als string bezeichnet
      loop do
        puts'Bitte geben Sie Ihre Zahl ein...'
        numInput = gets.chomp
        break if  numInput == numInput.to_i.to_s
        
        # puts "#{i+=1}"
      end # end loop
      
    end  # end if

    array.push [textInput, numInput] if textInput != 'done' 
    
  end# end while

 
    # puts 'ok, im array'
    array.each do |inhalt|
      puts inhalt.join("\t\tSeite ")
    end
    
end

# Funktionsaufruf
readInput()