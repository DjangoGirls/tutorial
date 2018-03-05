# Što je Django?

Django (*Džan-go*) je web aplikacija koja je besplatna i otvorenog je koda. Web framework je skup komponenti koje ti pomažu razvijati web stranice brže i lakše.

Kada stvaraš web stranicu, uvijek ćeš trebati slične komponente: autentikacija korisnika (prijava, odjava), način upravljanja svoje stranice, formulari, uploadanje datoteka itd.

Srećom, davno su drugi ljudi primjetili da se većina web programera susreće sa sličnim problemima kad stvaraju novu stranicu, pa su se udružili i stvorili razne frameworke (tipa Django) koji ti daju gotove komponente na korištenje.

Frameworksi postoje da bi te spasili od potrebe izmišljanja "tople vode" i da ti smanje potrebu pisanja previše koda kada radiš novu stranicu.

## Zašto ti treba framework?

Za razumijevanje za što zapravo služi Django, moramo pobliže pogledati poslužitelje. Prva stvar koju poslužitelji trebaju znati je da ti želiš da ti oni posluže web stranicu.

Zamisli npr. poštanski sandučić (port) kojeg nadzireš za nadolazeća pisma (zahtjeve). To radi web poslužitelj. Web poslužitelj pročita pismo i pošalje odgovor sa web stranicom. Ali, ako želiš poslati nešto, moraš imati sadržaj. Upravo je Django tu da ti pomogne stvoriti sadržaj.

## What happens when someone requests a website from your server?

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Imagine a mail carrier with a letter. She is walking down the street and checks each house number against the one on the letter. If it matches, she puts the letter there. This is how the urlresolver works!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Maybe the user asked to change something in the data? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

Of course, the description above is a little bit simplified, but you don't need to know all the technical things yet. Having a general idea is enough.

So instead of diving too much into details, we will simply start creating something with Django and we will learn all the important parts along the way!