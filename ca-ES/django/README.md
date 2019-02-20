# Què és Django?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) és un entorn de treball per aplicacions web (framework web) de codi lliure i gratuït escrit en Python. Un framework web consta d'un seguit de components que ens ajuda a desenvolupar llocs web d'una forma més fàcil i ràpida.

En la construcció d'un lloc web necessitem sempre un conjunt de components semblant: una forma de gestionar l'autenticació d'usuaris (registre, inici i tancament de sessió), un panell de control, formularis, un sistema per carregar fitxers, etc.

Afortunadament per nosaltres, algú es va adonar fa molt de temps que les desenvolupadores web s'enfronten un i altre cop als mateixos problemes quan construeixen un lloc web. Així doncs, es van unir i crearen frameworks (com ara Django) amb components llestos per ser emprats.

Els frameworks existeixen per estalviar-nos haver de reinventar la roda i ajudar-nos a disminuir el treball addicional que això implica quan estem construint un nou lloc web.

## Per què necessitem un framework?

Per entendre la finalitat de Django necessitem entendre una mica els servidors. La primera cosa de la que un servidor se n'ha d'adonar és que volem que ens proporcioni una determinada pàgina web.

Imagina una bústia de correu (port) que s'observa per saber quan arriben cartes (peticions). Això mateix és el que fa un servidor web. El servidor web llegeix la carta i envia una resposta amb la pàgina web. Per enviar alguna cosa, però, necessitem un contingut. Contingut que Django ens ajuda a crear.

## Què és el que passa quan algú demana per un lloc web al teu servidor?

Quan una petició arriba al servidor web, s'envia a Django, que tracta d'entendre que és el que se li està demanant. Primer agafa l'adreça de la pàgina web i intenta esbrinar què n'ha de fer. D'això s'encarrega un component de Django anomenat **urlresolver** (fixa't que l'adreça d'un lloc web es diu URL (localitzador uniforme de recursos – Uniform Resource Locator –. Per tant, el mot *urlresolver* sembla ben triat). Aquest component no és gaire llest: disposa d'un llistat de patrons i mira d'esbrinar a quin d'ells s'ajusta la URL en qüestió. Django revisa els patrons d'adalt a baix i si en troba un de coincident, aleshores envia la petició a la funció associada (que anomenem *view* – vista –).

Imagina una cartera que ha d'entregar una carta. Va caminant pel carrer tot mirant els números dels edificis per trobar el que coincideix amb el que duu a la carta. Si en troba un que coincideix, allà entrega la carta. Així és com funciona l'urlresolver!

A la funció *view* és on es fan les coses interessants: podem buscar informació en una base de dades. L'usuari potser demana que es canviï alguna dada? Com una carta que digui: "Si us plau, canvia la descripció de la meva feina." La *view* pot comprovar si s'està autoritzat a fer-ho i, si és el cas, actualitzar la descripció i enviar un missatge de confirmació: "Fet!" Aleshores la *view* genera una resposta i Django la pot enviar al navegador de l'usuari.

L'anterior explicació s'ha simplificat una mica ja que encara no cal que sàpigues tots els detalls tècnics. Amb que tinguis una idea general ja n'hi ha prou.

Així doncs, enlloc d'aprofundir massa en els detalls, començarem creant alguna cosa amb Django i així aprendrem com funcionen els components importants!