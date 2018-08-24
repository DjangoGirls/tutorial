# Kako internet radi

> For readers at home: this chapter is covered in the [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) video.
> 
> This chapter is inspired by the talk "How the Internet works" by Jessica McKellar (http://web.mit.edu/jesstess/www/).

We bet you use the Internet every day. But do you actually know what happens when you type an address like https://djangogirls.org into your browser and press `enter`?

The first thing you need to understand is that a website consists of a bunch of files saved on a hard disk. Baš kao i vaši filmovi, muzika ili slike. Međutim, jedna stvar je jedinstvena za veb-sajtove: svi uključuju kompjuterski kod zvan HTML.

Ako niste upoznate sa programiranjem, u početku može biti teško razumeti HTML, ali ga vaši brauzeri (poput Chrome-a, Safari-a, Firefox-a itd.) vole. Brauzeri su dizajnirani tako da razumeju ovaj kod, prate njegova uputsva i prikazuju ove fajlove od kojih se vaš veb-sajt sastoji, baš na način kako želite.

Kao i sa svakim fajlom, HTML fajlove treba čuvati negde na hard disku. Za internet se koriste posebni, jaki kompjuteri koje zovemo *serveri*. Oni nemaju ekran, miš ili tastaturu, pošto im je glavna namera čuvanje podataka koje će servirati. That's why they're called *servers* – because they *serve* you data.

OK, but you want to know how the Internet looks, right?

Nacrtali smo vam sliku! Izgleda ovako:

![Slika 1.1](images/internet_1.png)

Potpuni nered, zar ne? In fact it is a network of connected machines (the above-mentioned *servers*). Stotine hiljada mašina! Mnogo, mnogo kilometara kabla širom sveta! Možete posetiti Submarine Cable Map veb-sajt (http://submarinecablemap.com) da vidite koliko je ova mreža komplikovana. Evo jedne slike ekrana sa tog veb-sajta:

![Slika 1.2](images/internet_3.png)

Fascinantno, zar ne? But it is not possible to have a wire between every machine connected to the Internet. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

To izgleda ovako:

![Slika 1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

Vaše pismo ide do pošte najbliže vama. Zatim ide do još jedne koja je malo bliža primaocu, zatim do još jedne, i još jedne dok ne bude dostavljno na svoju destinaciju. Jedina jedinstvena stvar je da kada šaljete mnogo pisama (*pakete podataka*) na isto mesto, oni idu kroz skroz različite pošte (*rutere*). Ovo zavisi od načina na koji se isporučuju u svakoj pošti.

![Slika 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Instead of paper and pen you use bytes of data, but the idea is the same!

Umesto adrese koja se sastoji od naziva ulice, grada, poštanskog broja i naziva zemlje, koristimo IP adrese. Vaš računar prvo pita DNS (Domain Name System) da prevede djangogirls.org u IP adresu. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. Koristite i jezik koji primalac razume, zar ne? Isto važi i za *pakete podataka* koje šaljete da biste videli neki veb-sajt. Koristimo jedan protokol koji se zove HTTP (Hypertext Transfer Protocol).

Praktično, kada imate veb-sajt, potrebno je da imate *server* (mašinu) gde on živi. Kada *server* primi dolazeći *zahtev* (u pismu), šelje ga nazad veb-sajtu (u drugom pismu).

Since this is a Django tutorial, you might ask what Django does. Kada pošaljete odgovor, ne želite uvek poslati istu stvar svakome. Mnogo je bolje ako vaša pisma specijalno prilagođena svakoj osobno onoj koja vam je baš pisala, zar ne? Django vam pomaže pri kreiranju ovakvih, personalizovanih, interesantnih pisama. :)

Enough talk – time to create!