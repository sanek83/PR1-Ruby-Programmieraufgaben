Aufgabe 1
=========

Teil A: 
-------
Schreiben Sie eine Methode, die solange Eingaben von der Konsole liest, bis die Eingabe ’done’ erfolgt und geben Sie die Eingabe sortiert getrennt durch ’::’  aus. 
### Hinweis: 

Verwenden Sie die Methode sort der Klasse Array zum Sortieren der Eingabe.

Teil B:
-------
Schreiben Sie eine Methode, die Eingaben von der Konsole liest, diese in einem nx2 Array abspeichert und den Inhalt des Arrays als Inhaltsverzeichnis formatiert ausgibt. 
Sie lesen immer Paare von Worten ein. Das erste Wort enthält den Namen des Kapitels, das zweite Wort die Seite, an dem das  Kapitel beginnt. 
Stellen Sie sicher, dass die Seitenzahlen gültige Zahlen sind.  Wenn nicht, fordern Sie eine erneute Eingabe an.

Beispiele:
----------
### Eingabe:
```
Motivation
6
Basistypen in Ruby
15
```
### wird wie folgt dargestellt:
```
Motivation                      Seite 6
Basistypen in Ruby                  Seite 15
```
### Eingabe:
```
Motivation
Basistypen in Ruby
```
wird nicht akzeptiert, da Basistypen in Ruby nicht in eine Zahl  übersetzt werden kann.

### Eingabe:
```
Motivation
6 Basistypen in Ruby
```
wird nicht akzeptiert, da ’6 Basistypen in Ruby’  keiner Zahl entspricht.

### Hinweise: 
Verwenden Sie ausschließlich Iteratoren, um den Inhalt des Arrays zu lesen. 

