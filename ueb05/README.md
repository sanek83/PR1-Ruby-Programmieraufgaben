Aufgabe 5: Bearbeiten von Bäumen
================================

Lernziele:
----------
*  Rekursion über Baumstrukturen
*   Umgang mit Blöcken
*   Vererbung, abstrakte Klassen, Mixins
*   Templatemethoden, abstrakte Methoden …
*   Schreiben eigener Iteratoren


Teil A:
-------

Sie sollen allgemeine Bäume und Binärbäume modellieren.  

* Ein Baum besteht aus einem Wurzelknoten, an den Kinderknoten angehängt werden, die selbst wieder Kinderknoten enthalten können (usw.) Es handelt sich also um eine rekursive Datenstruktur. 
* Ein Knoten ist ein Blatt (engl. leaf), wenn es keine Kindknoten hat
* Knoten in einem Binärbaum dürfen maximal zwei Kinderknoten haben.
* Jeder Knoten des Baumes hat einen Inhalt.


### Anmerkung: 
Die Datenstruktur zu Binärbäumen wurde in der Vertiefungsvorlesung vorgestellt, die für allgemeine Bäume an der Tafel skizziert.  Als Anhang sind die Beispiele dieser Vorlesung beigefügt. 

Das Methodenprotokoll: Wir können uns für Baumstrukturen ein umfangreiches Protokoll ausdenken, beschränken uns aber auf einen Satz von Methoden, die zwingend von allen Bäumen angeboten werden müssen.

* ```children```: gibt die Kindknoten eines Baumes als Liste zurück
* ```delete(node)```: löscht einen Knoten mit seinem Unterbaum aus dem Baum.
* ```swap_subtree(node1,node2)```: tauscht node1 gegen node2 mit den jeweiligen Unterbäumen im Baum.
* ```swap_nodes(node1,node2)```: tauscht nur  node1 gegen node2 im Baum. D.h. die Unterbäume von node1 müssen auf  node2 umgehängt werden und umgekehrt. 
* ```replace(node1, node2)```: ersetzt node1 durch node2 im Baum. 
* ```is_leaf?```: liefert true, wenn ein Knoten ein Blatt eines Baumes ist 
* ```contains?(node)```: liefert true, wenn der Baum den Knoten enthält. 
* ```to_s```: gibt den Baum als String aus

Schreiben Sie eine abstrakte Klasse in Ruby, die das Protokoll für alle Bäume enthält und Methoden bzw. Templatemethoden soweit möglich implementiert. 

Schreiben Sie für allgemeine Bäume und Binärbäume  jeweils eine Klasse und überschreiben bzw. ergänzen Sie ggf. die Methoden der abstrakten Klasse. 

Bei den Binärbäumen ist besondere Vorsicht geboten: 
* diese dürfen nicht mit Knoten aus nicht Binärbäumen initialisiert (initialize) werden.
* das replace erlaubt ebenfalls keine Knoten aus nicht Binärbäumen. 
* Signalisieren Sie diese Situationen als ArgumentError

Teil B:
-------

Wir wollen über einen beliebigen Baum iterieren und dabei die Information der Knoten des Baumes
* einsammeln (```collect```) und 
* zusammenfassen (```inject```)

Nutzen Sie dazu das Mixin ```Enumerable```.  Sie  müssen genau eine Methode für Bäume schreiben, mit der Sie über den Baum iterieren, damit Sie die Methoden ```collect``` und ```inject``` benutzen können.


### Hinweis: 
Wenn Sie den Block einer Methode in der Definition der Methode referenzieren  und an andere Methoden weitergeben wollen, dann schreiben Sie: 

```ruby
    def my_method_uses_block(&block) 
        block.call(self)
        next_method_using_block(&block)
    end
```

Rufen Sie jetzt ```my_method_uses_block``` wie folgt auf:

```ruby    
    my_method_uses_block do |block_var|
        block_var.to_s
    end
```

Dann wird der Block in ein ```Proc Objekt``` verwandelt und an die Variable ```&block ```
gebunden. 

```block.call(self)``` führt den Block aus und bindet die Blockvariable block_var an  den Wert von self.

```next_method_using_block(&block)``` nimmt das Proc Objekt als Parameter entgegen. 
    

Überprüfen Sie Ihre Lösungen:
-----------------------------

1.  Sie sollen die gezeigten Baumstrukturen erzeugen: 


Binärbaum 
![Binärer Baum](http://shureg.de/haw/pr1/bbaum.png)
 
Allgemeiner Baum
![Allgemeiner Baum](http://shureg.de/haw/pr1/abaum.png)

 
2.  Folgende Aufrufe  sollen  sinnvolle Ergebnisse liefern:
    
Für allgemeine Bäume werden zunächst alle Knoten kopiert (geklont)
```ruby
anode12_clone = anode12.deep_clone
anode11_clone = anode11.deep_clone
anode10_clone = anode10.deep_clone
anode9_clone = anode9.deep_clone
anode8_clone = anode8.deep_clone
anode7_clone = anode7.deep_clone
anode6_clone = anode6.deep_clone
anode5_clone = anode5.deep_clone
anode4_clone = anode4.deep_clone
anode3_clone = anode3.deep_clone
anode2_clone = anode2.deep_clone
anode1_clone = anode1.deep_clone
```
Dann werden folgende Tests ausgeführt
```ruby
puts anode1
p anode1.max_depth
p anode1.is_leaf?
p anode7.is_leaf?
p anode10.is_leaf?

puts anode1_clone.delete(anode3_clone)
puts anode1_clone
puts anode1_clone.contains?(anode7_clone)
puts anode1_clone.contains?(anode4_clone)

puts anode1_clone = anode1.clone
puts anode1_clone.swap_subtree(anode7_clone,anode12_clone)
puts anode1_clone = anode1.deep_clone
puts anode1_clone.swap_nodes(anode7_clone,anode12_clone)

collected = anode1.collect do |n|
    n.content +=1
end
puts anode1

p "collected [#{collected.join(' ')}]"

res = anode1.inject(0) do |acc,n|
    acc + n.content 
end
p res
```

Analog für Binärbäume:

Zunächst klonen
```ruby
bnode6_clone = bnode6.deep_clone
bnode5_clone = bnode5.deep_clone
bnode4_clone = bnode4.deep_clone
bnode3_clone = bnode3.deep_clone
bnode2_clone = bnode2.deep_clone
bnode1_clone = bnode1.deep_clone
```
  Dann Methoden aufrufen
```ruby
puts bnode1
p bnode1.is_leaf?
p bnode3.is_leaf?
p bnode4.is_leaf?
p bnode1.max_depth
p bnode3.max_depth
p bnode6.max_depth

puts bnode1_clone.delete(bnode2_clone)
puts bnode1_clone.contains?(bnode2_clone)
puts bnode1_clone.contains?(bnode4_clone)
puts bnode1_clone = bnode1.clone
puts bnode1_clone.swap_subtree(bnode2_clone,bnode3_clone)
puts bnode1_clone = bnode1.deep_clone
puts bnode1_clone.swap_nodes(bnode2_clone,bnode3_clone)

collected = bnode1.collect do |n|
    n.content +=1
end
puts bnode1

p "collected [#{collected.join(' ')}]"

res = bnode1.inject(0) do |acc,n|
    acc + n.content 
end
p res
```    
