# Come funziona Internet

> Per le lettrici a casa: questo capitolo viene trattato nel video [Come funziona Internet](https://www.youtube.com/watch?v=oM9yAA09wdc).
> 
> Questo capitolo trae ispirazione dal discorso di Jessica McKellar "Come funziona Internet" (http://web.mit.edu/jesstess/www/).

Scommettiamo che usi Internet tutti i giorni. Ma sai davvero cosa succede quando digiti un indirizzo come https://djangogirls.org nel tuo browser e premi `invio`?

La prima cosa da capire è che un sito è è composto da un gruppo di file salvati su un hard disk. Tuttavia, c'è una caratteristica tipica dei siti web: includono un codice chiamato HTML.

Se non hai familiarità con la programmazione, può essere difficile da cogliere HTML all'inizio, ma i tuoi web browser (come Chrome, Safari, Firefox, ecc) lo adorano. I browser sono progettati per capire questo codice, seguire le sue istruzioni e presentare questi file che costituiscono il tuo sito web esattamente nel modo desiderato.

Come per tutti i file, dobbiamo archiviare i file HTML da qualche parte su un hard disk. Per l'Internet, utilizziamo computer speciali e potenti chiamati *servers*. Non hanno uno schermo, un mouse o una tastiera, perché il loro unico proposito è quello di archiviare i dati e fornirli. Per questo vengono chiamati *server* -- perché *servono* i tuoi dati.

Ok, ma tu vuoi sapere com'è Internet, vero?

Abbiamo creato un'immagine! Ecco:

![Figura 1.1](images/internet_1.png)

Sembra complicato, vero? Infatti è una rete di macchine collegate (i *server* di cui parlavamo prima). Centinaia di migliaia di macchine! Molti, molti chilometri di cavi in tutto il mondo! Puoi visitare un sito di Submarine Cable Map (http://submarinecablemap.com) per vedere quanto è complicata la rete. Ecco uno screenshot dal sito web:

![Figura 1.2](images/internet_3.png)

E' affascinante, non è vero? Ma ovviamente, non è possibile avere un cavo fra ogni macchina collegata ad Internet. Quindi, per raggiungere una macchina (per esempio quella in cui è salvato https://djangogirls.org) dobbiamo far passare una richiesta attraverso a molte, molte macchine diverse.

Assomiglia a questo:

![Figura 1.3](images/internet_2.png)

Immagina che quando digiti https://djangogirls.org invii una lettera che dice: "Caro Django Girls, voglio vedere il sito djangogirls.org. inviamelo, per favore!"

La tua lettera arriva nell'ufficio postale più vicino a te. Dopo di che va in un altro ufficio postale, che è un po' più vicino al tuo destinatario, poi in un altro ed in un altro ancora finché viene consegnato a destinazione. L'unica cosa è che se invii molte lettere (*pacchi di dati*) allo stesso posto, potrebbero attraversare uffici postali totalmente diversi (*routers*). Questo dipende da come vengono distribuiti presso ogni ufficio.

![Figura 1.4](images/internet_4.png)

Funziona così - invii un messaggio e aspetti una risposta. Solo che al posto di carta e penna usi byte di dati, ma il concetto è lo stesso!

Al posto di indirizzi fisici, ovvero del nome della via, della città, del Cap, e del nome del Paese, usiamo indirizzi IP. Il tuo computer prima chiede il DNS (Domain Name System) per tradurre djangogirls.org in un indirizzo IP. Funziona un po' come i vecchi elenchi telefonici, dove puoi cercare il nome della persona che vuoi contattare e trovare il numero telefonico e l'indirizzo.

Quando invii una lettera, deve avere determinate caratteristiche per essere consegnata correttamente: un indirizzo, un timbro, ecc. Inoltre utilizzi un linguaggio che il destinatario è in grado di capire, vero? Lo stesso vale per i *pacchi di dati* che invii per vedere un sito Web. Usiamo un protocollo chiamato HTTP (Hypertext Transfer Protocol).

Quindi, praticamente, quando hai un sito, devi avere un *server* (macchina) dove archiviarlo. Quando il *server* riceve una *richiesta* (in una lettera), restituisce il tuo sito (in un'altra lettera).

Dal momento che questo è il tutorial di Django, ti starai chiedendo che cosa fa Django. Quando invii una risposta, non vuoi inviare la stessa cosa a tutti. E' molto meglio se le tue lettere son personalizzate, soprattutto per la persona che ti ha appena scritto, giusto? Django ti aiuta con la creazione di queste interessanti lettere personalizzate. :)

Basta parlare, è arrivata l'ora di creare!