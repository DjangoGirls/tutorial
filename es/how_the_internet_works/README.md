# Cómo funciona internet

> Este capitulo está inspirado por la charla "How the Internet works" de Jessica McKellar (http://web.mit.edu/jesstess/www/).

Apostamos que utilizas Internet cada día. Pero, ¿sabes lo que pasa cuando escribe una dirección como http://djangogirls.org en tu navegador y presionas `enter`?

Lo primero que tienes que entender es que un sitio web es sólo un montón de archivos guardados en un disco duro. Al igual que tus películas, música o fotos. Sin embargo, los sitios web poseen una peculiaridad: ellos incluyen un código de computadoras llamado HTML.

Si no estás familiarizado con la programación, puede ser difícil de captar HTML al principio, pero tus navegadores web (como Chrome, Safari, Firefox, etc.) lo aman. Los navegadores web están diseñados para entender este código, seguir sus instrucciones y mostrar todos esos archivos de los cuales está hecho de la manera exacta como tu quieres que se muestren.

Como cualquier otro archivo, tenemos que guardar los archivos HTML en algún lugar de un disco duro. Para Internet, usamos unos especiales y poderosos computadores llamados* servidores*. Ellos no tienen una pantalla, ratón o teclado, debido a que su propósito es almacenar datos y servirlos. Por esa razón son llamados *servidores* -- porque ellos *sirven* los datos.

OK, quizás te preguntes ¿como luce Internet, cierto?

Te hemos hecho una imagen! luce algo como esto:

![Figura 1.1][1]

 [1]: images/internet_1.png

Parece un lío, ¿no? En realidad es una red de máquinas conectadas (los mencionados *servidores*). ¡Cientos de miles de máquinas! Muchas, muchos kilómetros de cables alrededor del mundo! Puedes visitar el siguiente sitio web donde muestra las conexiones de cables submarinos al rededor del mundo(http://submarinecablemap.com/) para ver lo complicado que es la red. Aquí hay una captura de pantalla de la página web:

![Figura 1.2][2]

 [2]: images/internet_3.png

Es fascinante, ¿no? Pero obviamente, no es posible tener un cable entre cada máquina conectada a Internet. Así que, para llegar a una máquina (por ejemplo la aloja a http://djangogirls.org) tenemos que pasar una solicitud a través de muchas máquinas diferentes.

Se parece a esto:

![Figura 1.3][3]

 [3]: images/internet_2.png

imagina que cuando escribes http://djangogirls.org, estas escribiendo una carta que dice: "Queridos jango Girls, me gustaría ver su sitio web djangogrils.org. Por favor, envíenmelo!"

Tu carta va hacia la oficina de correo más cercana. Luego va a otra un poco más cercana de su destinatario, luego a otra y a otra hasta que es entregada en su destino. Lo único es que si usted envía cartas (*paquetes de datos*) con frecuencia al mismo lugar, cada carta puede pasar por oficinas de correos (*routers*) totalmente diferentes, dependiendo de cómo se distribuyen en cada oficina.

![Figura 1.4][4]

 [4]: images/internet_4.png

Sí, es tan simple como eso. Enviar mensajes y esperar alguna respuesta. Por supuesto, en vez de papel y pluma usas bytes de datos, pero la idea es la misma!

En lugar de direcciones con el nombre de la calle, ciudad, código postal y nombre del país, utilizamos direcciones IP. tu computador pide primero el DNS (Domain Name System, en español "Sistema de Nombres de Dominio") para traducir djangogirls.org a una dirección IP. funciona un tanto parecido a los directorio telefónicos donde se busca el nombre de la persona que se desea contactar y este nos muestra su número de teléfono y dirección.

Cuando envías una carta, ésta necesita tener ciertas características para ser entregada correctamente: una dirección, sello etc. También utilizas un lenguaje que el receptor pueda entender, ¿cierto? Lo mismo sucede con *los paquetes de daots* que envías para ver un sitio web: utilizas un protocolo llamado HTTP (Hypertext Transfer Protocol, en español protocolo de transferencia de hipertexto).

Así que, básicamente, cuando tienes un sitio web necesitas tener un *servidor* (la máquina) donde vive. El *servidor* está esperando cualquier *solicitud entrante* (cartas que piden al servidor para que envié tu sitio web) y éste responde enviado tu sitio web (en otra carta).

Puesto que este es un tutorial de Django, seguro te preguntarás qué es lo que hace Django. Bueno, cuando envías una respuesta, no siempre quieres enviar lo mismo a todo el mundo. Es mucho mejor si tus cartas son personalizados, especialmente para la persona que acaba de escribir, ¿cierto? Django nos ayuda con la creación de estas cartas personalizadas, interesante :).

así que basta de charlas y pongamos manos a la obra!
