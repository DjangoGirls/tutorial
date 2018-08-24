# Ce este Django?

Django (*/ˈdʒæŋɡoʊ/ jang-goh*) este un framework gratuit și open-source pentru aplicații web, scris în Python. Un framework este un set de compenente care te ajută să îți dezvolți site-ul mai rapid și mai ușor.

Atunci când construiești un web site, întodeauna vei avea nevoie de un set similar de compenente: o modalitate de a manipula autentificarea utilizatorului (înregistrare, autentificare, deconectare), un panou de administrare pentru web site-ul tău, forme și o modalitate de a încărca fișiere, etc.

Din fericire pentru tine, cu mult timp în urmă alți oameni au observat că dezvoltatorii web întâmpină probleme similare atunci când construiesc un web site nou, așa că ei au făcut echipă și au creat aceste framework-uri (infrastructuri) (Django fiind unul dintre acestea) care îți oferă componente gata făcute pentru folosire.

Frameworks exist to save you from having to reinvent the wheel and to help alleviate some of the overhead when you’re building a new site.

## De ce ai nevoie de un framework?

To understand what Django is actually for, we need to take a closer look at the servers. The first thing is that the server needs to know that you want it to serve you a web page.

Imaginează-ți o cutie poștală (port) căreia îi sunt monitorizate scrisorile primite (cereri). Acest lucru este făcut de un server web. The web server reads the letter and then sends a response with a webpage. Dar când dorești să transmiți ceva, trebuie să ai careva conținut. Și Django este ceva care te ajută să creezi acel conținut.

## Ce se întâmplă când cineva solicită un site web de pe server?

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Imaginează-ți un poștaș cu o scrisoare. Ea trece de-a lungul străzii și compară la fiecare casă numărul cu cel de pe scrisoare. Dacă coincid, ea lasă scrisoarea acolo. Așa lucrează urlresolver-ul!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Poate utilizatorul a solicitat să schimbe ceva în baza de date? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

The description above is a little bit simplified, but you don't need to know all the technical things yet. Having a general idea is enough.

So instead of diving too much into details, we will start creating something with Django and we will learn all the important parts along the way!