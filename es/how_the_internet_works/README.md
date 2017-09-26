# ¿Cómo funciona Internet?

> For readers at home: this chapter is covered in the [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) video.
> 
> This chapter is inspired by the talk "How the Internet works" by Jessica McKellar (http://web.mit.edu/jesstess/www/).

We bet you use the Internet every day. But do you actually know what happens when you type an address like https://djangogirls.org into your browser and press `enter`?

Lo primero que tienes que entender es que un sitio web es sólo un montón de archivos guardados en un disco duro. Al igual que tus películas, música o fotos. Sin embargo, los sitios web poseen una peculiaridad: incluyen un código informático llamado HTML.

Si no estás familiarizada con la programación, puede ser difícil captar HTML a la primera, pero tus navegadores web (como Chrome, Safari, Firefox, etc.) lo aman. Los navegadores están diseñados para entender este código, seguir sus instrucciones y presentar estos archivos de los cuales está hecho tu sitio web, exactamente de la forma que quieres.

Como cualquier otro archivo, tenemos que guardar los archivos HTML en algún lugar de un disco duro. Para Internet, utilizamos equipos especiales, de gran alcance llamados *servidores*. Estos no tienen una pantalla, ratón o teclado, debido a que su propósito es almacenar datos y servirlos. That's why they're called *servers* – because they *serve* you data.

OK, but you want to know how the Internet looks, right?

¡Te hemos hecho una imagen! Luce algo así:

![Figura 1.1](images/internet_1.png)

Parece un lío, ¿no? In fact it is a network of connected machines (the above-mentioned *servers*). ¡Cientos de miles de máquinas! ¡Muchos, muchos kilómetros de cables alrededor del mundo! Puedes visitar el sitio web Submarine Cable Map (http://submarinecablemap.com/) y ver lo complicada que es la red. Aquí hay una captura de pantalla de la página web:

![Figura 1.2](images/internet_3.png)

Es fascinante, ¿no? Pero, obviamente, no es posible tener un cable entre cada máquina conectada a Internet. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

Se parece a esto:

![Figura 1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

Tu carta va hacia la oficina de correo más cercana. Luego va a otra que es un poco más cerca de su destinatario, luego otra y otra hasta que es entregada a su destino. La única cosa diferente es que si envías muchas cartas (*paquetes de datos*) al mismo lugar, cada una podría ir a través de oficinas de correos totalmente distintas (*routers*). Esto depende de cómo se distribuyen en cada oficina.

![Figura 1.4](images/internet_4.png)

Sí, es tan simple como eso. Enviar mensajes y esperar alguna respuesta. Por supuesto, en vez de papel y lapicera usas bytes de datos, ¡pero la idea es la misma!

En lugar de direcciones con el nombre de la calle, ciudad, código postal y nombre del país, utilizamos direcciones IP. Tu computadora pide primero el DNS (Domain Name System - en español Sistema de Nombres de Dominio) para traducir djangogirls.org a una dirección IP. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. También utilizas un lenguaje que el receptor pueda entender, ¿cierto? Lo mismo se aplica a los *paquetes de datos* que envía para ver un sitio Web. Utilizamos un protocolo llamado HTTP (Protocolo de transferencia de hipertexto).

Así que, básicamente, cuando tienes un sitio web necesitas tener un *servidor* (la máquina) donde este vive. Cuando el *servidor* recibe una *petición* entrante (en una carta), este envía su sitio de Internet (en otra carta).

Since this is a Django tutorial, you might ask what Django does. Bueno, cuando envías una respuesta, no siempre quieres enviar lo mismo a todo el mundo. Es mucho mejor si tus cartas son personalizadas, especialmente para la persona que acaba de escribir, ¿cierto? Django helps you with creating these personalized, interesting letters. :)

Enough talk – time to create!