# Dominio

Heroku ti ha dato un dominio, ma è lungo, difficile da ricordare e brutto. Sarebbe fantastico avere un dominio che sia corto e facile da ricordare, non credi?

in questo capitolo ti insegneremo come comprare un dominio e dirigerlo verso Heroku!

## Dove registrare un dominio?

un dominio costa circa 15 dollari all'anno. Ci sono opzioni più economiche e più costose, a seconda del fornitore. Ci sono tantissime aziende dalle quali puoi comprare un dominio: un semplice [google search][1] darà centinaia di opzioni.

 [1]: https://www.google.com/search?q=register%20domain

Il nostro preferito è [I want my name][2]. Essi si promuovono come "gestione del dominio indolore" ed è veramente indolore.

 [2]: https://iwantmyname.com/

## Come registrare un dominio in IWantMyName?

Vai su [iwantmyname][3] e digita un dominio che vuoi ottenere nella casella di ricerca.

 [3]: https://iwantmyname.com

![][4]

 [4]: images/1.png

Dovresti vedere una lista dei domini disponibili contenenti il termine che hai inserito nella casella di ricerca. Come vedi, una faccina sorridente indica che il dominio è disponibile e può essere comprato, mentre una faccina triste indica che è già stato preso.

![][5]

 [5]: images/2.png

Abbiamo deciso di comprare `djangogirls.in`:

![][6]

 [6]: images/3.png

Vai alla cassa. Dovresti iscriverti a iwantmyname se non hai ancora un'account. Poi fornisci le informazioni sulla tua carta di credito e compra un dominio!

Poi clicca su `Domains` nel menù e scegli il tuo nuovo dominio. Infine individua e clicca sul link `manage DNS records`:

![][7]

 [7]: images/4.png

Ora devi individuare questo form:

![][8]

 [8]: images/5.png

E riempilo con i seguenti dati: - Hostname: www - Type: CNAME - Value: il tuo dominio da Heroku (per esempio djangogirls.herokuapp.com) - TTL: 3600

![][9]

 [9]: images/6.png

Clicca il pulsante 'Aggiungi' e 'Salva' in fondo alla pagina per salvare cambiamenti.

Perchè il tuo dominio cominci a funzionare potrebbero essere necessarie fino ad un paio di ore, quindi sii paziente!

## Fai la configurazione del dominio su Heroku

Devi dire a Heroku anche che vuoi utilizzare il tuo dominio personalizzato.

Vai sulla [Heroku Dashboard][10], fai il login nel tuo account Heroku e scegli la tua app. Poi vai nelle impostazioni dell'app e aggiungi il tuo dominio nella sezione `Domini` e salva le tue modifiche.

 [10]: https://dashboard.heroku.com/apps

Questo è tutto!