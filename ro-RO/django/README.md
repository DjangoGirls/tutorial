# Ce este Django?

Django (*/ˈdʒæŋɡoʊ/ jang-goh*) este un framework gratuit și open-source pentru aplicații web, scris în Python. Un framework este un set de compenente care te ajută să îți dezvolți site-ul mai rapid și mai ușor.

Atunci când construiești un web site, întodeauna vei avea nevoie de un set similar de compenente: o modalitate de a manipula autentificarea utilizatorului (înregistrare, autentificare, deconectare), un panou de administrare pentru web site-ul tău, forme și o modalitate de a încărca fișiere, etc.

Din fericire pentru tine, cu mult timp în urmă alți oameni au observat că dezvoltatorii web întâmpină probleme similare atunci când construiesc un web site nou, așa că ei au făcut echipă și au creat aceste framework-uri (infrastructuri) (Django fiind unul dintre acestea) care îți oferă componente gata făcute pentru folosire.

Framework-urile există pentru a te salva de la necesitatea de a reinventa roata și a te ajuta să treci peste lucrurile de rutină când creezi site-ul tău web.

## De ce ai nevoie de un framework?

Pentru a înțelege de ce avem nevoie de Django, avem nevoie să aruncăm o privire mai atentă la servere. Primul lucru este că serverul trebuie să știe că tu vrei de la el să îți reprezinte o pagină web.

Imaginează-ți o cutie poștală (port) căreia îi sunt monitorizate scrisorile primite (cereri). Acest lucru este făcut de un server web. Serverul web citește scrisoarea, și trimite un răspuns cu o pagină web. Dar când dorești să transmiți ceva, trebuie să ai careva conținut. Și Django este ceva care te ajută să creezi acel conținut.

## Ce se întâmplă când cineva solicită un site web de pe server?

Când un web server primește o cerere, ea este transmisă către Django, care încearcă să-și dea seama ce de fapt este solicitat. Mai întâi primește o adresă de pagină web și încearcă să-și dea seama ce să facă. Această parte se face prin **urlresolver**-ul la Django (o adresă de pagină web se numește URL (Uniform Resource Locator) - Localizator Uniform de Resurse, deci numele de *urlresolver* are sens). Nu este prea inteligent - ia o listă de modele și încearcă să le potrivească cu URL-ul. Django verifică modelele de sus până jos și dacă se potrivește ceva, Django trimite cererea la funcția potrivită (care se numește *view*).

Imaginează-ți un poștaș cu o scrisoare. Ea trece de-a lungul străzii și compară la fiecare casă numărul cu cel de pe scrisoare. Dacă coincid, ea lasă scrisoarea acolo. Așa lucrează urlresolver-ul!

În funcția *view* se realizează toate lucrurile interesante: ne putem uita într-o bază de date pentru a căuta o informație anumită. Poate utilizatorul a solicitat să schimbe ceva în baza de date? Cum ar fi o scrisoare „Vă rog să schimbați descrierea job-ului meu.” Un *view* poate verifica dacă îți este permis să faci asta, apoi să actualizeze descrierea job-ului pentru tine și să răspundă cu un mesaj de confirmare: „Gata!”.

Desigur descrierea de mai sus este un pic simplificată, dar nu este nevoie să știți toate lucrurile tehnice la moment. Este suficient să vă faceți o idee generală.

Deci, în loc să ne adâncim în detalii, pur și simplu vom începe a crea ceva cu Django și vom învăța toate părțile importante pe parcurs!