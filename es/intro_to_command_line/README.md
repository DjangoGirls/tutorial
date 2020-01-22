# Introducción a la interfaz de línea de comandos

> Para los lectores en casa: este capítulo puede verse en el vídeo [Tu nuevo amigo: Línea de Comandos](https://www.youtube.com/watch?v=jvZLWhkzX-8).

Es emocionante, ¿verdad? ¡Vas a escribir tu primera línea de código en pocos minutos! :)

**Permítenos presentarte a tu primer amigo nuevo: ¡la línea de comandos!**

Los siguientes pasos te mostrarán cómo usar aquella ventana negra que todos los hackers usan. Puede parecer un poco aterrador al principio pero es solo un mensaje en pantalla que espera a que le des órdenes.

> **Nota** Ten en cuenta que a lo largo de este libro usamos los términos 'directorio' y 'carpeta' indistintamente pero son la misma cosa.

## ¿Qué es la línea de comandos?

La ventana, que generalmente es llamada **línea de comandos** ó **interfaz de línea de comandos**, es una aplicación basada en texto para ver, manejar y manipular archivos en tu ordenador. Similar a Windows Explorer o Finder en Mac, pero sin la interfaz gráfica. Otros nombres para la línea de comandos son: *cmd*, *CLI*, *prompt* -símbolo de sistema-, *console* -consola- o *terminal*.

## Abrir la interfaz de línea de comandos

Para empezar con algunos experimentos necesitarás abrir nuestra interfaz de línea de comandos en primer lugar.

{% include "/intro_to_command_line/open_instructions.md" %}

## Símbolo del Sistema (Prompt)

Ahora deberías ver una pantalla blanca o negra que espera a que introduzcas tus comandos.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Si estás en Mac o Linux, probablemente veas una `$`, como ésta:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

En Windows, probablemente veas un `>`, como éste:

{% filename %}command-line{% endfilename %}

    >
    

Echa un vistazo a la sección anterior sobre Linux -- podrás consultar más cuando llegues a PythonAnywhere más adelante en este tutorial.

<!--endsec-->

Cada comando vendrá precedido por un `$` o un `>` y un espacio, pero no debes escribirlos tú mismo. El ordenador lo hará por ti. :)

> Solo una pequeña anotación: en tu caso puede que haya algo como `C:\Users\ola>` o `Olas-MacBook-Air:~ ola$` antes del símbolo de introducción, lo cual es 100% NORMAL.

La parte superior incluye el `$` o el `>` que es llamado en la *línea de comandos*, o mas corto *prompt*. Introduce algo allí.

En el tutorial, cuando queramos introducir un comando, incluye el `$` o `>`, y ocasionalmente más a la izquierda. Ignora la parte izquierda solamente escribiendo el comando, el cuál inicia después de el prompt.

## Tu primer comando (¡BIEN!)

Iniciemos por teclear este comando:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

Y luego presiona `enter`. Esto será nuestro resultado:

{% filename %}command-line{% endfilename %}

    $ whoami olasitarska
    

Como puedes ver, el computador ha solo impreso tu nombre de usuario. Ordenado, ¿ah? :)

> Intenta escribir cada comando; no copies y pegues. ¡De ésta manera lo recordarás!

## Fundamentos

Cada sistema operativo tiene un poco diferente la configuración de los comandos para la consola, así que asegurate de seguir las instrucciones para tu sistema operativo. Intentemos esto, ¿Verdad?

### Directorio actual

Sería bueno saber dónde estamos ahora, ¿Correcto? Veamos. Escribe éste comando y presiona `enter`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Nota: 'pwd' es para imprimir el directorio de trabajo (print working directory).

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd 
    C:\Users\olasitarska
    

> Nota: 'cd' es para cambiar de directorio (change directory). Con la consola tu puedes usar pwd solo con Linux o Mac OS X.

<!--endsec-->

Probablemente veremos algo similar en tu computador. Una vez que abres la consola o la línea de comandos, usualmente inicias en tu directorio principal.

* * *

### Aprende más sobre un comando

¡Muchos comandos pueden escribirse en el prompt que tiene construído una ayuda que puedes leer! Por ejemplo, aprende más acerca de el comando del directorio actual:

<!--sec data-title="Command help: OS X and Linux" data-id="OSX_Linux_man" data-collapse=true ces-->

OS X y Linux tienen un comando `man`, el cuál te da una ayuda en comandos. Intenta `man pwd` y ve que dice, o coloca `man` antes de otro comando para ver su ayuda. La salida de `man` nomalmentes es paginada. Usa la barra de espacio para moverte a la siguiente página, y `q` para sallir de la ayuda.

<!--endsec-->

<!--sec data-title="Command Help: Windows" data-id="windows_help" data-collapse=true ces-->

Añade un sufijo `/?` para mas comandos que se imprimirán en la página de ayuda. Tú puedes hacer scroll a la ventana de comandos para verlos todos. Intenta `cd /?`.

<!--endsec-->

### Listar ficheros y directorios

Así que, ¿en qué estamos? Estaría bien saberlo. Veamos:

<!--sec data-title="List files and directories: OS X and Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    Applications
    Desktop
    Downloads
    Music
    ...
    

<!--endsec-->

