# Che cos'è Django?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) è un framework per applicazioni web gratuito e open source, scritto in Python. Un web framework è un insieme di componenti che ti aiuta a sviluppare siti web più velocemente e facilmente.

Per costruire un sito web ci vogliono sempre componenti molto simili: il sistema per gestire l'autenticazione dell'utente (registrazione, accesso, logout), il pannello di amministrazione del sito, il sistema per caricare i file, ecc.

Non sei la prima e non sarai l'ultima persona ad affrontare questi problemi: altri programmatori prima di te li hanno affrontati e risolti, tanto spesso e tanto ripetitivamente da aver distillato varie *web framework* (Django è una delle tante) che mettono a disposizione tutti gli elementi necessari, pronti per l'uso.

La funzione dei *framework* è evitare di dover reinventare l'acqua calda, e risparmiar tempo nel mettere in piedi un nuovo progetto.

## Perché ho bisogno di un framework?

Per capire bene cosa è Django, a cosa serve davvero, diamo uno sguardo più da vicino ai server. Tanto per incominciare, bisogna che il server sappia che gli si sta chiedendo qualcosa, per esempio una pagina web.

Immagina una cassetta delle lettere (port), che venga continuamente tenuta d'occhio, nel caso arrivino lettere (request). Questo è ciò che fa un server: tiene d'occhio un *port* e sbriga le *request* in arrivo. Un server web legge il contenuto della richiesta ed invia una risposta, sotto forma di pagina web. Ma quando vuoi inviare qualcosa, hai bisogno di avere qualche contenuto. E Django è ciò che ti aiuta a creare questo contenuto.

## Cosa succede quando qualcuno richiede un sito Web dal tuo server?

Quando una richiesta arriva ad un server web, questi lo passa a Django, che la interpreta, per capire cosa si stia richiedendo precisamente. Django esamina prima di tutto l'indirizzo della pagina web richiesta, e decide come proseguire. Di questa parte si occupa lo **urlresolver** di Django, (nota che un indirizzo di una pagina web si chiama URL, che sta per Localizzatore Uniforme di Risorse, cosa che spiega il nome *urlresolver*). Questo urlresolver non è nulla di trascendentale, non fa che raccogliere una serie di schemi e prova a trovare la corrispondenza per lo URL. Django passa in rassegna gli schemi disponibili, ed al primo che si adatti, passa la richiesta alla funzione associata (che si chiama *view*).

Immagina un postino con una lettera. Sta camminando per la strada e controlla ogni numero civico mettendolo a confronto con quello sulla lettera. Se corrisponde, mette lì la lettera. Questo è il modo in cui l'urlresolver funziona!

Nella funzione *view*, è lì che avviene il vero lavoro: per esempio cercare in una base dati l'informazione richiesta. Forse l'utente ha richiesto di cambiare qualcosa all'interno dei suoi dati? Come se una lettera (la richiesta) dicesse: "aggiorna la descrizione del mio lavoro". La *view* verifica se hai autorizzazione a farlo, se sì, accetta il valore ricevuto come nuova descrizione, lo invia al database, e se il database le risponde "ok", la *view* costruisce la risposta alla richiesta iniziale, in modo che Django la possa servire al navigatore web dell'utente.

La descrizione precedente è un tantinello semplificata, ma non c'è ancora bisogno di entrare nei dettagli tecnici. Serve bene per farsi un'idea corretta della interazione.

A questo punto, lasciamo perdere i dettagli, che c'è tempo per impararli, e iniziamo piuttosto ad usare Django per costruire qualcosa. Strada facendo impareremo quello che manca, poco per volta.