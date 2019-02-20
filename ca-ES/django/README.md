# Què és Django?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) és un entorn de treball per aplicacions web (framework web) de codi lliure i gratuït escrit en Python. Un framework web consta d'un seguit de components que t'ajuden a desenvolupar llocs web d'una forma més ràpida i fàcil.

En la construcció d'un lloc web necessitem sempre un conjunt de components semblant: una forma de gestionar l'autenticació d'usuaris (registre, inici i tancament de sessió), un panell de control, formularis, un sistema per carregar fitxers, etc.

Afortunadament per a tu, algú es va adonar fa molt de temps que les desenvolupadores web s'enfronten un i altre cop als mateixos problemes quan construeixen un lloc web. Així doncs, es van unir i crearen els frameworks (com ara Django), que et proporcionen components llestos per ser emprats.

Els frameworks existeixen per estalviar-te haver de reinventar la roda i ajudar-te a a alleugerir la sobrecàrrega que això suposa quan estàs construint un nou lloc web.

## Per què necessites un framework?

Per entendre la finalitat de Django necessitem entendre una mica els servidors. La primera cosa que un servidor necessita saber és que vols que et proporcioni una pàgina web.

Imagina una bústia de correu (port) que s'observa per saber quan arriben cartes (peticions). Això ho fa un servidor web. El servidor web llegeix la carta i envia una resposta amb una pàgina web. Quan vols enviar alguna cosa, però, necessites un contingut. Contingut que Django t'ajuda a crear.

## Què és el que passa quan algú demana per un lloc web al teu servidor?

Quan una petició arriba al servidor web, s'envia a Django, que tracta d'entendre que és el que se li està demanant. Primer agafa l'adreça de la pàgina web i intenta esbrinar què n'ha de fer. D'això s'encarrega un component de Django anomenat **urlresolver** (fixa't que l'adreça d'un lloc web es diu URL (localitzador uniforme de recursos – Uniform Resource Locator –. Per tant, el mot *urlresolver* té el seu sentit). Aquest component no és gaire llest: disposa d'un llistat de patrons i mira d'esbrinar amb quin d'ells coincideix la URL en qüestió. Django revisa els patrons d'adalt a baix i si en troba un de coincident, aleshores envia la petició a la funció associada (que anomenem *view* – vista –).

Imagina una cartera que ha d'entregar una carta. Va caminant pel carrer tot mirant els números dels edificis per trobar el que coincideix amb el que hi ha escrit a la carta. Si en troba un que coincideix, allà entrega la carta. Així és com funciona l'urlresolver!

A la funció *view* és on es fan les coses interessants: podem buscar informació en una base de dades. L'usuari potser demana canviar alguna dada? Com una carta que digui: "Si us plau, canvia la descripció de la meva feina." La *view* pot comprovar si estàs autoritzada a fer-ho i, si és el cas, actualitzar la descripció per tu i enviar-te un missatge: "Fet!" Aleshores la *view* genera una resposta i Django la pot enviar al navegador de l'usuari.

L'anterior explicació s'ha simplificat una mica ja que encara no necessites saber tots els detalls tècnics. Amb que tinguis una idea general n'hi ha prou.

Així doncs, enlloc d'aprofundir massa en els detalls, començarem creant alguna cosa amb Django i alhora aprendrem com funcionen els components importants!