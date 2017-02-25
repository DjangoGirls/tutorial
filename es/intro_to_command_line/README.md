# Introducción a la interfaz de línea de comandos

> Para los lectores en casa: este capítulo está cubierto en el video [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) (en Inglés).

Es emocionante, ¿verdad? Vas a escribir tu primera línea de código en pocos minutos :)

__Permítenos presentarte a tu primer nuevo amigo: ¡la línea de comandos!__

Los siguientes pasos te mostrarán cómo usar aquella ventana negra que todos los hackers usan. Puede parecer un poco aterrador al principio pero es solo un mensaje en pantalla que espera a que le des órdenes.

> **Nota** Ten en cuenta que a lo largo de este libro usamos los términos 'directorio' y 'carpeta' indistintamente pero son la misma cosa.

## ¿Qué es la línea de comandos?

La ventana que se llama generalmente la **línea de comandos** o la **interfaz de línea de comandos**, es una aplicación basada en texto para ver, manejar y manipular archivos en tu computadora. Al igual que Windows Explorer o Finder en Mac, pero sin la interfaz gráfica. Otros nombres para la línea de comandos son: *cmd*, *CLI*, *símbolo del sistema*, *consola* o *terminal*.

## Abrir la interfaz de línea de comandos

Lo primero que debemos hacer para empezar a experimentar con nuestra interfaz de línea de comandos es abrirla.

<!--sec data-title="Windows" data-id="windows_prompt" data-collapse=true ces-->

Ir al menú Inicio → Todos los programas → Accesorios → Command Prompt

<!--endsec-->


<!--sec data-title="OS X" data-id="OSX_prompt" data-collapse=true ces-->

Aplicaciones → Servicios → Terminal

<!--endsec-->

<!--sec data-title="Linux" data-id="linux_prompt" data-collapse=true ces-->

Está probablemente en Aplicaciones → Accesorios → Terminal, pero eso depende de tu distribución. Si no lo encuentras, Googlealo :)

<!--endsec-->

## Prompt

Ahora deberías ver una ventana blanca o negra que está esperando tus órdenes.

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->


Si estás en Mac o Linux, probablemente verás `$`, así:

{% filename %}command-line{% endfilename %}
```
$
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_prompt2" data-collapse=true ces-->


En Windows, es un signo así `>`, como este:

{% filename %}command-line{% endfilename %}
```
>
```
<!--endsec-->

Cada comando será precedido por este signo y un espacio, pero no tienes que escribirlo. Tu computadora lo hará por ti :)

> Sólo una pequeña nota: en tu caso puede que haya algo como `C:\Users\ola>` o `Olas-MacBook-Air:~ ola$` antes del prompt y eso está perfecto. En este tutorial lo simplificaremos lo más posible.

La parte hasta e incluyendo el `$` o el `>` se llama la *línea de comandos* o *prompt*. Está a la espera de que escribas algo ahí.

En el tutorial, cuando queremos que escribas un comando, vamos a incluir el `$` o `>`, y en algunas ocasiones, algo más a la izquierda. Puedes ignorar la parte izquierda y solo escribir el comando que comienza después del prompt.

## Tu primer comando (¡YAY!)

Vamos a empezar con algo simple. Escribe este comando:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ whoami
```

<!--endsec-->


<!--sec data-title="Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
> whoami
```

<!--endsec-->

Y pulsa `intro`. Este es nuestro resultado:

{% filename %}command-line{% endfilename %}
```
$ whoami
olasitarska
```

Como puedes ver, la computadora sólo te presentó tu nombre de usuario. Bien, ¿eh? :)

> Trata de escribir cada comando, no copies y pegues. ¡Te acordarás más de esta manera!

## Fundamentos

Cada sistema operativo tiene un conjunto diferente de comandos para la línea de comandos, así que asegúrate de seguir las instrucciones para tu sistema operativo. Vamos a intentarlo, ¿de acuerdo?

### Directorio actual

Estaría bien saber dónde estamos ahora, ¿verdad? Vamos a ver. Escribe este comando y pulsa `intro`:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->


{% filename %}command-line{% endfilename %}
```
$ pwd
/Users/olasitarska
```

> Nota: 'pwd' significa 'print working directory' - en español, 'mostrar directorio de trabajo'.

<!--endsec-->


<!--sec data-title="Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
> cd
C:\Users\olasitarska
```
> Nota: 'cd' significa 'current directory' - en español, 'directorio actual'.

<!--endsec-->

Probablemente verás algo similar en tu máquina. Una vez que abres la línea de comandos generalmente empiezas en el directorio home de tu usuario.

---

### Listar archivos y directorios

