# Wie das Internet funktioniert

> Tipp: Für dieses Kapitel existiert ein Video: [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc).

> Inspiriert durch den Vortrag "How the Internet works" von Jessica McKellar (http://web.mit.edu/jesstess/www/).

Wahrscheinlich nutzt du das Internet jeden Tag. Aber weißt du, was passiert, wenn du eine Adresse wie https://djangogirls.org im Browser aufrufst?

Als Erstes solltest du wissen, dass eine Webseite meist nur ein paar Dateien auf der Festplatte sind. Genau wie deine Filme, Mp3s oder Bilder. Das Besondere an Webseiten ist, dass sie aus speziellem Computer-Code bestehen, das sogenannte HTML.

Wenn du noch nie etwas mit Programmierung zu tun hattest, kann auch HTML zuerst abschreckend aussehen, aber dein Browser (Chrome, Safari, Firefox, etc.) liebt es. Browser sind so entworfen, dass sie diesen Code verstehen, seinen Anweisungen folgen können und diese Dateien, aus denen deine Website besteht, genau so darstellen, wie du es möchtest.

Wie jede andere Datei auch, muss die HTML-Datei irgendwo auf einer Festplatte gespeichert werden. Für das Internet verwenden wir spezielle, leistungsstarke Computer, sogenannte *Server*. An ihnen sind normalerweise weder Bildschirm, Maus oder Tastatur angeschlossen, weil der Hauptzweck der Server darin besteht, Daten zu speichern und zur Verfügung zu stellen. Sie heißen *Server*, weil sie dem Internet und uns dienen - Englisch: to *serve*.

Okay, aber wie funktioniert dieses Internet jetzt genau?

Wir haben ein Bild gemalt. So sieht es aus:

![Abbildung 1.1](images/internet_1.png)

Ziemliches Durcheinander, oder? Eigentlich ist es ein Netzwerk aus verbundenen Computern (den oben genannten *Servern*). Hunderttausende von Rechnern! Kilometer über Kilometer Kabel rund um die Welt. Auf einer Webseite über Unterseekabel (https://submarinecablemap.com/) kannst du dir ein Bild von der Komplexität des Netzes machen. Hier ist ein Screenshot der Seite:

![Abbildung 1.2](images/internet_3.png)

Faszinierend, oder? Offensichtlich ist es nicht möglich, Kabel zwischen allen Servern des Internet zu schalten. Um den Server, auf dem z.B. https://djangogirls.org gespeichert ist, zu erreichen, muss unsere Anfrage sehr viele andere Maschinen passieren.

Das sieht ungefähr so aus:

![Abbildung 1.3](images/internet_2.png)

Stell dir vor, wenn du https://djangogirls.org in den Browser eingibst, würdest du einen Brief versenden, in dem steht; "Hallo Django Girls, ich möchte die djangogirls.org Webseite ansehen. Bitte schickt sie mir!"

Der Brief kommt ins Postamt in deiner Nähe. Von da aus kommt der Brief zu einem anderen Postamt näher an der Zieladresse und näher und näher, bis der Brief zugestellt werden kann. Die einzigartige Sache ist, dass wenn du mehrere Briefe zu der selben Adresse abschickst (*Datenpakete*), jeder einzelne durch komplett unterschiedliche Poststellen laufen könnte (*Router*). Dies hängt davon ab, wie sie an jedem Standort verteilt werden.

![Abbildung 1.4](images/internet_4.png)

So einfach ist das im Prinzip. Du sendest Nachrichten und erwartest eine Antwort. Anstelle von Papier und Stift verwendest du Daten (Byte für Byte), aber die Idee ist dieselbe.

Anstelle von Adressen mit Straße, Ort und Postleitzahl verwenden wir IP-Adressen. IP steht für Internet Protocol. Ein Protokoll kann man mit einer Vereinbarung vergleichen, darin wird festgelegt, wie etwas funktionieren soll, ein allgemein gültiger Standard also. Im Internet Protocol steht zum Beispiel auch, wie eine IP-Adresse aufgebaut werden muss.

Um die von Menschen besser lesbare Adresse "djangogirls.org" in eine IP-Adresse, die von Maschinen besser lesbar ist, umzuwandeln, fragt dein Computer das DNS (Domain Name System). Das DNS ist ein bisschen wie ein altmodisches Telefonbuch aus Papier, in dem du zu einem bestimmten Namen Telefonnummer und Adresse nachgucken kannst.

Wenn du einen Brief versenden willst, brauchst du spezielle Dinge wie: Postanschrift, Briefmarke etc. Außerdem musst du eine Sprache verwenden, die der Empfänger versteht, logisch. Das gleiche gilt auch für die *Datenpakete*, die du sendest, um eine Website betrachten zu können. Wir verwenden einen vereinbarten Standard, ein Protokoll namens HTTP (Hypertext Transfer Protocol) oder HTTPS (Hypertext Transfer Protocol Secure).

Grundsätzlich brauchst du also für eine Website auch einen *Server*, auf dem sie abgelegt ist. Wenn der *Server* eine eingehende *Anforderung (Request)* (in einem Brief) empfängt, sendet er deine Website zurück (in einem weiteren Brief).

Da dies hier ein Django-Tutorial ist, fragst du dich sicher, was Django in diesem Zusammenhang macht!? Wenn du (bzw. dein Webserver) eine Antwort zurück sendest, willst du nicht an jeden dasselbe senden. Es ist besser, wenn die Antworten individuell personalisiert sind, entsprechend dem an dich gerichteten Anliegen. Django hilft dir, diese personalisierten Antworten zu erstellen.

Genug der Theorie, lass uns loslegen!
