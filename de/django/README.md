# Django - Was ist das?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) is a free and open source web application framework, written in Python. Ein Web-(Anwendungs-)Framework ist eine Art Baukastensystem, das dir mit vielen vorgefertigten Teilen die Entwicklung von Webseiten stark erleichtert.

Wenn du eine Website entwickelst, brauchst du immer wieder sehr ähnliche Elemente: Einen Weg Benutzer zu verwalten (Registrierung, Anmeldung, Abmeldung etc.), einen Administrationsbereich, Formulare, Upload von Dateien usw.

Luckily for you, other people long ago noticed that web developers face similar problems when building a new site, so they teamed up and created frameworks (Django being one of them) that give you ready-made components to use.

Frameworks exist to save you from having to reinvent the wheel and to help alleviate some of the overhead when you’re building a new site.

## Warum brauchst du ein Framework?

To understand what Django is actually for, we need to take a closer look at the servers. The first thing is that the server needs to know that you want it to serve you a web page.

Der Server hat mehrere "Ports", vergleichbar einem Briefkasten, der auf eingehende Briefe "Anfragen"/"requests" überwacht wird. Das macht der Webserver. The web server reads the letter and then sends a response with a webpage. Um etwas ausliefern zu können, brauchen wir Inhalte. Und Django hilft dir dabei, diese Inhalte zu erstellen.

## Was passiert, wenn jemand eine Webseite beim Server anfordert?

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Stell dir eine Postbotin mit einem Brief vor. Sie geht die Straße entlang und prüft jede Hausnummer mit der Adresse auf dem Brief. Wenn beide passen, dann steckt sie den Brief in den Briefkasten. So funktioniert der urlresolver!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Vielleicht wollte die Benutzerin irgendetwas in den Daten ändern? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

Natürlich, ist die Beschreibung oben ein wenig vereinfacht, aber du musst noch nicht all die technischen Details wissen. Eine generelle Vorstellung zu haben, reicht erstmal.

Anstatt zu sehr ins Detail zu gehen, starten wir lieber damit, etwas Praktisches mit Django anzustellen. Du wirst die wichtigen Dinge im Laufe der Zeit lernen!