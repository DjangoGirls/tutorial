# Doména

Heroku ti dala doménu, avšak je dlhá a ťažko si ju zapamätať. Bolo by skvelé mať meno domény, ktoré by bolo krátke a ľahko sa pamätalo, že?

V tejto kapitole ťa naučíme, ako si zakúpiť domenú a nasmerovať ju na Heroku!

## Kde si registrovať doménu?

Typická doména stojí $15 na rok. Existujú lacnejšie aj drahšie možnosti, v závislosti od poskytovateľa. Existuje veľa spoločností, od ktorých si môžeš kúpiť doménu: jednoduché [google vyhľadávanie][1] ti dá stovky možností.

 [1]: https://www.google.com/search?q=register%20domain

Naša obľúbená je [I want my name][2]. Propagujú "bezbolestný manažment domény" a je to naozaj bezbolestné.

 [2]: https://iwantmyname.com/

## Ako registrovať doménu na IWantMyName?

Choď na [iwantmyname][3] a napíš typ domény akú chceš mať do poľa vyhľadávania.

 [3]: https://iwantmyname.com

![][4]

 [4]: images/1.png

Teraz by si mala vidieť zoznam všetkých dostupných domén, s pojmom, ktorý si zadala. Ako vidíš, usmievavá tvár naznačuje, že táto doména je dostupná a môžeš si ju zakúpiť, kým smutná tvár znamená, že už ju niekto vlastní.

![][5]

 [5]: images/2.png

Rozhodli sme sa kúpiť `djangogirls.in`:

![][6]

 [6]: images/3.png

Prejdi k pokladni. Teraz by si sa mala prihlásiť do iwantmyname, pokiaľ ešte nemáš vytvorený účet. Po tom poskytni informácie o svojej kreditnej karte a kúp si doménu!

Po tom, klikni na `Domains` v menu a vyber si novo zakúpenú doménu. Následne nájdi a klikni na odkaz `manage DNS records`:

![][7]

 [7]: images/4.png

Teraz musíš nájsť tento formulár:

![][8]

 [8]: images/5.png

A vyplniť nasledujúce údaje: - Hostname: www - Type: CNAME - Value: tvoja doména z Heroku (napríklad djangogirls.herokuapp.com) - TTL: 3600

![][9]

 [9]: images/6.png

Klikni na tlačidlo Add a Save v spodnej časti stránky.

Môže trvať niekoľko hodím, kým začne doména pracovať, takže buď trpezlivá!

## Konfiguruj doménu na Heroku

Taktiež musíš povedať Heroku, že chceš použiť svoju vlastnú doménu.

Choď do [Heroku Dashboard][10], prihlás sa na svoj Heroku účet a vyber si svoju aplikáciu. Potom choď do nastavení aplikácie a pridaj svoju doménu v sekcii `Domains` a ulož zmeny.

 [10]: https://dashboard.heroku.com/apps

To je všetko!