# Mi a Django?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) is a free and open source web application framework, written in Python. A webes keretrendszerek különböző építőelemek gyűjteményei, segítségükkel könnyebben és gyorsabban tudunk weboldalakat fejleszteni.

Amikor weboldalt készítesz, mindig hasonló elemekre lesz szükséged: meg kell oldanod a felhasználók azonosítását (regisztráció, be- és kijelentkezés), kell egy felület a honlap kezeléséhez, formok (kérdőívek), kell valami megoldás a fájlok feltöltésére, stb.

Luckily for you, other people long ago noticed that web developers face similar problems when building a new site, so they teamed up and created frameworks (Django being one of them) that give you ready-made components to use.

Frameworks exist to save you from having to reinvent the wheel and to help alleviate some of the overhead when you’re building a new site.

## Miért van szükséged keretrendszerre?

To understand what Django is actually for, we need to take a closer look at the servers. The first thing is that the server needs to know that you want it to serve you a web page.

Képzelj el egy postaládát (port), amit folyamatosan figyelnek, hogy vannak-e beérkezett levelek (requestek). Ezt csinálja egy webszerver. The web server reads the letter and then sends a response with a webpage. Azonban amikor küldeni szeretnél valamit, szükséged van tartalomra. A Django ennek a tartalomnak a megalkotásában segít.

## Mi történik, amikor valaki lekérdez egy honlapot a szerveredtől?

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Képzelj el egy postást egy levéllel. Ahogy halad az utcán, minden házszámot megnéz, és összehasonlítja a levélen lévővel. Ha megegyezik, bedobja a levelet a postaládába. Így működik az urlresolver!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Talán a felhasználó meg szeretne változtatni valamilyen adatot? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

The description above is a little bit simplified, but you don't need to know all the technical things yet. Having a general idea is enough.

So instead of diving too much into details, we will start creating something with Django and we will learn all the important parts along the way!