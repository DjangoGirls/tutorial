# Che cos'è Django?

Django (*/ˈdʒæŋɡoʊ/ jang-goh*) è un framework per applicazioni web gratuito e open source, scritto in Python. Un web framework è un insieme di componenti che ti aiuta a sviluppare siti web più velocemente e facilmente.

Quando si costruisce un sito web, si ha sempre bisogno di un insieme di componenti simili: un sistema per gestire l'autenticazione dell'utente (registrazione, accesso, logout), un pannello di amministrazione per il tuo sito web, un sistema per caricare i file, ecc.

Fortunatamente, alcune persone diverso tempo fa si sono rese conto che gli sviluppatori web incontrano problemi simili ogni volta che costruiscono un sito internet. Per questo motivo si sono uniti e hanno costruito dei framework (di cui Django fa parte) che offrono componenti già pronti per l'uso.

I frameworks esistono per evitare che tu debba reinventare la ruota e ti semplificano il lavoro quando crei un nuovo sito.

## Perché ho bisogno di un framework?

Per capire Django, abbiamo bisogno di dare un'occhiata più da vicino ai server. La prima cosa che il server deve sapere è che vuoi che ti fornisca una pagina web.

Immagina una cassetta delle lettere che monitora tutte le lettere in entrata (richieste). Questo è ciò che fa un web server. Il web server legge le lettere, e invia una risposta con una pagina web. Ma quando vuoi inviare qualcosa, hai bisogno di avere qualche contenuto. E Django è ciò che ti aiuta a creare questo contenuto.

## Cosa succede quando qualcuno richiede un sito Web dal tuo server?

Quando una richiesta arriva al web server, viene passata a Django che prova a capire che cosa é stato veramente richiesto. Django prende l'indirizzo della pagina web e cerca di capire cosa deve fare. Questa parte viene svolta da Django **urlresolver** (nota che l'indirizzo di una pagina web si chiama URL - Uniform Resource Locator -per cui il nome *urlresolver* acquista significato). Non é molto intelligente -ha bisogno di una serie di schemi e in seguito prova a far corrispondere l'URL. Django controlla questi modelli o schemi da cima a fondo e se qualcosa corrisponde a quel punto Django passa la richiesta alla funzione associata (che si chiama *view*).

Immagina un postino con una lettera. Sta camminando per la strada e controlla ogni numero civico mettendolo a confronto con quello sulla lettera. Se corrisponde, mette lì la lettera. Questo è il modo in cui l'urlresolver funziona!

Nella funzione *view* avvengono tutte le cose più interessanti: possiamo consultare un database alla ricerca di qualche informazione. Forse l'utente ha richiesto di cambiare qualcosa all'interno dei suoi dati? È come una lettera che dice "Per favore cambia la descrizione del mio lavoro". La *view* può controllare se sei autorizzata a farlo, poi aggiorna la descrizione del lavoro per te e manda un messaggio: "Fatto!". In seguito, la *view* genera una risposta e Django la può inviare al browser dell'utente.

Naturalmente, la descrizione qui sopra é molto semplificata, ma per il momento non hai bisogno di sapere nel dettaglio tutti gli aspetti tecnici. Avere il senso generale per il momento è abbastanza.

Per cui invece di perderci troppo nei dettagli, creeremo semplicemente qualcosa usando Django e apprenderemo i concetti fondamentali lungo la strada!