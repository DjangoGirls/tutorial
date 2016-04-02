# Doména

Heroku ti přidělil doménu, ale je dlouhá, těžce zapamatovatelná a ošklivá. Bylo by super mít krátký a snadno zapamatovatelný název domény, ne?

V této kapitole tě naučíme, jak si koupit doménu a nasměrovat ji na Heroku!

## Kde si zaregistrovat doménu?

Typická doména stojí kolem 15 dolarů ročně. Existují levnější a dražší varianty, podle poskytovatele. Existuje mnoho společností, které nabízejí koupi domény: jednoduše pomocí [vyhledávání google][1] nalezneš stovky možností.

 [1]: https://www.google.com/search?q=register%20domain

Naše oblíbené je, [I want my name][2]. Inzerují se jako "bezbolestný doménový management" a je to opravdu bezbolestné.

 [2]: https://iwantmyname.com/

## Jak si zaregistrovat doménu na IWantMyName?

Přejdi na [iwantmyname][3] a zadejte doménu, kterou chceš do pole Search/Hledat.

 [3]: http://iwantmyname.com

![][4]

 [4]: images/1.png

Nyní bys měla vidět seznam všech dostupných domén s termínem, který jsi vložila do pole Hledat. Jak vidíš, veselý obličej znamená, že doména je k dispozici pro tvůj nákupu a smutná tvář znamená že je již obsazená.

![][5]

 [5]: images/2.png

Rozhodli jsme se koupit `djangogirls.in`:

![][6]

 [6]: images/3.png

Přejdi k pokladně/checkout. Nyní by ses měla přihlásit do iwantmyname, pokud ještě nemáš účet. Poté poskytneš informace o kreditní kartě a koupíš doménu!

Pak klepni na tlačítko `domény` v menu a vyber nově zakoupenou doménu. Vyber ji a klepni na odkaz `Spravovat záznamy DNS/manage DNS record`:

![][7]

 [7]: images/4.png

Nyní je třeba najít tento formulář:

![][8]

 [8]: images/5.png

A vyplňit jej s následujícími podrobnosti:-Hostname: www - typ: CNAME - hodnotu: vaši doménu z Heroku (například djangogirls.herokuapp.com) - TTL: 3600

![][9]

 [9]: images/6.png

Klepni na tlačítko Přidat a změny se uloží - uvidíš je v dolní části.

Změny se mohou projevit až za několik hodin, něž začne fungovat tvá doména, tak buď trpělivá!

## Konfigurace domény v Heroku

Musíš také říci Heroku, kterou doménu cheš použít jako vlastní.

Přejdi na [Heroku Dashboard][10], přihláš se k účtu Heroku a vyber si aplikaci. Poté přejdi do aplikace nastavení a přidej doménu v sekci `domény` a ulož provedené změny.

 [10]: https://dashboard.heroku.com/apps

A je to!
