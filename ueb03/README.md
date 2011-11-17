Aufgabe 3
=========
### Lernziele:
* Umgang mit Hashes
* Anwenden regulärer Ausdrücke zum Lesen und Umwandeln von Dateiinhalten.

Aufgabenstellung
----------------

Ihr Unternehmen EasyMove bekommt Auftragdaten seiner Kunden als Textdatei.  Verschiedene Kunden haben unterschiedliche Auftragsdateien. Jede Auftragsdatei enthält eine Liste von Einzelaufträgen. Jede Zeile der Auftragsdatei entspricht einem Auftrag.  Der Inhalt der Auftragsdatei für einen Kunden sieht z.B. wie folgt aus: 

```
Kunde :: k5689 
position ::    3456   | anzahl ::    100000| datum:: 1.5.2008 | von :: Hamburg | nach :: Dubai | masse :: 2 1 1 
Position ::  225    | anzahl:: 500 | datum:: 3.5.2008  | von :: Hamburg | nach :: Dubai |  masse:: 4 7 9 
position :: 1267 | Anzahl:: 1000 | datum:: 1.5.2008 | von:: Hamburg |   nach :: Ningbo | masse :: 2 2 3 
position :: 1367 | anzahl:: 1000 | datum:: 1.5.2008 | von:: Rotterdam |   nach :: Ningbo | masse :: 2 2 3 
position ::    8999   | anzahl ::  5000| datum:: 1.5.2008 | von :: Hamburg | nach :: Dubai | masse :: 2 1 1
 ...
```
* ```position```    ist die Auftragsnummer
* ```masse```       beschreibt Länge Breite Höhe des Frachtguts
* ```anzahl```            die Anzahl der Frachtgüter

Die Einträge zwischen den senkrechten Strichen ```(„|“)```  enthalten die Eigenschaften eines Auftrags.  

Elemente links des Zeichen ```(“::“)``` den Eigenschaftsnamen, die Elemente rechts des Zeichen (“::“) den Eigenschaftswert.

Zwischen den Trennzeichen ```(„|“)``` und ```(“::“)```  können beliebig viele Leerzeichen  (auch keine Leerzeichen) stehen.
Teil A
------

1.  Lesen Sie die Auftragsdaten aus der Datei und übertragen Sie diese in ein Objekt der Klasse ```AuftragListe```.

Schreiben Sie dazu die Methode 

```auftrags_liste.append(auftrag) -> auftrags_liste```  fügt einen Auftrag an 
das Ende von ```auftrags_liste```  an und gibt die modifizierte ```auftrags_liste``` als Ergebnis zurück. append arbeitet destruktiv auf der internen Repräsentation der Liste der Aufträge der Klasse ```AuftragListe```.

2.  Erzeugen Sie für jede Zeile in der Auftragsdatei einen Auftrag.

Auftragsobjekte haben die Eigenschaften: 

1.  ```kunde```       - Kundennummer als String
2.  ```position```        - Auftragsnummer  als String
3.  ```anzahl```      - Anzahl der Frachtgüter als Integer
4.  ```datum```       - Ankunftsdatum als Datumsobjekt
5.  ```von```         - Starthafen  als String
6.  ```nach```            - Endhafen  als String
7.  ```masse```       - Masse der Frachtgüter in Länge, Breite, Höhe als Array


### Gefordert ist weiterhin:

1.  Entfernen Sie aus den Einträgen der Auftragsdatei alle überflüssigen Leerzeichen. 
2.  Wandeln Sie die Datumseinträge in ein Datumsobjekt um. Verwenden Sie zur Erzeugung der Datumsobjekte die Klasse Date.

```ruby
mydate = Date.new(year,month,day)
```
Zugriff auf die Bestandteile ```year, month, day``` eines Date Objektes: 
```ruby
mydate.day
mydate.month
mydate.year
```

3.  Wandeln Sie die Anzahl der Frachtgüter in einen Integer um.
4.  Wandeln Sie die Maßangaben in Integer um.


Teil B
------

1.  EasyMove   muss nun die Auftragslisten abarbeiten und die Einzelaufträge auf 
Container verteilen. Dazu müssen die Aufträge aller Kunde zunächst gefiltert werden, 
und zu Aufträgen gebündelt werden, die in 

a.  datum
b.  von, nach
c.  masse

übereinstimmen. 

Schreiben Sie dazu eine Methode der Klasse ```AuftragListe```, die die Aufträge indiziert 
nach ```([datum,von,nach,masse])``` zurückgibt:

```auftrag_liste.filter_auftrag(([datum,von,nach,masse]) -> teilauftrag_liste```  - liefert eine Liste mit Aufträgen  mit gleichem Datum, Start- und Zielhafen und Maßen für die Frachtgüter.


2.  Um den Zugriff über den Index zu beschleunigen, soll jedes Mal, wenn ein Auftrag der AuftragListe hinzugefügt wird,  der Auftrag für den entsprechenden Index  in einem Hash gespeichert werden. Der Hash enthält als Schlüsselwerte den Index ([datum,von,nach,masse]) und als Werte eine Liste mit den zugehörigen Aufträgen. 

Modifizieren Sie dazu die Methode:
```
auftrag_liste.append(auftrag) -> auftrag_liste  
```

der Klasse AuftragsListe.



3.  Geben Sie das Ergebnis  der Methode ```filter_auftrag``` aus. Dabei sollen die Eigenschaften der  Auftrags Objekte ausgegeben werden. 

Überschreiben Sie dazu eine Ihnen bekannte Methode für die Ausgabe von Objekten als String. 


4.  Legen Sie für den Test zwei Auftragsdateien mit unterschiedlichen Kunden an.

Teil C
------

wird das Beladen der Container nach Auftragslisten und das Löschen von erfolgreich abgearbeiteten Aufträgen enthalten. Dies ist Bestandteil der Aufgabe 4.
