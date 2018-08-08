# Wie das Internet funktioniert

> Für die Leser zu Hause: Dieses Kapitel wird im Video [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) behandelt.
> 
> Dieses Kapitel wurde inspiriert durch den Vortrag "How the Internet works" von Jessica McKellar (http://web.mit.edu/jesstess/www/).

Wahrscheinlich nutzt du das Internet jeden Tag. Aber weißt du, was passiert, wenn du eine Adresse wie https://djangogirls.org im Browser eingibst und `enter` drückst?

Als Erstes solltest du wissen, dass eine Webseite meist nur ein paar Dateien auf der Festplatte sind. Genau wie deine Filme, Musik oder Bilder. Das Besondere an Webseiten ist, dass sie aus speziellem Computer-Code bestehen, das sogenannte HTML.

Wenn du noch nie etwas mit Programmierung zu tun hattest, kann auch HTML zuerst abschreckend aussehen, aber dein Browser (Chrome, Safari, Firefox, etc.) liebt es. Browser sind so entworfen, dass sie diesen Code verstehen, seinen Anweisungen folgen können und diese Dateien, aus denen deine Website besteht, genau so darstellen, wie du es möchtest.

Wie jede andere Datei auch, muss die HTML-Datei irgendwo auf einer Festplatte gespeichert werden. Für das Internet verwenden wir spezielle, leistungsstarke Computer, sogenannte *Server*. An ihnen sind normalerweise weder Bildschirm, Maus oder Tastatur angeschlossen, weil der Hauptzweck der Server darin besteht, Daten zu speichern und zur Verfügung zu stellen. Darum nennt man sie *Server* - sie *bedienen* (serve) dich mit Daten.

OK, aber du willst wissen, wie das Internet aussieht oder?

Wir haben ein Bild gemalt. So sieht es aus:

![Abbildung 1.1](images/internet_1.png)

Ziemliches Durcheinander, oder? Eigentlich ist es ein Netzwerk aus verbundenen Maschinen (den oben genannten *Servern*). Hunderttausende von Rechnern! Kilometer über Kilometer Kabel rund um die Welt. Auf einer Webseite über Unterseekabel (https://submarinecablemap.com/) kannst du dir ein Bild von der Komplexität des Netzes machen. Hier ist ein Screenshot der Seite:

![Abbildung 1.2](images/internet_3.png)

Faszinierend, oder? Offensichtlich ist es nicht möglich, Kabel zwischen allen Servern des Internet zu schalten. Damit wir eine Maschine (z.B. diejenige, auf welcher https://djangogirls.org abgespeichert ist) erreichen können, muss unsere Anfrage über viele verschiedene andere Maschinen weitergeleitet werden.

Das sieht ungefähr so aus:

![Abbildung 1.3](images/internet_2.png)

Stell dir vor, wenn du https://djangogirls.org in den Browser eingibst, würdest du einen Brief versenden, in dem steht; "Hallo Django Girls, ich möchte die djangogirls.org Webseite ansehen. Bitte schickt sie mir!"

Der Brief kommt ins Postamt in deiner Nähe. Von da aus gelangt er zu einem anderen Postamt näher an der Zieladresse und näher und näher, bis der Brief zugestellt werden kann. Die einzigartige Sache ist, dass wenn du mehrere Briefe (*Datenpakete*) zu der selben Adresse abschickst, jeder einzelne Brief durch komplett unterschiedliche Poststellen (*Router*) laufen könnte. Dies hängt davon ab, wie sie an jedem Standort verteilt werden.

![Abbildung 1.4](images/internet_4.png)

So einfach ist das im Prinzip. Du sendest Nachrichten und erwartest eine Antwort. Anstelle von Papier und Stift verwendest du Daten (Byte für Byte), aber die Idee ist dieselbe!

Anstelle von Adressen mit Straße, Ort und Postleitzahl verwenden wir IP-Adressen. IP steht für Internet Protocol. Dein Computer fragt erst das DNS (Domain Name System), um die (von Menschen besser lesbare) Adresse djangogirls.org in die (besser von Maschinen lesbare) IP-Adresse umzuwandeln. Das DNS ist ein bisschen wie ein altmodisches Telefonbuch aus Papier, in dem du den Namen einer Person, die Du kontaktieren willst suchen und die Telefonnummer und Adresse nachgucken kannst.

Wenn du einen Brief versenden willst, brauchst du spezielle Eigenschaften wie: Postanschrift, Briefmarke etc. Außerdem musst du eine Sprache verwenden, die der Empfänger versteht. Das gleiche gilt für die *Datenpakete*, die du sendest, um eine Website betrachten zu können. Wir verwenden ein Protokoll namens HTTP (Hypertext Transfer Protocol).

Grundsätzlich brauchst du also für eine Website auch einen *Server*, auf dem sie abgelegt ist. Wenn der *Server* eine eingehende *Anforderung* (in einem Brief) empfängt, sendet er deine Website zurück (in einem weiteren Brief).

Da dies hier ein Django-Tutorial ist, fragst du dich vielleicht, was Django in diesem Zusammenhang macht. Wenn dein Server eine Antwort zurück sendet, soll nicht an jeden dasselbe gesendet werden. Es wäre besser, wenn die Antworten individuell personalisiert würden, entsprechend der Anfragen des jeweiligen Briefes, oder? Django hilft dir, diese personalisierten und interessanten Antworten zu erstellen. :)

Genug der Theorie, lass uns loslegen!