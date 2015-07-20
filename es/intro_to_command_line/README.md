# Introducción a la interfaz de línea de comandos

Es emocionante, ¿verdad? Vas a escribir tu primera línea de código en pocos minutos :)

**Permítenos presentarte a tu primer nuevo amigo: la línea de comandos!**

En los siguientes pasos te mostraran como usar aquella ventana negra que todos los hackers usan. Puede parecer aterrador al principio pero es solo un mensaje en pantalla que espera a que le des órdenes.

## ¿Qué es la línea de comandos?

La ventana, que generalmente es llamada **línea de comandos** o **interfaz de línea de comandos**, es una aplicación basada en texto para ver, manejar y manipular archivos en tu computadora (como por ejemplo el Explorador de Windows o Finder en Mac, pero sin la interfaz gráfica). Otros nombres para la línea de comandos son: *cmd*, *CLI*, *el símbolo del sistema*, *consola* o *terminal*.

## Abrir la interfaz de línea de comandos

Para empezar a experimentar con nuestra interfaz de linea de comandos lo primero que debemos hacer es abrirla.

### Windows

Ir al menú Inicio → todos los programas → accesorios → Command Prompt.

### Mac OS X

Aplicaciones → Servicios → Terminal.

### Linux

Esta probablemente en Aplicaciones → Accesorios → Terminal, pero eso depende de su distribución. Si no existe, Googlelo :)

## Prompt

Ahora deberías ver una ventana blanca o negra que está esperando tus órdenes.

Si estás en Mac o Linux, probablemente veráz `$`, como este:

    $


En Windows, es un signo así `>`, como este:

    >


Cada comando sera antepuesto por este signo y un espacio, pero no tienes que escribirlo. Tu computadora lo hará por ti :)

> Sólo una pequeña nota: en su caso, tal vez hay algo como `C:\Users\ola>` o `Olas-MacBook-Air:~ ola$` antes del prompt y eso es 100% correcto. En este tutorial sólo lo hemos simplificado a lo mínimo.

## Tu primer comando (¡YAY!)

Vamos a empezar con algo simple. Escribe este comando:

    $ whoami


o

    > whoami


Y luego oprime la tecla `enter`. Este es el resultado:

    $ whoami olasitarska


Como puedes ver, la computadora sólo te presento su nombre de usuario. Bien, eh? :)

> Trata de escribir cada comando, no copiar pegar. Te acordarás de más de esta manera!

## Básicos

Cada sistema operativo tiene un conjunto diferente de comandos para la línea de comandos, así que asegúrate de seguir las instrucciones para tu sistema operativo. Vamos a intentarlo, ¿de acuerdo?

### Directorio actual

Sería bueno saber dónde estamos ahora, ¿cierto? Vamos a ver. Escribe este comando y oprime `enter`:

    $ pwd
    /usuarios/olasitarska


Si estás en Windows:

    > cd
    C:\Users\olasitarska


Probablemente verás algo similar en tu máquina. Una vez que abres la línea de comandos generalmente empiezan en el directorio home del usuario.

> Nota: 'pwd' significa 'mostrar directorio de trabajo'.

* * *

### Lista de archivos y directorios

¿Qué es? Sería bueno saber. Veamos:

    $ ls
    Applications
    Desktop
    Downloads
    Music
    ...


Windows:

    > dir
    Directory of C:\Users\olasitarska
    05/08/2014 07:28 PM <DIR> Applications
    05/08/2014 07:28 PM <DIR> Desktop
    05/08/2014 07:28 PM <DIR> Downloads
    05/08/2014 07:28 PM <DIR> Music
    ...


* * *

### Cambie el directorio actual

¿Quizás podemos ir a nuestro directorio de escritorio?

    $ cd Desktop


Windows:

    > cd Desktop


Comprobar si realmente ha cambiado:

    $ pwd
    /Users/olasitarska/Desktop


Windows:

    > cd
    C:\Users\olasitarska\Desktop


¡Aquí está!

> PRO tip: si escribes `cd D` y luego oprimes `tab` en el teclado, la línea de comandos automáticamente Autorrellenara el resto del nombre para que puedas navegar más rápido. Si hay más de una carpeta a partir de "D", presiona el botón `tab` dos veces para obtener una lista de opciones.

* * *

### Crear directorio

¿Cómo crear un directorio de Django Girls en tu escritorio? Puedes hacerlo de esta manera:

    $ mkdir djangogirls


Windows:

    > mkdir djangogirls


Este pequeño comando creará una carpeta con el nombre `djangogirls` en tu escritorio. Puede comprobar si está allí buscando en tu escritorio o ejecutando un `ls/dir`! Inténtalo :)

> PRO tip: Si no quieres escribir una y otra vez los mismos comandos, prueba oprimiendo la `flecha arriba` y `flecha abajo` de tu teclado para recorrer comandos utilizados recientemente.

* * *

### Ejercicios!

Un pequeño reto para ti: en el directorio recién creado `djangogirls` crear un directorio llamado `test`. Utiliza los comandos `cd` y `mkdir`.

#### Solución:

    $ cd djangogirls
    $ mkdir test
    $ ls


Windows:

    > cd djangogirls
    > mkdir test
    > dir
    08/05/2014 19:28 <DIR> test


¡Felicidades! :)

* * *

### Limpiar

No queremos dejar un desorden, así que vamos a eliminar todo lo que hicimos hasta ese momento.

En primer lugar, tenemos que volver al escritorio:

    $ cd ..


Windows:

    > cd ..


Haciendo `cd` `..` cambiará el directorio actual al directorio padre (que significa el directorio que contiene el directorio actual).

Revisa dónde estás:

    $ pwd
    /Users/olasitarska/Desktop


Windows:

    > cd
    C:\Users\olasitarska\Desktop


Ahora es hora de eliminar el directorio `djangogirls`.

> **Atención**: eliminar archivos utilizando `del`, `rmdir` o `rm` es irrecuperable, lo que significa *archivos borrados desaparecerá para siempre*! Entonces, ser muy cuidadosa con este comando.

    $ rm - r djangogirls


Windows:

    > rmdir/s djangogirls
    djangogirls, ¿estás seguro <Y/N>? Y


Hecho! Asegurémonos que en verdad fueron borrados, vamos a ver:

    $ ls


Windows:

    > dir


### Salida

Eso es todo por ahora! Ahora con seguridad puedes cerrar la línea de comandos. Vamos a hacerlo al estilo hacker, bien? :)

    $ exit


Windows:

    > exit


Bueno, no? :)

## Índice

Aquí está una lista de algunos comandos útiles:

| Comando (Windows) | Comando (Mac OS / Linux) | Descripción                   | Ejemplo                                           |
| ----------------- | ------------------------ | ----------------------------- | ------------------------------------------------- |
| exit              | exit                     | cierra la ventana             | **exit**                                          |
| cd                | cd                       | Cambia el directorio          | **cd test**                                       |
| dir               | ls                       | lista de directorios/archivos | **dir**                                           |
| copy              | cp                       | copia el archivo              | **copy c:\test\test.txt c:\windows\test.txt** |
| move              | mv                       | mueve el archivo              | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir             | mkdir                    | Crea un nuevo directorio      | **mkdir testdirectory**                           |
| del               | rm                       | elimina un archivo/directorio | **del c:\test\test.txt**                        |

Estos son sólo muy pocos de los comandos en la línea de comandos que puedes utilizar pero no vas a usar algo más hoy.

Si tienes curiosidad, [ss64.com][1] contiene una referencia completa de comandos para todos los sistemas operativos.

 [1]: http://ss64.com

## Listo?

Vamos a sumergirnos en Python!
