# Qu'est-ce que Django?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) is a free and open source web application framework, written in Python. Un framework web est un ensemble de composants qui vous aide à développer des sites web plus rapidement et plus facilement.

Lorsque vous créez un site web, vous avez souvent besoin de la même chose : une manière de gérer l'authentification de vos utilisateurs (créer un compte, se connecter, se déconnecter), une partie dédiée à la gestion de votre site, des formulaires, une manière de mettre en ligne des fichiers, etc.

Luckily for you, other people long ago noticed that web developers face similar problems when building a new site, so they teamed up and created frameworks (Django being one of them) that give you ready-made components to use.

Frameworks exist to save you from having to reinvent the wheel and to help alleviate some of the overhead when you’re building a new site.

## Pourquoi est-ce que vous auriez besoin d'un framework ?

To understand what Django is actually for, we need to take a closer look at the servers. The first thing is that the server needs to know that you want it to serve you a web page.

Imaginez une boîte aux lettres (un port) dont l'arrivée de lettres (une requête) serait surveillée. C'est le travail qu'effectue le serveur. The web server reads the letter and then sends a response with a webpage. Généralement, lorsque vous voulez envoyer quelque chose, vous avez besoin de contenu. Django est quelque chose qui va vous aider à créer ce contenu.

## Que se passe-t-il quand quelqu'un demande un site web à votre serveur ?

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Afin d'y voir un peu plus clair, imaginez une postière transportant une lettre. Elle descend la rue et vérifie à chaque maison si le numéro de celle-ci correspond à celui de la lettre. Si jamais les deux numéros correspondent, elle met la lettre dans la boîte aux lettres de cette maison. C'est à peu près comme cela que fonctionne l'urlresolver !

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Par exemple, peut-être que l'utilisateur vient de demander de changer quelque chose dans ces données ? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

Bien sûr, ceci n'est qu'une description très simplifiée du processus. Vous n'avez pas besoin de connaitre tous les détails techniques pour le moment : cette vue d'ensemble suffira largement.

Maintenant, nous aurions la possibilité de vous assommer avec des détails complexes sur comment tout cela fonctionne. À la place, nous allons plutôt commencer à construire quelque chose ! Nous vous donnerons toutes les informations importantes au fur et à mesure que vous progresserez. Ce sera plus sympa, non ?