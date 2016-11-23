# Dominio

PythonAnywhere te ha dado un dominio gratuito, pero tal vez no quieras tener ".pythonanywhere.com" al final de la URL de tu blog. Quizás quieras que tu blog viva en "www.infinite-kitten-pictures.org" o "www.3d-printed-steam-engine-parts.com" o "www.antique-buttons.com" o "www.mutant-unicornz.net", o lo que quieras que sea.

Aquí hablaremos brevemente sobre cómo obtener un dominio y veremos cómo vincularlo a tu aplicación web en PythonAnywhere. Sin embargo, deberías saber que la mayoría de los dominios son de pago, y PythonAnywhere te cobrará un valor adicional para usar tu propio nombre de dominio -- no es demasiado dinero en total, pero es probablemente algo que quieras hacer sólo si estás muy comprometida con la causa.

## ¿Donde registrar un dominio?

Un dominio típico cuesta alrededor de 15 dólares estadounidenses anuales. Hay opciones más baratas y más caras, dependiendo del proveedor. Hay una gran cantidad de empresas a las que puedes comprar un dominio: una simple [búsqueda en google][1] dará cientos de opciones.

 [1]: https://www.google.com/search?q=register%20domain

Nuestra opción favorita es [I want my name][2]. Ellos se promocionan como una opción "indolora para el manejo de dominios" y realmente lo son.

 [2]: https://iwantmyname.com/

También puedes obtener dominios gratuitos. [dot.tk][3] es un lugar para obtener uno, pero deberíamos advertirte que los dominios gratuitos a veces se sienten algo "baratos" -- si tu sitio va a ser un sitio para un negocio profesional, seguramente quieras considerar comprar un dominio "apropiado" que termine en `.com`.

 [3]: http://www.dot.tk

## Cómo apuntar tu dominio a PythonAnywhere

Si elegiste la opción de *iwantmyname.com*, haz click en `Domains` en el menú y elije tu nuevo dominio. Luego encuentra el vínculo a `manage DNS records`:

![][4]

 [4]: images/4.png

Ahora necesitas encontrar este formulario:

![][5]

 [5]: images/5.png

Y completarlo con los siguientes detalles: - Hostname: www - Type: CNAME - Value: tu dominio de PythonAnywhere (por ejemplo, djangogirls.pythonanywhere.com) - TTL: 60

![][6]

 [6]: images/6.png

En la parte inferior, haz click en el botón "Agregar" y guarda los cambios.

> **Nota** Si utilizaste un proveedor de dominios diferente, la interfaz exacta para encontrar tus configuraciones de DNS / CNAME será diferente, pero tu objetivo es el mismo: configurar un CNAME que apunte a tu nuevo dominio en `yourusername.pythonanywhere.com`.

Puede tomar unos minutos para tu dominio para empezar a funcionar, ¡sé paciente!

## Configura el dominio a través de la aplicación web en PythonAnywhere

También necesitarás decirle a PythonAnywhere que quieres usar tu dominio personalizado.

Ve a la página [PythonAnywhere Accounts][7] y haz una actualización del tipo de cuenta. La opción más económica (el plan "Hacker") está bien para empezar. Siempre puedes elegir un plan con mayores prestaciones después cuando te vuelvas super-famosa y tengas millones de visitas.

 [7]: https://www.pythonanywhere.com/account/

Luego, ve a la pestaña [Web][8] y anota un par de cosas:

 [8]: https://www.pythonanywhere.com/web_app_setup/

*   Copia la **ruta a tu virtualenv** y ponla en algún lugar seguro
*   Abre tu **archivo de configuración WSGI**, copia el contenido, y pégalo en algún lugar seguro

Luego, haz click en **Delete** de tu vieja aplicación web. No te preocupes, esto no eliminará tu código, solamente cambiará el dominio *yourusername.pythonanywhere.com*. Luego, crea una nueva aplicación web y sigue estos pasos:

*   Ingresa tu nombre de dominio
*   Elije "configuración manual"
*   Elije Python 3.4
*   ¡Y listo!

Cuando seas redirigida a la pestaña web.

*   Pega la ruta al virtualenv que guardaste anteriormente
*   Abre tu nuevo archivo de configuración WSGI y pega el contenido de tu viejo archivo de configuración

Haz click en actualizar, ¡deberías ver que tu sitio está en línea en el nuevo dominio!

Si te encuentras con algún problema, haz click en el vínculo "Send feedback" en el sitio de PythonAnywhere, y uno de sus amigables administradores te contactará para ayudarte en breve.
