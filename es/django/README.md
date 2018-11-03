# ¿Qué es Django?

Django (*gdh/ˈdʒæŋɡoʊ/jang-goh*) es un framework de aplicaciones web gratuito y de código abierto (open source) escrito en Python. Un framework web es un conjunto de componentes que te ayudan a desarrollar sitios web más fácil y rápidamente.

Cuando construyes un sitio web, siempre necesitas un conjunto de componentes similares: una manera de manejar la autenticación de usuarios (registrarse, iniciar sesión, cerrar sesión), un panel de administración para tu sitio web, formularios, una forma de subir archivos, etc.

Por suerte para nosotros, hace tiempo que otros desarrolladores se dieron cuenta de que siempre se enfrentaban a los mismos problemas cuando construían sitios web, y por eso se unieron y crearon frameworks (Django es uno de ellos) con componentes listos para usarse.

Los frameworks sirven para que no tengamos que reinventar la rueda cada vez y que podamos avanzar más rápido al construir un nuevo sitio.

## ¿Por qué necesitas un framework?

Para entender para que sirve realmente Django, necesitamos fijarnos en cómo funcionan los servidores. Lo primero es que el servidor necesita enterarse de que tu quieres que te sirva una página web.

Imagina un buzón (puerto) en el que alguien está constantemente mirando si hay cartas entrantes (peticiones). Esto es lo que hace un servidor web. El servidor web lee la carta, y envía una respuesta con la página web. Pero para enviar algo, tenemos que tener algún contenido. Y Django nos ayuda a crear ese contenido.

## ¿Qué sucede cuando alguien solicita una página web de tu servidor?

Cuando llega una petición a un servidor web, es pasada a Django quien intenta averiguar que es realmente solicitado. Toma primero una dirección de página web e intenta averiguar qué hacer. Esta parte es realizada por el **urlresolver** de Django (ten en cuenta que la dirección de un sitio web es llamada URL - Uniform Resource Locator; así que el nombre *urlresolver* tiene sentido). Este no es muy inteligente - toma una lista de patrones y trata de hacer coincidir la URL. Django comprueba los patrones de arriba hacia abajo y si algo coincide entonces Django le pasa la solicitud a la función asociada (que se llama *view (vista)*).

Imagina a un cartero llevando una carta. Él está caminando por la calle y comprueba cada número de casa con el que está en la carta. Si coincide, deja la carta allí. Así es como funciona el urlresolver!

En la función de *view (vista)* se hacen todas las cosas interesantes: podemos mirar a una base de datos para buscar alguna información. ¿Tal vez el usuario pidió cambiar algo en los datos? Como una carta diciendo "Por favor cambia la descripción de mi trabajo." La *vista* puede comprobar si tienes permiso para hacerlo, actualizar la descripción de tu trabajo y devolver un mensaje: "¡Hecho!". Luego la *vista* genera una respuesta y Django puede enviarla al navegador del usuario.

Esta descripción es un poco simplista, pero de momento no necesitas saber todos los detalles técnicos, con tener una idea general es más que suficiente.

Así que en lugar de detenernos demasiado en los detalles, vamos a empezar a crear algo con Django y ¡así aprenderemos las cosas importantes sobre la marcha!