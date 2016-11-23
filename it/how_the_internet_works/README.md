# Come funziona Internet

> Questo capitolo è ispirato ad un discorso di Jessica McKellar "How the Internet Works" (http://web.mit.edu/jesstess/www/).

Scommettiamo che usi Internet tutti i giorni. Ma sai davvero che cosa succede quando digiti un indirizzo come https://djangogirls.org nel tuo browser e premi `invio`?

La prima cosa da capire è che un sito è solo un gruppo di file salvati su un hard disk. Proprio come i tuoi film, la tua musica e le tue immagini. Tuttavia, c'è una caratteristica tipica dei siti web: includono un codice chiamato HTML.

Se non hai familiarità con la programmazione, può essere difficile da capire l'HTML all'inizio, ma i tuoi web browser (come Chrome, Safari, Firefox, ecc) lo adorano. I browser sono progettati per capire questo codice, seguire le sue istruzioni e presentare questi file che costituiscono il tuo sito web esattamente nel modo desiderato.

Come per tutti i file, dobbiamo archiviare i file HTML da qualche parte su un hard disk. Per l'Internet, utilizziamo computer speciali e potenti chiamati *servers*. Non hanno uno schermo, un mouse o una tastiera, perché il loro unico proposito è quello di archiviare i dati e fornirli. È per quello che vengono chiamati *servers* -- perché essi *servono* i tuoi dati.

OK, ma tu vuoi sapere com'è internet, vero?

Abbiamo creato un'immagine! Ecco com'è:

![Figura 1.1][1]

 [1]: images/internet_1.png

Sembra caotico, vero? Infatti è una rete di macchine collegate (i *servers* che abbiamo menzionato prima). Centinaia di migliaia di macchine! Molti, molti chilometri di cavi in tutto il mondo! Puoi visitare un sito di Submarine Cable Map (http://submarinecablemap.com) per vedere quanto è complicata la rete. Ecco uno screenshot dal sito web:

![Figura 1.2][2]

 [2]: images/internet_3.png

È affascinante, non è vero? Ma ovviamente, non è possibile avere un cavo fra ogni macchina collegata ad Internet. Quindi, per raggiungere una macchina (per esempio quella in cui è salvato https://djangogirls.org) dobbiamo far passare una richiesta attraverso a molte, molte macchine diverse.

Assomiglia a questo:

![Figura 1.3][3]

 [3]: images/internet_2.png

Immagina che quando digiti https://djangogirls.org invii una lettera che dice: "Caro Django Girls, voglio vedere il sito djangogirls.org. inviamelo, per favore!"

La tua lettera arriva nell'ufficio postale più vicino a te. Dopo di che va in un altro ufficio postale, che è un po' più vicino al tuo destinatario, poi in un altro ed in un altro ancora finché viene consegnato a destinazione. L'unica cosa è che se invii molte lettere (*pacchi di dati*) allo stesso posto, potrebbero attraversare uffici postali totalmente diversi (*routers*). Questo dipende da come vengono distribuiti presso ogni ufficio.

![Figura 1.4][4]

 [4]: images/internet_4.png

Si, è esattamente così. Tu invii messaggi e ti aspetti una risposta. Certo, invece di carta e penna usi i bytes di dati, ma l'idea è la stessa!

Al posto di indirizzi fisici, ovvero del nome della via, della città, del Cap, e del nome del Paese, usiamo indirizzi IP. Il tuo computer prima chiede il DNS (Domain Name System) per tradurre djangogirls.org in un indirizzo IP. Funziona un po' come i vecchi elenchi telefonici, dove cercando il nome della persona che volevi contattare potevi trovare il numero telefonico e l'indirizzo.

Quando invii una lettera, deve avere determinate caratteristiche per essere consegnata correttamente: un indirizzo, un timbro, ecc. Inoltre utilizzi un linguaggio che il destinatario è in grado di capire, vero? Lo stesso vale per i *pacchi di dati* che invii per vedere un sito Web. Usiamo un protocollo chiamato HTTP (Hypertext Transfer Protocol).

Quindi, praticamente, quando hai un sito, devi avere un *server* (macchina) dove archiviarlo. Quando il *server* riceve una *richiesta* (in una lettera), restituisce il tuo sito (in un'altra lettera).

Dal momento che questo è il tutorial di Django, ti chiederai cosa fa Django. Quando invii una risposta, non vuoi inviare la stessa cosa a tutti. È molto meglio se le tue lettere son personalizzate, soprattutto per la persona che ti ha appena scritto, giusto? Django ti aiuta con la creazione di queste interessanti lettere personalizzate :).

Basta parlare, è arrivata l'ora di creare!