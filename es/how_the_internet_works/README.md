# ¿Cómo funciona Internet?

> Para los lectores en casa: este capítulo está cubierto en el video [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) (en Inglés).

> Este capitulo está inspirado por la charla "How the Internet works" de Jessica McKellar (http://web.mit.edu/jesstess/www/).

Apostamos que utilizas Internet todos los días. Pero, ¿sabes lo que pasa cuando escribes una dirección como https://djangogirls.org en tu navegador y presionas 'Enter'?

Lo primero que tienes que entender es que un sitio web es sólo un montón de archivos guardados en un disco duro. Al igual que tus películas, música o fotos. Sin embargo, los sitios web poseen una peculiaridad: incluyen un código informático llamado HTML.

Si no estás familiarizada con la programación, puede ser difícil de captar HTML a la primera, pero tus navegadores web (como Chrome, Safari, Firefox, etc.) lo aman. Los navegadores están diseñados para entender este código, seguir sus instrucciones y presentar estos archivos de los cuales está hecho tu sitio web, exactamente de la forma que quieres.

Como cualquier otro archivo, tenemos que guardar los archivos HTML en algún lugar de un disco duro. Para Internet, usamos computadoras especiales y poderosas llamadas *servidores*. Estos no tienen una pantalla, ratón o teclado, debido a que su propósito es almacenar datos y servirlos. Por esa razón son llamados *servidores* -- porque ellos *sirven* los datos.

Ok, quizás te preguntes cómo luce Internet, ¿cierto?

¡Te hemos hecho una imagen! Luce algo así:

![Figure 1.1](images/internet_1.png)

Parece un lío, ¿no? En realidad es una red de máquinas conectadas (los mencionados *servidores*). ¡Cientos de miles de máquinas! ¡Muchos, muchos kilómetros de cables alrededor del mundo! Puedes visitar el sitio web Submarine Cable Map (http://submarinecablemap.com/) y ver lo complicada que es la red. Aquí hay una captura de pantalla de la página web:

![Figure 1.2](images/internet_3.png)

Es fascinante, ¿no? Pero, obviamente, no es posible tener un cable entre cada máquina conectada a Internet. Así que, para llegar a una máquina (por ejemplo la que aloja a https://djangogirls.org) tenemos que pasar una solicitud a través de muchas máquinas diferentes.

Se parece a esto:

![Figure 1.3](images/internet_2.png)

Imagina que cuando escribes http://djangogirls.org, estas enviando una carta que dice: "Queridas Django Girls, me gustaría ver su sitio web djangogirls.org. Por favor, envíenmelo!"

Tu carta va hacia la oficina de correo más cercana. Luego va a otra que es un poco más cerca de su destinatario, luego otra y otra hasta que es entregada a su destino. La única cosa diferente es que si envías muchas cartas (*paquetes de datos*) al mismo lugar, cada una podría ir a través de oficinas de correos totalmente distintas (*routers*). Esto depende de cómo se distribuyen en cada oficina.

![Figure 1.4](images/internet_4.png)

Sí, es tan simple como eso. Enviar mensajes y esperar alguna respuesta. Por supuesto, en vez de papel y lapicera usas bytes de datos, ¡pero la idea es la misma!

En lugar de direcciones con el nombre de la calle, ciudad, código postal y nombre del país, utilizamos direcciones IP. Tu computadora pide primero el DNS (Domain Name System - en español, Sistema de Nombres de Dominio) para traducir djangogirls.org a una dirección IP. Funciona como los viejos directorios telefónicos donde puedes buscar el nombre de la persona que se deseas contactar y este nos muestra su número de teléfono y dirección.

Cuando envías una carta, ésta necesita tener ciertas características para ser entregada correctamente: una dirección, sello, etc. También utilizas un lenguaje que el receptor pueda entender, ¿cierto? Lo mismo sucede con los *paquetes de datos* que envías para ver un sitio web: utilizas un protocolo llamado HTTP (Hypertext Transfer Protocol - en español, Protocolo de Transferencia de Hipertexto).

Así que, básicamente, cuando tienes un sitio web necesitas tener un *servidor* (la máquina) donde vive. Cuando el *servidor* recibe una *petición* entrante (en una carta), este envía su sitio de Internet (en otra carta).

Puesto que este es un tutorial de Django, seguro te preguntarás qué es lo que hace Django. Bueno, cuando envías una respuesta, no siempre quieres enviar lo mismo a todo el mundo. Es mucho mejor si tus cartas son personalizadas, especialmente para la persona que acaba de escribir, ¿cierto? Django nos ayuda con la creación de estas cartas personalizadas :).

Basta de charlas, ¡pongamos manos a la obra!
