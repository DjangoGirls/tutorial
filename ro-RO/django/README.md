# Ce este Django?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) is a free and open source web application framework, written in Python. Un framework este un set de compenente care te ajută să îți dezvolți site-ul mai rapid și mai ușor.

Când faci un site web, întotdeauna vei avea nevoie de un grup de componente comune site-urilor web: un sistem de autentificare (înregistrare user, logare user, delogare), panou de administrare a site-ului, formulare, încărcare (upload) fișiere, etc.

Luckily for you, other people long ago noticed that web developers face similar problems when building a new site, so they teamed up and created frameworks (Django being one of them) that give you ready-made components to use.

Frameworks exist to save you from having to reinvent the wheel and to help alleviate some of the overhead when you’re building a new site.

## De ce ai nevoie de un framework?

To understand what Django is actually for, we need to take a closer look at the servers. The first thing is that the server needs to know that you want it to serve you a web page.

Imaginează-ți o cutie poștală (port) căreia îi sunt monitorizate scrisorile primite (cereri). Acest lucru este făcut de un server web. The web server reads the letter and then sends a response with a webpage. Dar când dorești să transmiți ceva, trebuie să ai careva conținut. Și Django este ceva care te ajută să creezi acel conținut.

## Ce se întâmplă când cineva solicită un site web de pe server?

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Imaginează-ți un poștaș cu o scrisoare. Ea trece de-a lungul străzii și compară la fiecare casă numărul cu cel de pe scrisoare. Dacă coincid, ea lasă scrisoarea acolo. Așa lucrează urlresolver-ul!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Poate utilizatorul a solicitat să schimbe ceva în baza de date? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

Desigur descrierea de mai sus este un pic simplificată, dar nu ai nevoie să știi toate lucrurile tehnice la moment. Este suficient să-ți faci o idee generală.

Deci, în loc să ne adâncim în detalii, pur și simplu vom începe a crea ceva cu Django și vom învăța toate părțile importante pe parcurs!