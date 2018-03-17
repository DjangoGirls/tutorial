# Django - Was ist das?

Django (*/ˈdʒæŋɡoʊ/ jang-goh*) ist ein freies, Open-Source Web-Anwendungs-Framework, geschrieben in Python. Ein Web-(Anwendungs-)Framework ist eine Art Baukastensystem, das dir mit vielen vorgefertigten Teilen die Entwicklung von Webseiten stark erleichtert.

Wenn du eine Website entwickelst, brauchst du immer wieder sehr ähnliche Elemente: Einen Weg Benutzer zu verwalten (Registrierung, Anmeldung, Abmeldung etc.), einen Administrationsbereich, Formulare, Upload von Dateien usw.

Glücklicherweise wurde schon vor einiger Zeit erkannt, dass Web-Entwickler immer wieder die gleichen Probleme zu lösen haben. Gemeinsam entstanden so verschiedene Frameworks (Django ist so eines), welche die Web-Entwicklung durch vorgefertigte Elemente erleichtern.

Frameworks sind dazu da, damit du das Rad nicht neu erfinden musst. Du kannst dich auf die konkret zu erfüllenden Anforderungen der Webseite kümmern. Die grundlegende Basis der Webseite stellt dir das Framework zur Verfügung.

## Warum brauchst du ein Framework?

Um besser zu verstehen, welche Vorteile dir Django bietet, werfen wir einen Blick auf Server im Allgemeinen. Als Erstes muss der Server wissen, dass er eine Webseite ausliefern soll.

Der Server hat mehrere "Ports", vergleichbar einem Briefkasten, der auf eingehende Briefe "Anfragen"/"requests" überwacht wird. Das macht der Webserver. Der Webserver liest die eingeworfenen Briefe (requests) und beantwortet sie mit der Webseite (response). Um etwas ausliefern zu können, brauchen wir Inhalte. Und Django hilft dir dabei, diese Inhalte zu erstellen.

## Was passiert, wenn jemand eine Webseite beim Server anfordert?

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Stell dir eine Postbotin mit einem Brief vor. Sie geht die Straße entlang und prüft jede Hausnummer mit der Adresse auf dem Brief. Wenn beide passen, dann steckt sie den Brief in den Briefkasten. So funktioniert der urlresolver!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Vielleicht wollte die Benutzerin irgendetwas in den Daten ändern? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

Natürlich, ist die Beschreibung oben ein wenig vereinfacht, aber du musst noch nicht all die technischen Details wissen. Eine generelle Vorstellung zu haben, reicht erstmal.

Anstatt zu sehr ins Detail zu gehen, starten wir lieber damit, etwas Praktisches mit Django anzustellen. Du wirst die wichtigen Dinge im Laufe der Zeit lernen!