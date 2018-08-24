# Hogy működik az Internet?

> For readers at home: this chapter is covered in the [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) video.
> 
> This chapter is inspired by the talk "How the Internet works" by Jessica McKellar (http://web.mit.edu/jesstess/www/).

Biztosan minden nap internetezel. De tudod, igazából mi történik, mikor beírod a böngésződbe, hogy https://djangogirls.org, és `enter`t nyomsz?

The first thing you need to understand is that a website consists of a bunch of files saved on a hard disk. Olyanok, mint a filmjeid, a zenéid, vagy a képeid. De van valami, ami a weboldalakat egyedivé teszi: a HTML nevű számítógépes kód.

Ha nem igazán ismered a programozást, akkor nehéz lehet megértened először a HTML-t, de ne aggódj a böngésződ (Chrome, Safari, Firefox, stb.) imádja. A webböngészőket úgy tervezték, hogy megértsék ezt a kódot, kövessék azt, ami abban van, és megjelenítsenek mindent pont úgy, ahogy szeretnéd.

Mint minden fájlt, a HTML-t is merevlemezen kell tárolni. Az Internethez speciális, erős számítógépeket használunk, a *szervereket*. Ezekhez a gépekhez nem tartozik képernyő, egér vagy billentyűzet, mert a fő feladatuk az adatok tárolása és szolgáltatása. That's why they're called *servers* – because they *serve* you data.

OK, but you want to know how the Internet looks, right?

Rajzoltunk neked egy képet! Így néz ki:

![1.1 ábra](images/internet_1.png)

Elég zavaros, igaz? In fact it is a network of connected machines (the above-mentioned *servers*). Több százezer gép! Rengeteg kilométernyi kábel körös-körül a világon! Nézd meg Submarine Cable Map weboldalt (http://submarinecablemap.com), és látni fogod milyen bonyolult a net. Itt egy kép az oldalról:

![1.2 ábra](images/internet_3.png)

Lenyűgöző, igaz? But it is not possible to have a wire between every machine connected to the Internet. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

Így néz ki:

![1.3 ábra](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

Először a leveled a hozzád legközelebbi postára megy. Ezután továbbhalad egy olyan postára, ami már kicsit közelebb van a címzettedhez, és így tovább, míg el nem jut a céljához. Az egyetlen egyedi dolog, hogy ha több levelet (*adatcsomagot*) küldesz ugyanarra a helyre, azok valószínűleg teljesen már postákon (*routers*) mennek keresztül. Ez csak attól függ hogyan osztják el az egyes irodákban.

![1.4 ábra](images/internet_4.png)

That's how it works - you send messages and you expect some response. Instead of paper and pen you use bytes of data, but the idea is the same!

Utcanév, házszám, város és irányítószám helyett IP-címeket használunk. A számítógéped először megkéri a DNS-t (Domain Name System, tartománynévrendszer), hogy fordítsa le a djangogirls.org-ot egy IP címre. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. Ráadásul olyan nyelven kell írnod, amit a címzett megért. Ugyanez vonatkozik az *adatcsomagokra*, amiket azért küldesz, mert meg szeretnél nézni egy weboldalt. A HTTP (Hypertext Transfer Protocol) protokollt használjuk erre.

Szóval, amikor van egy weboldalad, akkor szükséged van egy *szerverre* (gép), ahol az oldal lakik. Amikor a *szerver* kap egy beérkező *kérést* (egy levélben), akkor egy válaszban visszaküldi a weboldaladat (egy másik levélben).

Since this is a Django tutorial, you might ask what Django does. Amikor küldesz egy választ, nem mindig pont ugyanazt küldöd mindenkinek. Sokkal jobb, ha a levelek személyesek, főleg, ha annak az embernek szólnak, akinek válaszolsz, nem igaz? A Django segít, hogy személyes és érdekes leveleket írhass. :)

Enough talk – time to create!