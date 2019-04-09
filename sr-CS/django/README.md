# Šta je Django?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) je besplatna aplikacija i biblioteka otvorenog koda, napisana u Python-u. Veb biblioteka je skup napisanih komponenata koje pomažu da brže i lakše razvijete sajtove.

Kada pravite veb sajt, uvek Vam je potreban sličan skup komponenata: način na koji ćete da se izborite sa potvrđivanjem autentičnosti korisnika (npr. logovanje ili pravljanje naloga), kontrolni panel za veb sajt, forme, načini učitavanja fajlova itd.

Srećom, ljudi su davno primetili da se veb developeri suočavaju sa sličnim problemima tokom pravljenja nekog sajta, tako da su se udružili i stvorili biblioteke (Django je jedna od njih) koje Vam obezbeđuju gotove komponente koje mogu da se koriste.

Biblioteke postoje kako bi Vas poštedele izmišljanja stvari koje već postoje i da bi Vam ublažile indirektne troškove tokom pravljenja novog sajta.

## Zašto Vam je potrebna biblioteka?

Kako biste razumeli za šta Django služi, moramo da malo bolje pogledamo servere i njihov način rada. Prva stvar koju server treba da zna je to da želite da podrži vašu veb stranicu.

Imagine a mailbox (port) which is monitored for incoming letters (requests). This is done by a web server. The web server reads the letter and then sends a response with a webpage. But when you want to send something, you need to have some content. And Django is something that helps you create the content.

## What happens when someone requests a website from your server?

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Imagine a mail carrier with a letter. She is walking down the street and checks each house number against the one on the letter. If it matches, she puts the letter there. This is how the urlresolver works!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Maybe the user asked to change something in the data? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

The description above is a little bit simplified, but you don't need to know all the technical things yet. Having a general idea is enough.

So instead of diving too much into details, we will start creating something with Django and we will learn all the important parts along the way!