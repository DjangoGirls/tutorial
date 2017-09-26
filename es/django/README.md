# ¿Qué es Django?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) is a free and open source web application framework, written in Python. Un framework web es un conjunto de componentes que te ayudan a desarrollar sitios web más fácil y rápidamente.

Cuando construyes un sitio web, siempre necesitas un conjunto de componentes similares: una manera de manejar la autenticación de usuarios (registrarse, iniciar sesión, cerrar sesión), un panel de administración para tu sitio web, formularios, una forma de subir archivos, etc.

Luckily for you, other people long ago noticed that web developers face similar problems when building a new site, so they teamed up and created frameworks (Django being one of them) that give you ready-made components to use.

Frameworks exist to save you from having to reinvent the wheel and to help alleviate some of the overhead when you’re building a new site.

## ¿Por qué necesitas un framework?

To understand what Django is actually for, we need to take a closer look at the servers. The first thing is that the server needs to know that you want it to serve you a web page.

Imagina un buzón (puerto) el cual es monitoreado por cartas entrantes (peticiones). Esto es realizado por un servidor web. The web server reads the letter and then sends a response with a webpage. Pero cuando quieres enviar algo, tienes que tener algún contenido. Y Django es quien que te ayuda a crear el contenido.

## ¿Qué sucede cuando alguien solicita una página web de tu servidor?

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Imagina a una cartera llevando una carta. Ella está caminando por la calle y comprueba cada número de casa con el que está en la carta. Si coincide, ella deja la carta allí. Así es como funciona el urlresolver!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. ¿Tal vez el usuario pidió cambiar algo en los datos? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

Por supuesto, la descripción anterior está un poco simplificada, pero no necesitas saber todas las cosas técnicas aún. Tener una idea general es suficiente.

Así que en lugar de entrar demasiado en los detalles, simplemente comenzaremos creando algo con Django y aprenderemos todas las partes importantes en el camino!