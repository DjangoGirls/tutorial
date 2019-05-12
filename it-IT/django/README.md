# Che cos'è Django?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) is a free and open source web application framework, written in Python. Un web framework è un insieme di componenti che ti aiuta a sviluppare siti web più velocemente e facilmente.

Per costruire un sito web ci vogliono sempre componenti molto simili: il sistema per gestire l'autenticazione dell'utente (registrazione, accesso, logout), il pannello di amministrazione del sito, il sistema per caricare i file, ecc.

Non sei la prima e non sarai l'ultima persona ad affrontare questi problemi: altri programmatori prima di te li hanno affrontati e risolti, tanto spesso e tanto ripetitivamente da aver distillato varie *web framework* (Django è una delle tante) che mettono a disposizione tutti gli elementi necessari, pronti per l'uso.

La funzione dei *framework* è evitare di dover reinventare l'acqua calda, e risparmiar tempo nel mettere in piedi un nuovo progetto.

## Perché ho bisogno di un framework?

Per capire bene cosa è Django, a cosa serve davvero, diamo uno sguardo più da vicino ai server. Tanto per incominciare, bisogna che il server sappia che gli si sta chiedendo qualcosa, per esempio una pagina web.

Immagina una cassetta delle lettere (port), che venga continuamente tenuta d'occhio, nel caso arrivino lettere (request). Questo è ciò che fa un server: tiene d'occhio un *port* e sbriga le *request* in arrivo. Un server web legge il contenuto della richiesta ed invia una risposta, sotto forma di pagina web. Ma quando vuoi inviare qualcosa, hai bisogno di avere qualche contenuto. E Django è ciò che ti aiuta a creare questo contenuto.

## Cosa succede quando qualcuno richiede un sito Web dal tuo server?

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Immagina un postino con una lettera. Sta camminando per la strada e controlla ogni numero civico mettendolo a confronto con quello sulla lettera. Se corrisponde, mette lì la lettera. Questo è il modo in cui l'urlresolver funziona!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Forse l'utente ha richiesto di cambiare qualcosa all'interno dei suoi dati? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

The description above is a little bit simplified, but you don't need to know all the technical things yet. Having a general idea is enough.

So instead of diving too much into details, we will start creating something with Django and we will learn all the important parts along the way!