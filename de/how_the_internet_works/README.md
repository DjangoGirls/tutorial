# Wie das Internet funktioniert

> For readers at home: this chapter is covered in the [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) video.
> 
> This chapter is inspired by the talk "How the Internet works" by Jessica McKellar (http://web.mit.edu/jesstess/www/).

We bet you use the Internet every day. But do you actually know what happens when you type an address like https://djangogirls.org into your browser and press `enter`?

Als Erstes solltest du wissen, dass eine Webseite meist nur ein paar Dateien auf der Festplatte sind. Genau wie deine Filme, Mp3s oder Bilder. Das Besondere an Webseiten ist, dass sie aus speziellem Computer-Code bestehen, das sogenannte HTML.

Wenn du noch nie etwas mit Programmierung zu tun hattest, kann auch HTML zuerst abschreckend aussehen, aber dein Browser (Chrome, Safari, Firefox, etc.) liebt es. Browser sind so entworfen, dass sie diesen Code verstehen, seinen Anweisungen folgen können und diese Dateien, aus denen deine Website besteht, genau so darstellen, wie du es möchtest.

Wie jede andere Datei auch, muss die HTML-Datei irgendwo auf einer Festplatte gespeichert werden. Für das Internet verwenden wir spezielle, leistungsstarke Computer, sogenannte *Server*. An ihnen sind normalerweise weder Bildschirm, Maus oder Tastatur angeschlossen, weil der Hauptzweck der Server darin besteht, Daten zu speichern und zur Verfügung zu stellen. That's why they're called *servers* – because they *serve* you data.

OK, but you want to know how the Internet looks, right?

Wir haben ein Bild gemalt. So sieht es aus:

![Abbildung 1.1](images/internet_1.png)

Ziemliches Durcheinander, oder? In fact it is a network of connected machines (the above-mentioned *servers*). Hunderttausende von Rechnern! Kilometer über Kilometer Kabel rund um die Welt. Auf einer Webseite über Unterseekabel (http://submarinecablemap.com/) kannst du dir ein Bild von der Komplexität des Netzes machen. Hier ist ein Screenshot der Seite:

![Abbildung 1.2](images/internet_3.png)

Faszinierend, oder? Offensichtlich ist es nicht möglich, Kabel zwischen allen Servern des Internet zu schalten. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

Das sieht ungefähr so aus:

![Abbildung 1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

Der Brief kommt ins Postamt in deiner Nähe. Von da aus kommt der Brief zu einem anderen Postamt näher an der Zieladresse und näher und näher, bis der Brief zugestellt werden kann. Die einzigartige Sache ist, dass wenn du mehrere Briefe zu der selben Adresse abschickst (*Datenpakete*), jeder einzelne durch komplett unterschiedliche Poststellen laufen könnte (*Router*). Dies hängt davon ab, wie sie an jedem Standort verteilt werden.

![Abbildung 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Of course, instead of paper and pen you use bytes of data, but the idea is the same!

Anstelle von Adressen mit Straße, Ort und Postleitzahl verwenden wir IP-Adressen. IP steht für Internet Protocol. Dein Computer fragt erst das DNS (Domain Name System), um die (von Menschen besser lesbare) Adresse djangogirls.org in die (besser von Maschinen lesbare) IP-Adresse umzuwandeln. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. Außerdem musst du eine Sprache verwenden, die der Empfänger versteht. Das gleiche gilt für die *Datenpakete*, die du sendest, um eine Website betrachten zu können. Wir verwenden ein Protokoll namens HTTP (Hypertext Transfer Protocol).

Grundsätzlich brauchst du also für eine Website auch einen *Server*, auf dem sie abgelegt ist. Wenn der *Server* eine eingehende *Anforderung* (in einem Brief) empfängt, sendet er deine Website zurück (in einem weiteren Brief).

Since this is a Django tutorial, you might ask what Django does. Wenn du (bzw. dein Webserver) eine Antwort zurück sendest, willst du nicht an jeden dasselbe senden. Es ist besser, wenn die Antworten individuell personalisiert sind, entsprechend dem an dich gerichteten Anliegen. Django helps you with creating these personalized, interesting letters. :)

Enough talk – time to create!