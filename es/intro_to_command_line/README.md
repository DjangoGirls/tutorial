# Introducción a la interfaz de línea de comandos

Es emocionante, ¿verdad? Vas a escribir tu primera línea de código en pocos minutos :)

**Permítenos presentarte a tu primer nuevo amigo: ¡la línea de comandos!**

Los siguientes pasos te mostrarán cómo usar aquella ventana negra que todos los hackers usan. Puede parecer un poco aterrador al principio pero es solo un mensaje en pantalla que espera a que le des órdenes.

## ¿Qué es la línea de comandos?

La ventana, que generalmente es llamada **línea de comandos** o **interfaz de línea de comandos**, es una aplicación basada en texto para ver, manejar y manipular archivos en tu computadora (como por ejemplo el Explorador de Windows o Finder en Mac, pero sin la interfaz gráfica). Otros nombres para la línea de comandos son: *cmd*, *CLI*, *símbolo del sistema*, *consola* o *terminal*.

## Abrir la interfaz de línea de comandos

Lo primero que debemos hacer para empezar a experimentar con nuestra interfaz de linea de comandos es abrirla.

### Windows

Ir al menú Inicio → Todos los programas → Accesorios → Command Prompt

### Mac OS X

Aplicaciones → Servicios → Terminal

### Linux

Está probablemente en Aplicaciones → Accesorios → Terminal, pero eso depende de tu distribución. Si no lo encuentras, Googlealo :)

## Prompt

Ahora deberías ver una ventana blanca o negra que está esperando tus órdenes.

Si estás en Mac o Linux, probablemente verás `$`, así:

    $
    

En Windows, es un signo así `>`, como este:

    >
    

Cada comando será precedido por este signo y un espacio, pero no tienes que escribirlo. Tu computadora lo hará por ti :)

> Sólo una pequeña nota: en tu caso, tal vez hay algo como `C:\Users\ola>` o `Olas-MacBook-Air:~ ola$` antes del prompt y eso es 100% correcto. En este tutorial lo simplificaremos lo más posible.

## Tu primer comando (¡YAY!)

Vamos a empezar con algo simple. Escribe este comando:

    $ whoami
    

o

    > whoami
    

Y luego oprime la tecla Enter. Este es el resultado:

    $ whoami olasitarska
    

Como puedes ver, la computadora sólo te presentó tu nombre de usuario. Bien, ¿eh? :)

> Trata de escribir cada comando, no copies y pegues. ¡Te acordarás más de esta manera!

## Básicos

Cada sistema operativo tiene un conjunto diferente de comandos para la línea de comandos, así que asegúrate de seguir las instrucciones para tu sistema operativo. Vamos a intentarlo, ¿de acuerdo?

### Directorio actual

Sería bueno saber dónde estamos ahora, ¿cierto? Vamos a ver. Escribe este comando y oprime Enter:

    $ pwd
    /Users/olasitarska
    

Si estás en Windows:

    > cd 
    C:\Users\olasitarska
    

Probablemente verás algo similar en tu máquina. Una vez que abres la línea de comandos generalmente empiezas en el directorio home de tu usuario.

> Nota: 'pwd' significa 'print working directory' - en español, 'mostrar directorio de trabajo'.

* * *

### Lista de archivos y directorios

¿Qué hay aquí? Sería bueno saber. Veamos:

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

### Cambia el directorio actual

¿Quizás podemos ir a nuestro escritorio?

    $ cd Desktop
    

Windows:

    > cd Desktop
    

Comprueba si realmente ha cambiado:

    $ pwd 
    /Users/olasitarska/Desktop
    

Windows:

    > cd 
    C:\Users\olasitarska\Desktop
    

¡Aquí está!

> Pro tip: si escribes `cd D` y luego oprimes `tab` en el teclado, la línea de comandos automáticamente completará el resto del nombre para que puedas navegar más rápido. Si hay más de una carpeta que empiece con "D", presiona el botón `tab` dos veces para obtener una lista de opciones.

* * *

### Crear directorio

¿Qué tal si creamos un directorio de Django Girls en tu escritorio? Puedes hacerlo de esta manera:

    $ mkdir djangogirls
    

Windows:

    > mkdir djangogirls
    

Este pequeño comando creará una carpeta con el nombre `djangogirls` en tu escritorio. ¡Puedes comprobar si está allí buscando en tu escritorio o ejecutando el comando `ls` (si estás usando Mac o Linux) o `dir` (si estás usando Windows)! Inténtalo :)

> Pro tip: Si no quieres escribir una y otra vez los mismos comandos, prueba oprimiendo la `flecha arriba` y `flecha abajo` de tu teclado para ver recientes comandos utilizados.

* * *

### ¡Ejercicios!

Un pequeño reto para ti: en el directorio recién creado `djangogirls` crea un directorio llamado `test`. Utiliza los comandos `cd` y `mkdir`.

#### Solución:

    $ cd djangogirls 
    $ mkdir test
    $ ls
    

Windows:

    > cd djangogirls 
    > mkdir test
    > dir 
    08/05/2014 19:28 < DIR > test
    

¡Felicitaciones! :)

* * *

### Limpiar

No queremos dejar un desorden, así que vamos a eliminar todo lo que hicimos hasta este momento.

En primer lugar, tenemos que volver al escritorio:

    $ cd ..
    

Windows:

    > cd ..
    

`cd` `..` cambiará el directorio actual al directorio padre (que significa el directorio que contiene el directorio actual).

Revisa dónde estás:

    $ pwd 
    /Users/olasitarska/Desktop
    

Windows:

    > cd 
    C:\Users\olasitarska\Desktop
    

Ahora es hora de eliminar el directorio `djangogirls`.

> **Atención**: Eliminar archivos utilizando `del`, `rmdir` o `rm` hace que no puedan recuperarse, lo que significa que los *archivos borrados desaparecerán para siempre* Debes ser muy cuidadosa con este comando.

    $ rm -r djangogirls
    

Windows:

    > rmdir/s djangogirls 
    djangogirls, ¿Estás seguro <Y/N>? Y
    

Hecho! Asegurémonos que en verdad fueron borrados, vamos a ver:

    $ ls
    

Windows:

    > dir
    

### Salida

¡Esto es todo por ahora! Ahora puedes cerrar la línea de comandos sin problemas. Vamos a hacerlo al estilo hacker, ¿bien? :)

    $ exit
    

Windows:

    > exit
    

Genial, ¿no? :)

## Índice

Aquí hay una lista de algunos comandos útiles:

| Comando (Windows) | Comando (Mac OS / Linux) | Descripción                  | Ejemplo                                           |
| ----------------- | ------------------------ | ---------------------------- | ------------------------------------------------- |
| exit              | exit                     | Cierra la ventana            | **exit**                                          |
| cd                | cd                       | Cambia el directorio         | **cd test**                                       |
| dir               | ls                       | Lista directorios/archivos   | **dir**                                           |
| copy              | cp                       | Copia de archivos            | **copy c:\test\test.txt c:\windows\test.txt** |
| move              | mv                       | Mueve archivos               | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir             | mkdir                    | Crea un nuevo directorio     | **mkdir testdirectory**                           |
| del               | rm                       | Elimina archivos/directorios | **del c:\test\test.txt**                        |

Estos son solo algunos de los comandos que puedes ejecutar en la línea de comandos. No vas a usar nada más que esos por ahora.

Si tienes curiosidad, [ss64.com][1] contiene una referencia completa de comandos para todos los sistemas operativos.

 [1]: http://ss64.com

## ¿Lista?

¡Vamos a sumergirnos en Python!
