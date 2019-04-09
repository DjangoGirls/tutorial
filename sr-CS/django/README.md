# Šta je Django?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) je besplatna aplikacija i biblioteka otvorenog koda, napisana u Python-u. Veb biblioteka je skup napisanih komponenata koje pomažu da brže i lakše razvijete sajtove.

Kada pravite veb sajt, uvek Vam je potreban sličan skup komponenata: način na koji ćete da se izborite sa potvrđivanjem autentičnosti korisnika (npr. logovanje ili pravljanje naloga), kontrolni panel za veb sajt, forme, načini učitavanja fajlova itd.

Srećom, ljudi su davno primetili da se veb developeri suočavaju sa sličnim problemima tokom pravljenja nekog sajta, tako da su se udružili i stvorili biblioteke (Django je jedna od njih) koje Vam obezbeđuju gotove komponente koje mogu da se koriste.

Biblioteke postoje kako bi Vas poštedele izmišljanja stvari koje već postoje i da bi Vam ublažile indirektne troškove tokom pravljenja novog sajta.

## Zašto Vam je potrebna biblioteka?

Kako biste razumeli za šta Django služi, moramo da malo bolje pogledamo servere i njihov način rada. Prva stvar koju server treba da zna je to da želite da podrži vašu veb stranicu.

Zamislite poštansko sanduče (u ovom slučaju port) koje se nadgleda zbog nadolazećih pisama (u ovom slučaju su to zahtevi). To se obavlja pomoću veb servera. Veb server će da pročita pristiglo pismo i zatim da pošalje odgovor pomoću veb stranice. Međutim, kada nešto želite da pošaljete, morate da imate nekakav sadržaj te pošiljke. Django je upravo nešto što Vam pomaže da kreirate taj sadržaj.

## Šta se desi kada neko uputi zahtev veb sajtu sa Vašeg servera?

Kada zahtev dođe do veb servera, prosleđuje se Django-u koji pokušava da otkrije šta je zapravo sadržaj tog zahteva. Prvo uzima adresu veb stranice i pokušava da shvati šta s tim da radi. Ovaj deo se obavlja pomoću Django **urlresolver-a** (primetite da se veb adresa zapravo zove URL (eng. Uniform Resource Locator), tako da je ime *urlresolver* prilično smisleno). To nije preterano komplikovano - uzima se lista šablona i pokušava se da se pronađe odgovarajući URL. Django pregleda šablone od vrha ka dnu i ukoliko pronađe poklapanje, tada se prosleđuje zahtev nekoj dodeljenoj funkciji (koja se naziva *view* (prikaz)).

Zamislite poštara sa pismom. On prolazi kroz ulicu i proverava svaki broj kuće u odnosu na onaj na pismu. Ukoliko nađe poklapanje, tu dostavi pismo. To je način na koji radi urlresolver!

U *view* funkciji se dešavaju sve zanimljive stvari: možemo da pogledamo u bazu podataka kako bismo potražili neku informaciju. Možda korisnik želi da promeni neke podatke? Isto kao što bi u tom metaforičkom pismu bilo napisano "Molim Vas, promenite opis mog posla". *View* funkcija može da proveri da li ste ovlašćeni da to uradite, a zatim da promeni opis posla za Vas i da Vam pošalje poruku - "Urađeno!" Tada *view* generiše odgovor, a Django može da ga pošalje do korisnikovog pretraživača.

Prethodni opis je malo pojednostavljen, ali Vam još uvek nije potrebno da znate sve tehničke stvari. Trenutno je opšta slika dovoljna.

Umesto da ulazimo previše u detalje, počećemo da pravimo nešto uz pomoć Django-a i naučićemo usput važne lekcije!