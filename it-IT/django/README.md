# Che cos'è Django?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) is a free and open source web application framework, written in Python. Un web framework è un insieme di componenti che ti aiuta a sviluppare siti web più velocemente e facilmente.

Quando si costruisce un sito web, si ha sempre bisogno di un insieme di componenti simili: un sistema per gestire l'autenticazione dell'utente (registrazione, accesso, logout), un pannello di amministrazione per il tuo sito web, un sistema per caricare i file, ecc.

Luckily for you, other people long ago noticed that web developers face similar problems when building a new site, so they teamed up and created frameworks (Django being one of them) that give you ready-made components to use.

Frameworks exist to save you from having to reinvent the wheel and to help alleviate some of the overhead when you’re building a new site.

## Perché ho bisogno di un framework?

To understand what Django is actually for, we need to take a closer look at the servers. The first thing is that the server needs to know that you want it to serve you a web page.

Immagina una cassetta delle lettere che monitora tutte le lettere in entrata (richieste). Questo è ciò che fa un web server. The web server reads the letter and then sends a response with a webpage. Ma quando vuoi inviare qualcosa, hai bisogno di avere qualche contenuto. E Django è ciò che ti aiuta a creare questo contenuto.

## Cosa succede quando qualcuno richiede un sito Web dal tuo server?

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Immagina un postino con una lettera. Sta camminando per la strada e controlla ogni numero civico mettendolo a confronto con quello sulla lettera. Se corrisponde, mette lì la lettera. Questo è il modo in cui l'urlresolver funziona!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Forse l'utente ha richiesto di cambiare qualcosa all'interno dei suoi dati? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

The description above is a little bit simplified, but you don't need to know all the technical things yet. Having a general idea is enough.

So instead of diving too much into details, we will start creating something with Django and we will learn all the important parts along the way!