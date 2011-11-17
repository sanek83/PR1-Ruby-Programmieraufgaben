== A2  Beladen von Containern ==

Ihre Logistikunternehmen EasyMove  hat sich auf den Transport von Containern spezialisiert. Es sei zunächst egal, ob per Schiff, LKW oder Schiene.  Vor dem Transport müssen die Container mit Frachtgut beladen werden. Sie sollen nun diesen Ladevorgang programmieren. 

Ihr Unternehmen hat n freie Container. Ihr Kunde beauftragt den Transport  von k Frachtguetern. Diese k Frachtgueter müssen in die Container geladen werden. Dabei kann es vorkommen, dass nicht ausreichend viele Container frei sind. In diesem Fall kann der Auftrag nicht angenommen werden. 

Die Container haben eine definierte laenge, breite und hoehe.  Ebenso haben die Frachtgueter eine definierte laenge, breite und hoehe. 

Beim Laden der Frachtgueter in die Container werden die Frachtgueter zuerst in die Breite gepackt, bis eine Reihe voll ist. Danach wird in der Hoehe weitergepackt, solange bis alle Reihen in der Hoehe voll sind. Danach wird in der Laenge des Containers weitergepackt, wieder zuerst in die Breite, dann in die Hoehe, solange bis der ganze Container voll ist. 

Wenn ein Container voll ist, wird mit dem nächsten Container fortgefahren, solange bis alle Frachtgueter verpackt sind. Alle Frachtgueter haben die gleichen Maße, die zu Beginn mit der Methode fracht(frachtgut) einmal mitgeteilt werden. 

1.  Befüllen Sie die Container mit einer variablen Anzahl von Frachtguetern. Die Zahl der Frachtgueter und die Maße der Frachtgueter lesen Sie von der Konsole.

2.  Schreiben Sie eine Klasse Container und eine Klasse Frachtgut. Die Größe der Container und des Frachtguts legen Sie beim Erzeugen der Container und des Frachtgutes fest. 

3.  Die Klasse Container hat zwei Methoden: 

a.  fracht( frachtgut): hier wird die Größe des Frachtgutes mitgeteilt. Der Container berechnet daraus die Anzahl der Elemente, die in den Container passen. 
b.  beladen(frachtgut): der Container lädt Frachtgut ein. Liefert true,  wenn das Frachtgut noch geladen werden konnte. Liefert false, wenn der Container voll beladen ist. Nach dem Beladen ist die aktuelle Position der nächste freie Platz, oder der erste nicht freie Platz. 

Hinweise:
1.  Verwalten Sie das Frachtgut eines Containers in einem geeigneten Array.
2.  Merken Sie sich die Anzahl der zu bepackenden Reihen in der Breite, Hoehe und Laenge in einer Instanzvariable der Klasse Container.
3.  Merken Sie sich den nächsten Platz für das Frachtgut in einer Instanzvariable der Klasse Container. 


