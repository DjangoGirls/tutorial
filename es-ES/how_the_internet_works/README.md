# ¿Cómo funciona Internet?

> Para lectores en casa: este capítulo está cubierto en el video [¿Cómo funciona Internet?](https://www.youtube.com/watch?v=oM9yAA09wdc).
> 
> Este capitulo está inspirado en la charla "How the Internet works" de Jessica McKellar (http://web.mit.edu/jesstess/www/).

Apostamos a que utilizas Internet todos los días. Pero, ¿sabes lo que pasa cuando escribes una dirección como http://djangogirls.org en tu navegador y presionas `enter`?

La primera cosa que necesitas entender, es que una página web consiste de un puñado de archivos guardados en el disco duro -- como tus películas, música, o imágenes. Sin embargo, hay una parte que es única para los sitios web: ellos incluyen código computarizado llamado HTML.

Si tu no estás familiarizado con la programación, puede ser difícil de comprender HTML a la primera, pero tus navegadores web (como Chrome, Safari, Firefox, etc.) lo aman. Los navegadores están diseñados para entender este código, seguir sus instrucciones y presentar estos archivos de los cuales está hecho tu sitio web, exactamente de la forma que quieres.

Como cualquier otro archivo, tenemos que guardar los archivos HTML en algún lugar de un disco duro. Para Internet, utilizamos equipos especiales, de gran alcance llamados *servidores*. Estos no tienen una pantalla, ratón o teclado, debido a que su propósito es almacenar datos y servirlos. Por esa razón son llamados *servidores* -- porque *sirven* los datos.

OK, pero quieres saber cómo Internet se ve, ¿cierto?

¡Te hemos hecho una imagen! Luce algo así:

![Figura 1.1](images/internet_1.png)

Parece un lío, ¿no? De hecho, es una red de máquinas interconectadas (los *servidores* que nombramos anteriormente). ¡Cientos de miles de máquinas! ¡Muchos, muchos kilómetros de cables alrededor del mundo! Puedes visitar el sitio web Submarine Cable Map (http://submarinecablemap.com/) y ver lo complicada que es la red. Aquí hay una captura de pantalla de la página web:

![Figura 1.2](images/internet_3.png)

Es fascinante, ¿no? Pero sería imposible tener un cable entre todas y cada una de las máquinas conectadas a internet. Así que, para llegar a una máquina (por ejemplo la que aloja http://djangogirls.org) tenemos que elevar una solicitud mediante una gran cantidad de máquinas diferentes.

Se parece a esto:

![Figura 1.3](images/internet_2.png)

Imagina que cuando escribes http://djangogirls.org, estas enviando una carta que dice: "Estimadas Django Girls, me gustaría ver su sitio web djangogirls.org. Por favor, envíenmelo!"

Tu carta va hacia la oficina de correo más cercana. Luego va a otra que es un poco más cerca de su destinatario, luego otra y otra hasta que es entregada a su destino. La única cosa diferente es que si envías muchas cartas (*paquetes de datos*) al mismo lugar, cada una podría ir a través de oficinas de correos totalmente distintas (*routers*). Esto depende de cómo se distribuyen en cada oficina.

![Figura 1.4](images/internet_4.png)

Así es como funciona - se envían mensajes y se espera una respuesta. En lugar de papel y lápiz, se usan bytes de datos, pero ¡la idea es la misma!

En lugar de direcciones con el nombre de la calle, ciudad, código postal y nombre del país, utilizamos direcciones IP. Tu computadora pide primero el DNS (Domain Name System - en español Sistema de Nombres de Dominio) para traducir djangogirls.org a una dirección IP. Funciona en cierta manera como los viejos directorios telefónicos donde puedes buscar el nombre de la persona que se deseas contactar y encontrar su número de teléfono y dirección.

Cuando envías una carta, ésta necesita tener ciertas características para ser entregada correctamente: una dirección, sello, etc. También utilizas un lenguaje que el receptor pueda entender, ¿cierto? Lo mismo se aplica a los *paquetes de datos* que envía para ver un sitio Web. Utilizamos un protocolo llamado HTTP (Protocolo de transferencia de hipertexto).

Así que, básicamente, cuando tienes un sitio web necesitas tener un *servidor* (la máquina) donde este vive. Cuando el *servidor* recibe una *petición* entrante (en una carta), este envía su sitio de Internet (en otra carta).

Ya que este es un tutorial de Django, puede que te preguntes que lo que Django hace. Bueno, cuando envías una respuesta, no siempre quieres enviar lo mismo a todo el mundo. Es mucho mejor si tus cartas son personalizadas, especialmente para la persona que acaba de escribir, ¿cierto? Django nos ayuda con la creación de estas cartas personalizadas. :)

Suficiente conversación - tiempo de crear!