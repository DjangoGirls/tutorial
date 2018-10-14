# Introducción a la interfaz de línea de comandos

> Para los lectores en casa: este capitulo es visto en el video [Tu nuevo amigo: línea de comandos](https://www.youtube.com/watch?v=jvZLWhkzX-8).

Es emocionante, ¿verdad? Vas a escribir tu primera línea de código en pocos minutos! :)

**Permítenos presentarte a tu primer nuevo amigo: ¡la línea de comandos!**

Los siguientes pasos te mostrarán cómo usar aquella ventana negra que todos los hackers usan. Puede parecer un poco aterrador al principio pero es solo un mensaje en pantalla que espera a que le des órdenes.

> **Nota** Ten en cuenta que a lo largo de este libro usamos los términos 'directorio' y 'carpeta' indistintamente pero son la misma cosa.

## ¿Qué es la línea de comandos?

La ventana, que generalmente es llamada **línea de comandos** ó **interfaz de línea de comandos**, es una aplicación basada en texto para ver, manejar y manipular archivos en tu ordenador. Similar a Windows Explorer o Finder en Mac, pero sin la interfaz gráfica. Otros nombres para la línea de comandos son: *cmd*, *CLI*, *prompt* -símbolo de sistema-, *console* -consola- o *terminal*.

## Abrir la interfaz de línea de comandos

Lo primero que debemos hacer para empezar a experimentar con nuestra interfaz de línea de comandos es abrirla.

<!--sec data-title="Opening: Windows" data-id="windows_prompt" data-collapse=true ces-->

Ve a Menú de inicio → Windows System → Command Prompt.

> En versiones anteriores de Windows, busca en Menú de inicio → Todos los programas → Accesorios → Command Prompt.

<!--endsec-->

<!--sec data-title="Opening: OS X" data-id="OSX_prompt" data-collapse=true ces-->

Ve a Aplicaciones → Utilidades → Terminal.

<!--endsec-->

<!--sec data-title="Opening: Linux" data-id="linux_prompt" data-collapse=true ces-->

Probablemente estará en Aplicaciones → Accesorios → Terminal, pero en tu sistema puede estar en un sitio distinto. Si no lo encuentras, busca en Google. :)

<!--endsec-->

## Símbolo del Sistema (Prompt)

Ahora deberías ver una ventana blanca o negra que está esperando tus órdenes.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

If you're on Mac or Linux, you probably see a `$`, like this:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

On Windows, you probably see a `>`, like this:

{% filename %}command-line{% endfilename %}

    >
    

Take a look at the Linux section just above now -- you'll see something more like that when you get to PythonAnywhere later in the tutorial.

<!--endsec-->

Each command will be prepended by a `$` or `>` and one space, but you should not type it. Your computer will do it for you. :)

> Sólo una pequeña nota: en tu caso puede que haya algo como `C:\Users\ola>` o `Olas-MacBook-Air:~ ola$` antes del símbolo prompt y eso está perfecto.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. Ignore the left part and only type in the command, which starts after the prompt.

## Tu primer comando (¡BIEN!)

Let's start by typing this command:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

And then hit `enter`. This is our result:

{% filename %}command-line{% endfilename %}

    $ whoami olasitarska
    

As you can see, the computer has just printed your username. Neat, huh? :)

> Trata de escribir cada comando, no copies y pegues. ¡Te acordarás más de esta manera!

## Fundamentos

Each operating system has a slightly different set of commands for the command line, so make sure to follow instructions for your operating system. Let's try this, shall we?

### Directorio actual

It'd be nice to know where are we now, right? Let's see. Type this command and hit `enter`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Nota: 'pwd' significa 'print working directory' - en español, 'mostrar directorio de trabajo'.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd 
    C:\Users\olasitarska
    

> Nota: 'cd' significa 'cambiar directorio'. Con powershell se puede utilizar pwd al igual que en Linux o Mac OS X.

<!--endsec-->

You'll probably see something similar on your machine. Once you open the command line you usually start at your user's home directory.

* * *

### Listar ficheros y directorios

So what's in it? It'd be cool to find out. Let's see:

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
    

> Nota: En powershell también puedes utilizar 'ls' como en Linux y Mac OS X. <!--endsec-->

* * *

### Cambia el directorio actual

Now, let's go to our Desktop directory:

<!--sec data-title="Change current directory: OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Check if it's really changed:

<!--sec data-title="Check if changed: OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd 
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check if changed: Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd 
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

Here it is!

> Truco pro: si escribes `cd D` y luego pulsas `tab` en el teclado, la línea de comandos automáticamente completará el resto del nombre para que puedas navegar más rápido. Si hay más de una carpeta que empiece con "D", dale al botón `tab` dos veces para obtener una lista de opciones.

* * *

### Crear directorio

How about creating a practice directory on your desktop? You can do it this way:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

This little command will create a folder with the name `practice` on your desktop. You can check if it's there by looking on your Desktop or by running a `ls` or `dir` command! Try it. :)

> Truco pro: Si no quieres escribir una y otra vez los mismos comandos, prueba pulsando la `flecha arriba` y la `flecha abajo` de tu teclado para ir pasando por los comandos utilizados recientemente.

* * *

### ¡Ejercicios!

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

#### Solución:

<!--sec data-title="Exercise solution: OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd practice
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Exercise solution: Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd practice
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR> test
    

<!--endsec-->

Congrats! :)

* * *

### Limpieza

We don't want to leave a mess, so let's remove everything we did until that point.

First, we need to get back to Desktop:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

Check where you are:

<!--sec data-title="Check location: OS X and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd 
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check location: Windows" data-id="windows_cd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd 
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

Now time to delete the `practice` directory:

> **Atención**: Eliminar archivos utilizando `del`, `rmdir` o `rm` hace que no puedan recuperarse, lo que significa que los *archivos borrados desaparecerán para siempre*! Así que ten mucho cuidado con este comando.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

Done! To be sure it's actually deleted, let's check it:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Salida

That's it for now! You can safely close the command line now. Let's do it the hacker way, alright? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Cool, huh? :)

## Resumen

Here is a summary of some useful commands:

| Comando (Windows) | Comando (Mac OS / Linux) | Descripción                  | Ejemplo                                           |
| ----------------- | ------------------------ | ---------------------------- | ------------------------------------------------- |
| salida            | salida                   | Cierra la ventana            | **salida**                                        |
| cd                | cd                       | Cambia el directorio         | **cd test**                                       |
| cd                | pwd                      | Mostrar el directorio actual | **cd** (Windows) o **pwd** (Mac OS / Linux)       |
| dir               | ls                       | Lista directorios/archivos   | **dir**                                           |
| copy              | cp                       | Copia de archivos            | **copy c:\test\test.txt c:\windows\test.txt** |
| move              | mv                       | Mueve archivos               | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir             | mkdir                    | Crea un nuevo directorio     | **mkdir testdirectory**                           |
| rmdir (o del)     | rm                       | Eliminar un archivo          | **del c:\test\test.txt**                        |
| rmdir /S          | rm -r                    | Eliminar un Directorio       | **rm -r testdirectory**                           |

These are just a very few of the commands you can run in your command line, but you're not going to use anything more than that today.

If you're curious, [ss64.com](http://ss64.com) contains a complete reference of commands for all operating systems.

## ¿Listo?

Let's dive into Python!