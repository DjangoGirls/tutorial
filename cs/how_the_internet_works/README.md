# Jak funguje internet

> Tato kapitola je inspirována přednáškou "How the Internet works", kterou přednesla Jessica McKellar (http://web.mit.edu/jesstess/www/).

Internet jistě používáš každý den. Ale víš ve skutečnosti co se stane, když do prohlížeče napíšeš adresu jako https://djangogirls.org a zmáčkneš `enter`?

První věc, které musíš rozumět, je, že webová stránka je jen pár souborů uložených na hard disku. Přesně jako tvé filmy, hudba nebo obrázky. Je tu ale něco, co dělá webové stránky unikátními: obsahují počítačový kód nazývaný HTML.

Pokud je ti programování zcela cizí, z počátku pro tebe může být těžké HTML pochopit, ale tvé webové prohlížeče (jako Chrome, Safari, Firefox atd.) jej milují. Webové prohlížeče jsou navrženy tak, aby tomuto kódu rozuměly, plnily instrukce a zobrazovaly soubory, ze kterých je tvá stránka vytvořena, přesně tak, jak chceš.

Jako každý soubor potřebujeme HTML soubory ukládat někam na hard disk. Pro internet používáme speciální, mocné počítače nazývané *servery*. Nemají obrazovku, myš ani klávesnici, protože jejich hlavním účelem je skladovat data a servírovat je. Proto je nazýváme *servery* -- protože ti *servírují* data.

OK, ale chceš vědět jak internet vypadá, že ano?

Nakreslili jsme pro tebe obrázek! Vypadá takhle:

![Figure 1.1][1]

 [1]: images/internet_1.png

Vypadá to jako pěkný bordel, že? Ve skutečnosti je to síť propojených strojů (výše zmíněných *serverů*). Stovek tisíc strojů! Mnoho, mnoho kilometrů kabelů kolem celého světa! Můžeš navštívit stránku mapování podmořských kabelů (http://submarinecablemap.com/), abys viděla, jak komplikovaná tato síť je. Tady je screenshot z té stránky:

![Figure 1.2][2]

 [2]: images/internet_3.png

Není to fascinující? Samozřejmě není možné mít dráty mezi každými dvěma stroji připojenými k internetu. Proto abychom získaly přístup ke konkrétnímu počítači (třeba k tomu, na kterém je uložena stránka https://djangogirls.org), musí být požadavek postupně předáván mezi mnoha různými stroji.

Vypadá to takhle:

![Figure 1.3][3]

 [3]: images/internet_2.png

Představ si, že když napíšeš https://djangogirls.org, pošleš dopis, ve kterém stojí "Drahé Django Girls, chci si prohlédnout stránku djangogirls.org. Pošlete mi ji, prosím!"

Tvůj dopis se pošle na tvou nejbližší poštu. Potom se pošle na jinou poštu, která je trochu blíže tvému adresátovi, potom na další a další, až se doručí do cílové destinace. Jediná unikátní věc je, že když pošleš hodně dopisů (*data paketů*) na stejné místo, můžou se tam dostat přes naprosto jiné pošty (*routery*). To závisí na tom, jak jsou na každé poště distribuovány.

![Figure 1.4][4]

 [4]: images/internet_4.png

Ano, je to takhle jednoduché. Odešleš zprávu a očekáváš nějakou odpověď. Samozřejmě, místo papíru a pera používáš byty dat, ale princip je stejný!

Místo adres s názvem ulice, města a poštovním kódem používáme IP adresy. Tvůj počítač nejprve požádá DNS server (Domain Name System) o překlad djangogirls.org do IP adresy. Funguje to trochu jako staromódní telefonní seznam, kde sis mohla vyhledat jméno člověka, na kterého potřebuješ kontakt, a najít jeho telefonní číslo a adresu.

Když posíláš dopis, musí mít určité náležitosti, aby mohl být správně doručen: adresu, známku atp. Také používáš jazyk, kterému adresát rozumí, že? Stejné platí o *data paketech*, které posíláš, abys viděla webovou stránku. My používáme protokol zvaný HTTP (Hypertext Transfer Protocol).

Takže když máš webovou stránku, potřebuješ *server* (stroj), na kterém může žít. Když *server* přijme přicházející *požadavek/request* (v dopise), pošle zpátky tvoji webovou stránku (v dalším dopise).

Jelikož je toto Django tutoriál, budeš se ptát, co Django dělá. Když odesíláš odpověď, ne vždy chceš, aby se všem odeslala stejná věc. Je mnohem lepší, když jsou tvé dopisy personalizované, obzvláště pro osobu, která ti právě napsala, že? Django ti pomáhá s vytvářením těchto personalizovaných, zajímavých dopisů :).

Dost řečí, je čas tvořit!
