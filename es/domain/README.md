# Dominio

Heroku le entregó un dominio pero es largo, dificil de recordar y feo. Seria asombroso contar con un nombre de dominio que sea sencillo y facil de recordar, ¿verdad?

En este capitulo te enseñaremos como adquirir un dominio dirigirlo a Heroku!

## ¿Donde registrar un dominio?

Un dominio normalmente cuesta alrededor de 15 dolares estadounidenses anuales. Existen opciones un poco mas baratas y otras un poco mas caras pero esto depende del proveedor. Existen muchas compañias donde puedes adquirir un dominio: una simple [busqueda en google][1] te dara miles de opciones. Hay opciones más baratas y más caras, dependiendo del proveedor. Hay una gran cantidad de empresas que se pueden comprar un dominio de: una simple [búsqueda en google][1] dará cientos de opciones.

 [1]: https://www.google.com/search?q=register%20domain

Nuestra opción predilecta es [I Want my name][2]. Ellos se promueven como una opción "indolora para el manejo de dominios" y realmente lo son.

 [2]: https://iwantmyname.com

## ¿Como registrar un dominio en IWantMyName?

Dirígete a [iwantmyname][3] y escriba un dominio que deseas tener en el cuadro de búsqueda.

 [3]: http://iwantmyname.com

![][4]

 [4]: images/1.png

Ahora deberías ver una lista de todos los dominios disponibles con el término que pusiste en el cuadro de búsqueda. Como puedes ver, una cara sonriente indica que el dominio está disponible para comprarlo, y una cara triste indica que no se encuentra disponible.

![][5]

 [5]: images/2.png

Hemos decidido comprar `djangogirls.in`:

![][6]

 [6]: images/3.png

Dirígete a la caja. Ahora debes registrare en iwantmyname, si todavía no tienes una cuenta. Después de eso, debes de proporcionar la información de tu tarjeta de crédito y finalmente podrás comprar el dominio!

Después de eso, Haz clic en `Dominios` en el menú y elige el dominio que acabas de adquirir. A continuación, busca y da clic en el enlace de `manage DNS records`:

![][7]

 [7]: images/4.png

Ahora necesitas localizar este formulario:

![][8]

 [8]: images/5.png

Y llenarlo con los siguientes datos: - Nombre de hosting: www - Tipo: CNAME - Valor: tu dominio de Heroku (por ejemplo djangogirls.herokuapp.com) - TTL: 3600

![][9]

 [9]: images/6.png

En la parte inferior, da clic en el botón Agregar y poder guardar los cambios.

Puede tomar un par de horas para que tu dominio empece a trabajar, así que mantente paciente!

## Configurar dominio en Heroku

También tienes que decirle a Heroku que deseas utilizar su dominio personalizado.

Dirígete a [Heroku Dashboard][10], inicia sesión con tu cuenta de Heroku y elije tu aplicación. Enseguida, configura tu aplicación y agrega tu dominio en la sección de `dominios` y guardar los cambios.

 [10]: https://dashboard.heroku.com/apps

Eso es todo!