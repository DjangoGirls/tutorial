# Què és Django?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) és un entorn de treball per aplicacions web (framework web) escrit en Python, de codi lliure i gratuït. Un framework web consta d'un conjunt de components que t'ajuden a desenvolupar llocs web d'una forma més ràpida i fàcil.

En la construcció d'un lloc web necessitem sempre un conjunt de components semblant: una forma de gestionar l'autenticació d'usuaris (registre, inici i tancament de sessió), un panell de control, formularis, un sistema per carregar fitxers, etc.

Afortunadament per a tu, algú es va adonar fa molt de temps que les desenvolupadores web s'enfronten un i altre cop als mateixos problemes quan construeixen un lloc web. Així doncs, es van unir i crearen els frameworks (com ara Django), que et proporcionen components llestos per ser emprats.

Els frameworks existeixen per estalviar-te haver de reinventar la roda i ajudar-te a a alleugerir la sobrecàrrega que això suposa quan estàs construint un nou lloc web.

## Per què necessites un framework?

Per entendre la finalitat de Django necessitem entendre una mica els servidors. La primera cosa que un servidor necessita saber és que vols que et proporcioni una pàgina web.

Imagina una bústia de correu (port) que s'observa per saber quan arriben cartes (peticions). Això ho fa un servidor web. El servidor web llegeix la carta i envia una resposta amb una pàgina web. Quan vols enviar alguna cosa, però, necessites un contingut. Contingut que Django t'ajuda a crear.

## Què és el que passa quan algú demana per un lloc web al teu servidor?

Quan una petició arriba al servidor web, s'envia a Django, que tracta d'entendre que és el que s'està sol·licitant. Primer agafa l'adreça d'una pàgina web i intenta esbrinar què n'ha de fer. D'això s'encarrega un component de Django que anomenem **urlresolver** (fixa't que l'adreça d'un lloc web es diu URL (localitzador uniforme de recursos – Uniform Resource Locator –. Per tant, el mot *urlresolver* té el seu sentit). Aquest component no és gaire llest: disposa d'un llistat de patrons i mira d'esbrinar amb quin d'ells coincideix la URL en qüestió. Django comprova els patrons d'adalt a baix i si algun coincideix, aleshores envia la petició a la funció associada (que anomenem *view* – vista –).

Imagina una cartera amb una carta per entregar. Va caminant pel carrer tot mirant els números dels edificis per trobar el que coincideix amb el que hi ha escrit a la carta. Si en troba un que coincideix, allà entrega la carta. Així és com funciona l'urlresolver!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Potser l'usuari ha demanat canviar alguna dada? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

The description above is a little bit simplified, but you don't need to know all the technical things yet. Having a general idea is enough.

So instead of diving too much into details, we will start creating something with Django and we will learn all the important parts along the way!