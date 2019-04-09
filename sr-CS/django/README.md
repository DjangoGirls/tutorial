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

Zamislite poštara sa pismom. She is walking down the street and checks each house number against the one on the letter. If it matches, she puts the letter there. This is how the urlresolver works!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Maybe the user asked to change something in the data? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

The description above is a little bit simplified, but you don't need to know all the technical things yet. Having a general idea is enough.

So instead of diving too much into details, we will start creating something with Django and we will learn all the important parts along the way!