# Kaj je Django?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) is a free and open source web application framework, written in Python. Ogrodje je skupek že napisanih programov, ki ti pomagajo spletne strani graditi hitreje in lažje.

Kot si opazila, obstajajo določeni gradniki, ki jih ima vsaka spletna stran: sistem za registriranje, plošča za upravljanje spletne strani, kontaktni obrazec, sistem za nalaganje datotek in podobno.

Luckily for you, other people long ago noticed that web developers face similar problems when building a new site, so they teamed up and created frameworks (Django being one of them) that give you ready-made components to use.

Frameworks exist to save you from having to reinvent the wheel and to help alleviate some of the overhead when you’re building a new site.

## Zakaj potrebujemo ogrodja?

To understand what Django is actually for, we need to take a closer look at the servers. The first thing is that the server needs to know that you want it to serve you a web page.

Predstavljaj si nabiralnik, ki čaka na prejeta pisma. Točno to počno spletni strežniki. The web server reads the letter and then sends a response with a webpage. Ta spletna stran pa mora jasno imeti neko vsebino. Pri ustvarjanju le-te, ti bo pomagal Django.

## Kaj se zgodi, ko nekdo od našega strežnika zahteva spletno stran?

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Predstavljaj si poštarja, ko dostavlja pismo. Ko hodi po ulici, da bi ga dostavil, mora za vsak naslov preveriti, če je isti, kot tisti na pismu. Ko najde pravi naslov, pismo tam odloži. Django deluje povsem enako!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Recimo, da želi uporabnik spremeniti svoje podatke, ki jih imamo shranjene v bazi. Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

The description above is a little bit simplified, but you don't need to know all the technical things yet. Having a general idea is enough.

So instead of diving too much into details, we will start creating something with Django and we will learn all the important parts along the way!