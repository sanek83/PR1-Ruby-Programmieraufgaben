Aufgabe 4
=========

### Lernziel:
 
* Gleichheit von Objekten 

Aufgabenstellung:
-----------------

Die Auftragsabwicklung des Unternehmens  EasyMove  schickt die Kundenaufträge als  Verladeaufträge an die Frachtabteilung. Dabei werden die Aufträge nach Starthafen, Zielhafen, Datum und Massen vorgefiltert. 

*  Definieren Sie eine Klasse ```AuftragAbwicklung```, die Aufträge filtert und diese an die Frachtabteilung zur Verladung übergibt. 
    * Die Auftragsabwicklung wird mit ```run``` gestartet. 
    * In der  Methode ```run ```
        * werden die Kundenaufträge der Aufgabe 3 gelesen und in die AuftragListe  übertragen.
        * und mit ```filter_auftrag``` der Aufgabe 3 die Aufträge vorsortiert.

* Definieren Sie eine Klasse ```FrachtAbteilung```, die Auftragslisten entgegennimmt: 
Die Klasse implementiert die Methode: 
```
auftrag_verladen(auftrag_array) 
```

Für jeden Auftrag in ```auftrag_array``` erzeugt die Frachtabteilung einen 
Verladevorgang, in der die Fracht in die Container verladen wird (das Verladen aus 
Aufgabe 2). 

Wurde ein Kundenauftrag erfolgreich verladen, wird dies der Auftragsabwicklung  
über die Methode ```auftrag_erledigt(auftrag)``` mitgeteilt. 

* Entwickeln Sie die Methode  auftrag_erledigt(auftrag) der Klasse AuftragAbwicklung 
    * die den auftrag aus der AuftragListe löscht. 
    * Beachten Sie dabei,
    * dass Sie gleiche Auftrag Objekte in der AuftragListe wiederfinden müssen.
        * dass auch in der Indextabellen die entsprechenden Objekte gelöscht werden müssen.  

* Definieren Sie eine Klasse ```EasyMove```, die Referenzen auf die AuftragAbwicklung und die FrachtAbteilung hält und den beschriebenen Prozess steuert und anstößt.







