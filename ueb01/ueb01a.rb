#!/usr/bin/env ruby

##
# Schreiben Sie eine Methode, die solange Eingaben von der Konsole liest, 
# bis die Eingabe ’done’ erfolgt und geben Sie die Eingabe sortiert getrennt durch ’::’  aus. 
#
# Hinweis: Verwenden Sie die Methode sort der Klasse Array zum Sortieren der Eingabe.
#
# @autor $Autor: Alexander Albrant$
# @autor $Autor: Mikhail Goldenzweig$
# @version $Revision: 0.1 $ 

##
# Funktion zum Einlesen und Speichern ins Array der Eingabe Werte
def readInput ()
  
  # Variablen deklaration und initialisierung
  array =[]
  eingabe=''
  
  # Schleife zum einlesen der Werte bis es 'done' kommt
  while eingabe.downcase != 'done' do
    eingabe=gets.chomp
    
    # um 'done' nicht zu speichern, prüfe dies
     array.push eingabe if eingabe.downcase != 'done'     
     
  end # end while

  # Ausgabe von Array
    puts array.sort.join(' :: ')
  
end

# Aufruf der Funktion
readInput
