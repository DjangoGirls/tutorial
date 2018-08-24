# Come funziona l'Internet

> For readers at home: this chapter is covered in the [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) video.
> 
> This chapter is inspired by the talk "How the Internet works" by Jessica McKellar (http://web.mit.edu/jesstess/www/).

We bet you use the Internet every day. But do you actually know what happens when you type an address like https://djangogirls.org into your browser and press `enter`?

The first thing you need to understand is that a website consists of a bunch of files saved on a hard disk. Proprio come i tuoi film, la tua musica e le tue immagini. Tuttavia, c'è una caratteristica tipica dei siti web: includono un codice chiamato HTML.

Se non hai familiarità con la programmazione, può essere difficile da capire l'HTML all'inizio, ma i tuoi web browser (come Chrome, Safari, Firefox, ecc) lo adorano. I browser sono progettati per capire questo codice, seguire le sue istruzioni e presentare questi file che costituiscono il tuo sito web esattamente nel modo desiderato.

Come per tutti i file, dobbiamo archiviare i file HTML da qualche parte su un hard disk. Per l'Internet, utilizziamo computer speciali e potenti chiamati *servers*. Non hanno uno schermo, un mouse o una tastiera, perché il loro unico proposito è quello di archiviare i dati e fornirli. That's why they're called *servers* – because they *serve* you data.

OK, but you want to know how the Internet looks, right?

Abbiamo creato un'immagine! Ecco com'è:

![Figura 1.1](images/internet_1.png)

Sembra caotico, vero? In fact it is a network of connected machines (the above-mentioned *servers*). Centinaia di migliaia di macchine! Molti, molti chilometri di cavi in tutto il mondo! Puoi visitare un sito di Submarine Cable Map (http://submarinecablemap.com) per vedere quanto è complicata la rete. Ecco uno screenshot dal sito web:

![Figura 1.2](images/internet_3.png)

E' affascinante, non è vero? But it is not possible to have a wire between every machine connected to the Internet. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

Assomiglia a questo:

![Figura 1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

La tua lettera arriva nell'ufficio postale più vicino a te. Dopo di che va in un altro ufficio postale, che è un po' più vicino al tuo destinatario, poi in un altro ed in un altro ancora finché viene consegnato a destinazione. L'unica cosa è che se invii molte lettere (*pacchi di dati*) allo stesso posto, potrebbero attraversare uffici postali totalmente diversi (*routers*). Questo dipende da come vengono distribuiti presso ogni ufficio.

![Figura 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Instead of paper and pen you use bytes of data, but the idea is the same!

Al posto di indirizzi fisici, ovvero del nome della via, della città, del Cap, e del nome del Paese, usiamo indirizzi IP. Il tuo computer prima chiede il DNS (Domain Name System) per tradurre djangogirls.org in un indirizzo IP. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. Inoltre utilizzi un linguaggio che il destinatario è in grado di capire, vero? Lo stesso vale per i *pacchi di dati* che invii per vedere un sito Web. Usiamo un protocollo chiamato HTTP (Hypertext Transfer Protocol).

Quindi, praticamente, quando hai un sito, devi avere un *server* (macchina) dove archiviarlo. Quando il *server* riceve una *richiesta* (in una lettera), restituisce il tuo sito (in un'altra lettera).

Since this is a Django tutorial, you might ask what Django does. Quando invii una risposta, non vuoi inviare la stessa cosa a tutti. E' molto meglio se le tue lettere son personalizzate, soprattutto per la persona che ti ha appena scritto, giusto? Django ti aiuta con la creazione di queste interessanti lettere personalizzate. :)

Enough talk – time to create!