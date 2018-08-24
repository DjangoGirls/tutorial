# Jak funguje internet

> For readers at home: this chapter is covered in the [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) video.
> 
> This chapter is inspired by the talk "How the Internet works" by Jessica McKellar (http://web.mit.edu/jesstess/www/).

We bet you use the Internet every day. But do you actually know what happens when you type an address like https://djangogirls.org into your browser and press `enter`?

The first thing you need to understand is that a website consists of a bunch of files saved on a hard disk. Přesně jako tvé filmy, hudba nebo obrázky. Je tu ale něco, co dělá unikátními webové stránky: obsahují počítačový kód nazývaný HTML.

Pokud je ti programování zcela cizí, z počátku pro tebe může být těžké pochopit HTML, ale tvé webové prohlížeče (jako Chrome, Safari, Firefox, atd.) jej milují. Webové prohlížeče jsou navrženy tak, aby tomuto kódu rozuměly, následovaly instrukce a prezentovaly soubory, ze kterých je tvá stránka vytvořena, přesně tak jak chceš.

Jako s každým souborem, potřebujeme HTML soubory ukládat někam na hard disk. Pro internet používáme speciální, mocné počítače nazývané *servery*. Nemají obrazovku, myš ani klávesnici, protože jejich hlavním účelem je skladovat data a servírovat je. That's why they're called *servers* – because they *serve* you data.

OK, but you want to know how the Internet looks, right?

Nakreslili jsme pro tebe obrázek! Vypadá takhle:

![Figure 1.1](images/internet_1.png)

Vypadá to jako pěkný bordel, že? In fact it is a network of connected machines (the above-mentioned *servers*). Stovek tisíc strojů! Mnoho, mnoho kilometrů kabelů kolem celého světa! Můžeš navštívit stránku mapování podmořských kabelů (http://submarinecablemap.com/) abys viděla jak komplikovaná tato síť je. Tady je screenshot z té stránky:

![Figure 1.2](images/internet_3.png)

Není to fascinující? But it is not possible to have a wire between every machine connected to the Internet. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

Vypadá to takhle:

![Figure 1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

Tvůj dopis se pošle na tobě nejbližší poštu. Potom se pošle na jinou poštu, která je trochu blíže tvému adresátovi, potom na další a další, až se doručí do cílové destinace. Jediná unikátní věc je, že když pošleš hodně dopisů (*data paketů*) na stejné místo, můžou se tam dostat přes naprosto jiné pošty (*routery*). To závisí na tom, jak jsou na každé poště distribuovány.

![Figure 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Instead of paper and pen you use bytes of data, but the idea is the same!

Místo adres s názvem ulice, města a poštovním kódem používáme IP adresy. Tvůj počítač nejprve požádá DNS server (Domain Name System) o překlad djangogirls.org do IP adresy. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. Také používáš jazyk kterému adresát rozumí, že ano? Stejné platí o *data paketech* které posíláš abys viděla webovou stránku. My používáme protokol zvaný HTTP (Hypertext Transfer Protocol).

Takže když máš webovou stránku, potřebuješ *server* (stroj) na kterém může žít. Když *server* přijme přicházející *požadavek/request* (v dopise), pošle zpátky tvoji webovou stránku (v dalším dopise).

Since this is a Django tutorial, you might ask what Django does. Když odesíláš odpověď, ne vždy chceš, aby se všem odeslala stejná věc. Je mnohem lepší, když jsou tvé dopisy personalizované, obzvláště pro osobu, která ti právě napsala, že? Django ti pomáhá s vytvářením těchto personalizovaných, zajímavých dopisů. :)

Enough talk – time to create!