<!--sec data-title="List files and directories: Windows" data-id="windows_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    Directory of C:\Users\olasitarska
    05/08/2014 07:28 PM <DIR> Applications
    05/08/2014 07:28 PM <DIR> Desktop
    05/08/2014 07:28 PM <DIR> Downloads
    05/08/2014 07:28 PM <DIR> Music
    ...
    

> Nota: En consola tu puedes usar también 'ls' como en Linux y Mac OS X. <!--endsec-->

* * *

### Cambiar el directorio actual

Ahora, vamos a nuestro directorio de escritorio:

<!--sec data-title="Change current directory: OS X" data-id="OSX_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Linux" data-id="Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Escritorio
    

Nota que el nombre del directorio "Escritorio" puede ser traducido al lenguaje de tu cuenta de Linux. Si ese es el caso, tu necesitarás reemplazar `Escritorio` con la traducción del nombre; por ejemplo, `Schreibtisch` para el alemán.

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Escritorio
    

<!--endsec-->

Verifica si está cambiado actualmente:

<!--sec data-title="Check if changed: OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check if changed: Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd C:\Users\olasitarska\Desktop
    

<!--endsec-->

¡Aquí está!

> PRO tip: si tu escribes `cd D` y luego presionas `tab` en tu teclado, la línea de comandos automáticamente llenará el resto de el nombre por el que puedes navegar. Si hay mas que una carpeta iniciando con "D", presiona la tecla `tab` dos veces para obtener una lista de opciones.

* * *

### Crear un directorio

¿Cómo crear un práctico directorio para tu escritorio? Tú puedes hacerlo de esta manera:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

Éste pequeño comando creará una carpeta con el nombre `práctica` en tu computador. ¡Tú puedes verificar si está allí en tu Escritorio o ejecutando uno de los siguientes comandos `ls` o `dir`! Intentalo. :)

> PRO tip: Si tu no quieres escribir el mismo comando una y otra vez, intenta presionando la `flecha arriba` y `flecha abajo` en tu teclado para regresar a través de los comandos recientemente usados.

* * *

### ¡Ejercicio!

Un pequeño reto para ti: en tu nuevo directorio creado `práctica`, crea un directorio llamado `prueba`. (Usa los comandos `cd` y `mkdir`.)

#### Solución:

<!--sec data-title="Exercise solution: OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd practica
    $ mkdir prueba
    $ ls
    prueba
    

<!--endsec-->

<!--sec data-title="Exercise solution: Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd practica
    > mkdir prueba
    > dir
    05/08/2014 07:28 PM <DIR>      prueba
    

<!--endsec-->

¡Felicidades! :)

* * *

### Limpieza

No queremos dejar un enredo, así que removamos todo lo que hicimos hasta este momento.

Primero, necesitamos regresar al Escritorio:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Usando los `..` con el comando `cd` cambiaremos tu actual directorio al directorio padre( que es, el directorio que contiene tu directorio actual).

Verifica dónde estás:

<!--sec data-title="Check location: OS X and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check location: Windows" data-id="windows_cd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd C:\Users\olasitarska\Desktop
    

<!--endsec-->

Es hora de eliminar el directorio `practica`:

> **Atención**: Si eliminas los archivos usando `del`, `rmdir` o `rm` no se podrán recuperar, esto significa ¡*el borrado de los archivos será para siempre*! Sé muy cuidados@ coon este comando.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S practica
    practica, ¿Estás segur@<Y/N>? Y
    

<!--endsec-->

¡Hecho! Estás seguro que lo eliminaste realmente, verifica:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Salir

¡Eso es todo por ahora! Tú puedes ahora cerrar la línea de comandos o consola sin problemas. Hazlo como un hacker, ¿vale? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Genial, ¿no? :)

## Resumen

Aquí está un resumen de algunos comandos útiles:

| Comando (Windows) | Comando (Mac OS / Linux) | Descripción                   | Ejemplo                                           |
| ----------------- | ------------------------ | ----------------------------- | ------------------------------------------------- |
| exit              | exit                     | Cierra la ventana             | **exit**                                          |
| cd                | cd                       | Cambia el directorio          | **cd test**                                       |
| cd                | pwd                      | Mostrar el directorio actual  | **cd** (Windows) o **pwd** (Mac OS / Linux)       |
| dir               | ls                       | Lista directorios/archivos    | **dir**                                           |
| copy              | cp                       | Copia de archivos             | **copy c:\test\test.txt c:\windows\test.txt** |
| move              | mv                       | Mueve archivos                | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir             | mkdir                    | Crea un nuevo directorio      | **mkdir testdirectory**                           |
| rmdir (o del)     | rm                       | Eliminar un archivo           | **del c:\test\test.txt**                        |
| rmdir /S          | rm -r                    | Eliminar un Directorio        | **rm -r testdirectory**                           |
| [CMD] /?          | man [CMD]                | Obtener ayuda para un comando | **cd /?** (Windows) o **man cd** (Mac OS / Linux) |

Estos son solo algunos de los comandos que tu puedes ejecutar en tu línea de comando o consola, pero no usarás ninguno más por hoy.

Si eres curios@, [ss64.com](http://ss64.com) contiene una referencia completa de comandos para todos los sistemas operativos.

## ¿Listo?

¡Vamos a bucear en Python!