¿Qué hay aquí? Sería bueno saber. Veamos:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ ls
Applications
Desktop
Downloads
Music
...
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_dir" data-collapse=true ces-->


{% filename %}command-line{% endfilename %}
```
> dir
 Directory of C:\Users\olasitarska
05/08/2014 07:28 PM <DIR>      Applications
05/08/2014 07:28 PM <DIR>      Desktop
05/08/2014 07:28 PM <DIR>      Downloads
05/08/2014 07:28 PM <DIR>      Music
...
```
<!--endsec-->

---

### Cambia el directorio actual

Ahora, vayamos a nuestro directorio Desktop, el escritorio:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ cd Desktop
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_move_to" data-collapse=true ces-->


{% filename %}command-line{% endfilename %}
```
> cd Desktop
```
<!--endsec-->

Comprueba si realmente ha cambiado:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ pwd
/Users/olasitarska/Desktop
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
> cd
C:\Users\olasitarska\Desktop
```
<!--endsec-->

¡Aquí está!

> Truco pro: si escribes `cd D` y luego pulsas `tab` en el teclado, la línea de comandos automáticamente completará el resto del nombre para que puedas navegar más rápido. Si hay más de una carpeta que empiece con "D", presiona el botón `tab` dos veces para obtener una lista de opciones.

---

### Crear directorio

¿Qué tal si creamos un directorio de práctica en el escritorio? Lo puedes hacer de esta manera:

{% filename %}command-line{% endfilename %}
```
$ mkdir practice
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_mkdir" data-collapse=true ces-->


{% filename %}command-line{% endfilename %}
```
> mkdir practice
```
<!--endsec-->

Este pequeño comando creará una carpeta con el nombre `practice` en el escritorio. ¡Puedes comprobar si está ahí mirando en el escritorio o ejecutando el comando `ls` o `dir`! Inténtalo :)

> Truco pro: Si no quieres escribir una y otra vez los mismos comandos, prueba pulsando la `flecha arriba` y la `flecha abajo` de tu teclado para ir pasando por los comandos utilizados recientemente.

---

### ¡Ejercicios!

Un pequeño reto para ti: en el recién creado directorio `practice` crea un directorio llamado `test`. Utiliza los comandos `cd` y `mkdir`.

#### Solución:

{% filename %}command-line{% endfilename %}
```
$ cd practice
$ mkdir test
$ ls
test
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_test_dir" data-collapse=true ces-->


{% filename %}command-line{% endfilename %}
```
> cd practice
> mkdir test
> dir
05/08/2014 07:28 PM <DIR>      test
```
<!--endsec-->

¡Felicitaciones! :)

---

### Limpieza

No queremos dejar un lío, así que vamos a eliminar todo lo que hemos hecho hasta este momento.

En primer lugar, tenemos que volver al escritorio:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ cd ..
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_back" data-collapse=true ces-->


{% filename %}command-line{% endfilename %}
```
> cd ..
```
<!--endsec-->

Usar `..` con el comando `cd` hará que cambie el directorio actual al directorio padre (es el que contiene el directorio actual).

Revisa dónde estás:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ pwd
/Users/olasitarska/Desktop
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd3" data-collapse=true ces-->


{% filename %}command-line{% endfilename %}
```
> cd
C:\Users\olasitarska\Desktop
```
<!--endsec-->

Es el momento de eliminar el directorio `practice`:

> __Atención__: Eliminar archivos utilizando `del`, `rmdir` o `rm` hace que no puedan recuperarse, lo que significa que los *archivos borrados desaparecerán para siempre*. Así que ten mucho cuidado con este comando.

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ rm -r practice
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_rmdir" data-collapse=true ces-->


{% filename %}command-line{% endfilename %}
```
> rmdir /S practice
practice, Are you sure <Y/N>? Y
```
<!--endsec-->

¡Hecho! Para asegurarnos de que realmente se ha eliminado, vamos a comprobarlo:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ ls
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_dir2" data-collapse=true ces-->


{% filename %}command-line{% endfilename %}
```
> dir
```
<!--endsec-->


### Salida

¡Esto es todo por ahora! Ya puedes cerrar la línea de comandos sin problema. Vamos a hacerlo al estilo hacker, ¿vale?:)

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ exit
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_exit" data-collapse=true ces-->


{% filename %}command-line{% endfilename %}
```
> exit
```
<!--endsec-->


Genial, ¿no? :)

## Resumen

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

Estos son sólo algunos de los comandos que puedes ejecutar en la línea de comandos pero hoy no vas a utilizar ninguno más.

Si tienes curiosidad, [ss64.com][1] contiene una referencia completa de comandos para todos los sistemas operativos.

 [1]: http://ss64.com

## ¿Lista?

¡Vamos a sumergirnos en Python!
