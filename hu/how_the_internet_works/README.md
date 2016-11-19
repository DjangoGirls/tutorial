# Hogy működik az Internet?

> Ez a fejezet Jessica McKellar "Hogy működik az Internet" (How the Internet works) című előadásán alapul (http://web.mit.edu/jesstess/www/).

Biztosan minden nap internetezel. Tudod, igazából mi történik, mikor beírod a böngésződben, hogy https://djangogirls.org, és `enter`t nyomsz?

Az első dolog, amit fontos megérteni, hogy egy weboldal nem más, mint egy csomó fájl egy merevlemezre mentve. Olyanok, mint a filmjeid, a zenéid, vagy a képeid. De van valami, ami a weboldalakat egyedivé teszi: a HTML nevű számítógépes kód.

Ha nem igazán ismered a programozást, akkor nehéz lehet megértened először a HTML-t, de ne aggódj a böngésződ (Chrome, Safari, Firefox, stb.) imádja. A webböngészőket úgy tervezték, hogy megértsék ezt a kódot, kövessék azt, ami abban van, és megjelenítsenek mindent pont úgy, ahogy szeretnéd.

Mint minden fájlt, a HTML-t is merevlemezen kell tárolni. Az Internethez speciális, erős számítógépeket használunk, a *szervereket*. Ezekhez a gépekhez nem tartozik képernyő, egér vagy billentyűzet, mert a fő feladatuk az adatok tárolása és szolgáltatása. Ezért hívjuk őket *szervernek*, vagyis kiszolgálónak -- ők *szolgálják ki* neked az adatokat.

Rendben, de hogy néz ki az Internet?

Rajzoltunk neked egy képet! Így néz ki:

![1.1 ábra][1]

 [1]: images/internet_1.png

Elég zavaros, igaz? Valójában ez egymáshoz kapcsolódó gépek (az előbb emlegetett *szerverek*) hálózata. Több százezer gép! Rengeteg kilométernyi kábel körös-körül a világon! Nézd meg Submarine Cable Map weboldalt (http://submarinecablemap.com), és látni fogod milyen bonyolult a net. Itt egy kép az oldalról:

![1.2 ábra][2]

 [2]: images/internet_3.png

Lenyűgöző, igaz? Persze az képtelenség, hogy minden gép össze legyen kötve egymással, ami az Internethez csatlakozik. Ezért hogy elérhessünk egy gépet (például azt, ahol a https://djangogirls.org van elmentve), a kérésünket egy csomó különböző gépen át kell juttatni.

Így néz ki:

![1.3 ábra][3]

 [3]: images/internet_2.png

Képzeld el úgy, hogy amikor beírod a https://djangogirls.org címet, egy levelet írsz: "Kedves Django Girls, szeretném megnézni a djangogirls.org oldalt. Kérlek, küldd el nekem!"

Először a leveled a hozzád legközelebbi postára megy. Ezután továbbhalad egy olyan postára, ami már kicsit közelebb van a címzettedhez, és így tovább, míg el nem jut a céljához. Az egyetlen egyedi dolog, hogy ha több levelet (*adatcsomagot*) küldesz ugyanarra a helyre, azok valószínűleg teljesen már postákon (*routers*) mennek keresztül. Ez csak attól függ hogyan osztják el az egyes irodákban.

![1.4 ábra][4]

 [4]: images/internet_4.png

Ennyire egyszerű! Elküldöd a levelet, és várod a választ. Persze papír és toll helyett adatok byte-jait küldöd, de az ötlet ugyanaz!

Utcanév, házszám, város és irányítószám helyett IP-címeket használunk. A számítógéped először megkéri a DNS-t (Domain Name System, tartománynévrendszer), hogy fordítsa le a djangogirls.org-ot egy IP címre. Körülbelül úgy működik, mint amikor a régi telefonkönyvekből kikerested valakinek a telefonszámát, és a címét.

Amikor levelet küldesz, bizonyos dolgokra szükség van, hogy jó helyre szállítsák őket: kell lennie rajta címnek, bélyegnek, stb. Ráadásul olyan nyelven kell írnod, amit a címzett megért. Ugyanez vonatkozik az *adatcsomagokra*, amiket azért küldesz, mert meg szeretnél nézni egy weboldalt. A HTTP (Hypertext Transfer Protocol) protokollt használjuk erre.

Szóval, amikor van egy weboldalad, akkor szükséged van egy *szerverre* (gép), ahol az oldal lakik. Amikor a *szerver* kap egy beérkező *kérést* (egy levélben), akkor egy válaszban visszaküldi a weboldaladat (egy másik levélben).

Mivel ez egy Django útmutató, felmerülhet benned a kérdés, hogy a Django ebben a folyamatban milyen szerepet tölt be. Amikor küldesz egy választ, nem mindig pont ugyanazt küldöd mindenkinek. Sokkal jobb, ha a levelek személyesek, főleg, ha annak az embernek szólnak, akinek válaszolsz, nem igaz? A Django segít, hogy személyes és érdekes leveleket írhass :).

De elég a beszédből, munkára fel!