# Introducción a Python

> Parte de este capítulo se basa en tutoriales por Geek Girls Carrots (http://django.carrots.pl/).

Vamos a escribir algo de código!

## Python prompt

Para empezar a jugar con Python, tenemos que abrir una *línea de comandos* en nuestra computadora. Ya sabes cómo hacerlo, lo aprendiste en el capítulo de [Introducción a la línea de comandos][1].

 [1]: /intro_to_command_line/README.html

Una vez que estés listo, sigue las siguientes instrucciones.

Queremos abrir una consola de Python, así que escribe `python3` y pulsa Enter.

    $ python3
    Python 3.4.2 (...)
    Type "copyright", "credits" or "license" for more information.
    >>>
    

## Tu primer comando en Python!

Después de ejecutar el comando de Python, el cursor cambia a `>>>`. Para nosotros esto significa que por ahora sólo podemos utilizar comandos en el lenguaje Python. No tienes que escribir en `>>>`-Python lo hará por ti.

Si deseas salir de la consola de Python en cualquier momento, simplemente escribe `exit()` o usar el atajo `Ctrl + Z` para Windows y `Ctrl + D` para Mac/Linux. Entonces no verás `>>>`.

Pero ahora, no queremos salir de la consola de Python. Queremos aprender más sobre él. Vamos a empezar con algo muy simple. Por ejemplo, trata de escribir algo de matemáticas, como `2 + 3` y pulsa Enter.

    >>> 2 + 3
    5
    

Bien! ¿Ves como salió la respuesta? Python sabe matemáticas! Podrías intentar otros comandos como: - `4 * 5` - `5 - 1` - `40 / 2`

Diviértete con esto por un tiempo y luego vuelve aquí :).

Como puedes ver, Python es una gran calculadora. Si te estás preguntando qué más puede hacer...

## Strings

¿Y tu nombre? Escriba tu nombre de pila en frases como ésta:

    >>> "Ola"
    'Ola'
    

Ahora has creado tu primer string! Es un conjunto de caracteres que pueden ser procesadas por una computadora. La cadena debe comenzar y terminar con el mismo carácter. Esto puede ser comillas simples (`'`) o dobles (`"`) - Python dice que lo que esta dentro de ellas es un string(texto).

Las cadenas pueden ser concatenadas. Prueba esto:

    >>> "Hola alli " + "Ola"
    'Hola alli Ola'
    

También puedes multiplicar las cadenas con un número:

    >>> "Ola" * 3
    'OlaOlaOla'
    

Si necesitas poner un apóstrofe dentro de tu cadena, tienes dos maneras de hacerlo.

Usar comillas dobles:

    >>> "Runnin' down the hill"
    "Runnin' down the hill"
    

o escapa el apóstrofo con una barra invertida (``):

    >>> 'Runnin\' down the hill'
    "Runnin' down the hill"
    

Bien, ¿eh? Para ver tu nombre en letras mayúsculas, simplemente escribe:

    >>> "Ola".upper()
    'OLA'
    

Usaste la **función** `upper` en tu cadena! Una función (como `upper()`) es un conjunto de instrucciones que Python tiene que realizar a un objeto determinado (`"Ola"`) una vez que se llama.

Si quisieras saber el número de letras que contiene tu nombre, también existe una función para esto.

    >>> len("Ola")
    3
    

Te preguntarás porque a veces se llama a las funciones con un `.` al final de un string (p. ej. `"Ola".upper()`), y a veces primero se llama a una función y se coloca el string entre paréntesis. Bueno, en algunos casos las funciones pertenecen a objetos, como `upper()`, que pueden solo ser utilizadas en strings (cadena de caracteres) En este caso, llamamos a la función de un **método**. Otra veces, las funciones no pertenecen a ninguno especifico y pueden ser usados en diferentes objetos, como `len()`. Eso es porque estamos dando `"Ola"` cono un parámetro a la función `len`.

### Resumen

Ok, suficiente de strings. Hasta ahora has aprendido sobre:

*   **la terminal** - teclea comandos (código) dentro de la terminal de Python para obtener resultados en preguntas en Python
*   **números y strings** - en Python los números son usados para matemáticas y strings para objetos de texto
*   **operadores** - como + y *, combinan valores para producir uno nuevo
*   **funciones** como upper() y len(), realizan opciones sobre los objetos.

Estos son los conocimientos básicos que puedes aprender de cualquier lenguaje de programación. ¿Listo para algo un poco más fuerte? ¡Apostamos que lo estás!

## Errores

Intentemos con algo nuevo. ¿Podríamos obtener la longitud de un número de la misma manera que obtuvimos la longitud de nuestro nombre? Teclea `len(304023)` y presiona Enter:

    >>> len(304023)
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: object of type 'int' has no len()
    

Tenemos nuestro primer error! Dice que los objetos de tipo "int" (números enteros) no tienen ninguna longitud. ¿Qué podemos hacer ahora? Quizás podemos escribir el numero como un string. Strings tienen longitud, ¿cierto?

    >>> len(str(304023))
    6
    

¡Funcionó! Utilizamos la función `str` dentro de la función `len` . `str()` convierte todo a strings.

*   La función `str` convierte cosas en **strings**
*   La función `int` convierte cosas en **integers**

> Importante: podemos convertir números en texto, pero no podemos necesariamente convertir texto en números - ¿qué sería de `int('hello')`?

## Variables

Un concepto importante en programación son las variables. Una variable no es más que un nombre para alguna cosa que tu puedes usar más tarde. Los programadores usan estas variables para almacenar datos, hacer su código más legible y así no tener que seguir recordando que hace cada cosa.

Supongamos que queremos crear una nueva variable llamada `nombre`:

    >>> name = "Ola"
    

¿Ves? ¡Es fácil! Es simplemente: name equivale a Ola.

Como te has dado cuenta, el programa no regresa algo como lo hacia antes. Entonces, ¿Cómo sabemos que la variable existe realmente? Simplemente introduce `name` y pulsa Enter:

    >>> name
    'Ola'
    

Súper! La primera variable :). Siempre podrás cambiar lo que se refiere a:

    >>> name = "Sonja"
    >>> name
    'Sonja'
    

Puedes usarla dentro de las funciones:

    >>> len(name)
    5
    

¿Increíble, cierto? Por supuesto, las variables pueden ser cualquier cosa, también números! Prueba esto:

    >>> a = 4
    >>> b = 6
    >>> a * b
    24
    

Pero ¿qué pasa si usamos el nombre equivocado? ¿Puedes adivinar qué pasaría? Vamos a probar!

    >>> city = "Tokyo"
    >>> ctiy
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    NameError: name 'ctiy' is not defined
    

Un error! Como puedes ver, Python tiene diferentes tipos de errores y estos se llaman **NameError**. Python te dará este error si intenta utilizar una variable que no ha sido definida aún. Si más adelante te encuentra con este error, verifica tu código para ver si es que no haya ningún nombre.

Juega con esto por un rato y mira que puedes hacer!

## La función print

Intenta esto:

    >>> name = 'Maria'
    >>> name
    'Maria'
    >>> print(name)
    Maria
    

Cuando sólo se escribe `name`, el intérprete de Python responde con la *representación* de la variable 'name', que es las letras M-a-r-i-a, rodeadas de comillas simples ''. Cuando dices `print(name)`, Python va a "Imprimir" el contenido de la variable a la pantalla, sin las comillas, que es mejor.

Como veremos después, print() también es útil cuando queremos imprimir cosas dentro de las funciones, o bien cuando queremos imprimir cosas en múltiples lineas.

## Listas

Entre string e integers, Python tiene todo tipo de diferentes tipos de objetos. Ahora vamos a introducir una llamada **list**. Las listas son exactamente lo que piensas que son: son objetos que son listas de otros objetos :)

Adelante y crear una lista:

    >>> []
    []
    

Sí, esta lista está vacía. No es muy útil, ¿verdad? Vamos a crear una lista de números de la lotería. No queremos repetirlos todo el tiempo, así que lo pondremos en una variable, también:

    >>> lottery = [3, 42, 12, 19, 30, 59]
    

Muy bien, tenemos una lista! ¿Qué podemos hacer con él? Vamos a ver cuántos números de la lotería. ¿Tienes alguna idea de función que debe usar para eso? Ya sabes esto!

    >>> len(lottery)
    6
    

¡ Sí! `Len()` puede dar un número de objetos en una lista. ¿Wow, verdad? Tal vez lo resolvamos ahora:

    >>> lottery.sort()
    

Esto no devuelve nada, sólo cambia el orden en que los números aparecen en la lista. Vamos a imprimir otra vez y ver que pasó:

    >>> print(lottery)
    [3, 12, 19, 30, 42, 59]
    

Como puedes ver, los números en la lista ahora están ordenados de menor a mayor. ¡ Felicidades!

¿Tal vez queremos invertir ese orden? Vamos a hacerlo!

    >>> lottery.reverse()
    >>> print(lottery)
    [59, 42, 30, 19, 12, 3]
    

Fácil, verdad? Si quieres añadir algo a tu lista, puedes hacerlo escribiendo este comando:

    >>> lottery.append(199)
    >>> print(lottery)
    [59, 42, 30, 19, 12, 3, 199]
    

Si desea mostrar sólo el primer número, puede hacerlo mediante el uso de **indixes**. Un index es el numero que se muestra en una lista como una ocurrencia. La computadora inicia la cuenta en 0, así que el primer objeto en la lista es en el índice 0, el siguiente es 1, y así sucesivamente. Intenta esto:

    >>> print(lottery[0])
    59
    >>> print(lottery[1])
    42
    

Como puedes ver, puedes acceder a diferentes objetos en la lista utilizando el nombre de la lista y el índice del objeto dentro de corchetes.

Para diversión adicional, prueba algunos otros índices: 6, 7, 1000, -1, -6 ó -1000. A ver si se puede predecir el resultado antes de intentar el comando. ¿Tienen sentido los resultados?

Puedes encontrar una lista de todos los métodos disponibles de la lista en este capítulo de la documentación de Python: https://docs.python.org/3/tutorial/datastructures.html

## Diccionarios

Un diccionario es similar a una lista, pero accedes a valores mediante una llave en lugar de un índice. Una llave puede ser cualquier cadena o número. La sintaxis para definir un diccionario vacío es:

    >>> {}
    {}
    

Esto demuestra que acabas de crear un diccionario vacío. ¡Hurra!

Ahora, trata de escribir el siguiente comando (trata de reemplazando tu propia información):

    >>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
    

Con este comando, que acaba de crear una variable denominada `participante` con tres pares de clave y valor:

*   El `name` apunta al valor `'Ola'` (un objeto `string`),
*   `country` apunta a `'Poland'` (otro `string`),
*   y `favorite_numbers` apunta a `[7, 42, 92]` (una `list` con tres números en el).

Puedes verificar el contenido de llaves individuales con esta sintaxis:

    >>> print(participant['name'])
    Ola
    

Mira, es similar a una lista. Pero no necesitas recordar el índice - sólo el nombre.

¿Qué pasa si pedimos a Python el valor de una llave que no existe? ¿Puedes adivinar? ¡Pruébalo y verá!

    >>> participant['age']
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    KeyError: 'age'
    

¡Mira, otro error! Este es un **KeyError**. Python es de ayuda y te dice que la llave `'age'` no existe en este diccionario.

¿Cuándo utilizar un diccionario o una lista? Bueno, eso es un buen punto para reflexionar. Sólo ten una solución en mente antes de mirar la siguiente respuesta.

*   ¿Sólo necesitas una secuencia ordenada de elementos? Usa una lista.
*   ¿Necesita asociar valores claves, así que puedas consultarlos eficientemente (por llaves) más adelante? Utiliza un diccionario.

Diccionarios, parecen listas, son *mutables*, lo que significa que pueden ser cambiados después de ser creados. Puedes agregar nuevos pares clave-valor en el diccionario después de que se crea, ejemplo:

    >>> participant['favorite_language'] = 'Python'
    

Como listas, método en los diccionarios, `len()` devuelve el número de pares clave-valor en el diccionario. Adelante, escribe el comando:

    >>> len(participant)
    4
    

Espero tenga sentido hasta ahora. :) ¿Lista para más diversión con los diccionarios? Salta a la siguiente línea para algunas cosas sorprendentes.

Puedes utilizar el comando `del` para borrar un elemento en el diccionario. Si deseas eliminar la entrada correspondiente a la clave `'favorite_numbers'`, sólo tienes que escribir el siguiente comando:

    >>> del participant['favorite_numbers']
    >>> participant
    {'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
    

Como puedes ver en la salida, el par de clave y valor correspondiente a la tecla de 'favorite_numbers' ha sido eliminado.

Además, también puedes cambiar un valor asociado a una clave ya creada en el diccionario. Teclea:

    >>> participant['country'] = 'Germany'
    >>> participant
    {'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
    

Como puedes ver, el valor de la clave `'country'` ha sido alterado de `'Poland'` a `'Germany'`. :) ¿Emocionante? ¡Hurra! Has aprendido otra cosa asombrosa.

### Resumen

Impresionante! Sabes mucho sobre programación ahora. En esta última parte aprendiste sobre:

*   **errors** - ahora sabe cómo leer y entender los errores que aparecen si Python no entiende un comando que has dado
*   **variables** - nombres para los objetos que permiten codificar más fácilmente y hacer el código más legible
*   **lists** - las listas de objetos almacenados en un orden determinado
*   **dictionaries** - objetos almacenados como pares de clave y valor

¿Emocionada por la siguiente parte? :)

## Compara cosas

Una gran parte de la programación incluye comparar cosas. ¿Qué es más fácil comparar? Números, por supuesto. Vamos a ver cómo funciona:

    >>> 5 > 2
    True
    >>> 3 < 1
    False
    >>> 5 > 2 * 2
    True
    >>> 1 == 1
    True
    

Le dimos a Python algunos números para comparar. Como puedes ver, Python puede comparar no sólo números, pero también puede comparar resultados de método. Bien, ¿eh?

¿Te preguntas por qué pusimos dos signos de igual `==` al lado del otro para comparar si los números son iguales? Utilizamos un solo `=` para asignar valores a las variables. Siempre, **siempre** es necesario poner dos `==` Si desea comprobar si las cosas son iguales entre sí.

Dan a Python dos tareas más:

    >>> 6 >= 12 / 2
    True
    >>> 3 <= 2
    False
    

`>` y `<` son fáciles, pero ¿qué es significa `> =` y `< =`? Se leen así:

*   x `>` y significa: x es mayor grande que y
*   x `<` y significa: x es menor que y
*   x `< =` y significa: x es menor o igual a y
*   x `> =` y significa: x es mayor o igual a y

¡Genial! ¿Quieres hacer uno mas? Intenta esto:

    >>> 6 > 2 y 2 < 3
    True
    >>> 3 > 2 y 2 < 1
    False
    >>> 3 > 2 ó 2 < 1
    True
    

Puedes darle a Python muchos números para comparar, y te dará una respuesta! Muy inteligente, verdad?

*   **and** - Si utilizas el operador `and`, las comparaciones deben estar en orden para que sea True
*   **or** - Si utilizas el operador `or`, sólo una de las comparaciones tiene que ser verdadera para ser True

¿Has oído la expresión "comparar manzanas con naranjas"? Vamos a probar el equivalente en Python:

    >>> 1 > 'django'
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: unorderable types: int() > str()
    

Aquí verás que al igual que en la expresión, Python no es capaz de comparar un número (`int`) y una string (`str`). En cambio, se muestra un **TypeError** y nos dice que no se puede comparar los dos tipos.

## Boolean

Por cierto, acabas de aprender acerca de un nuevo tipo de objeto en Python. Se llama un **boolean**--y es probable el más sencillo.

Hay sólo dos objetos Boolean: - True - False

Pero para que Python entender esto, es necesario siempre escribir como True (primera letra mayúscula, con el resto de la letra minúscula). **true, TRUE, tRUE no funcionan -- sólo True es correcto.** (Lo mismo aplica a False, por supuesto.)

Valores booleans pueden ser variables, también! Ve aquí:

    >>> a = True
    >>> a
    True
    

También puedes hacerlo de esta manera:

    >>> a = 2 > 5
    >>> a
    False
    

Practica y diviértete con booleanos corriendo los siguientes comandos:

*   `True and True`
*   `False and True`
*   `True or 1 == 1`
*   `1 != 2`

¡Felicidades! Los booleans son de las mejores funciones en la programación y acabas de aprender como usarlos.

# ¡Guárdalo!

Hasta ahora hemos estado escribiendo nuestro código de python en el intérprete, lo cual nos limita a una línea de código a la vez. Programas normales son guardados en archivos y ejecutados por el **intérprete** o **compiler** de nuestro idioma de programación. Hemos estado corriendo nuestros programas una linea a la vez en el **intérprete** de Python. Necesitaremos mas de una linea de código para las siguientes tareas, entonces necesitaremos hacer rápidamente lo siguiente:

*   Salir del intérprete de Python
*   Abrir el editor de texto de nuestra elección
*   Guardar algo de código en un nuevo archivo de python
*   ¡Correrlo!

Para salir del interprete de Python que hemos estado usando, simplemente escribe la función de ~~~ exit() ~~~:

    >>> exit()
    $
    

Esto te llevará de vuelta a la linea de comando.

Anteriormente, elegimos un editor de código en la sección de [code editor][2]. Tendremos que abrir el editor ahora y escribir algo de código en un archivo nuevo:

 [2]: code_editor/README.md

    print('Hello, Django girls!')
    

Obviamente, ahora eres una desarrolladora Python muy experimentada, así que siéntete libre de escribir algún código que has aprendido hoy.

Ahora tenemos que guardar el archivo y asignarle un nombre. Vamos a llamar al archivo **python_intro.py** y guárdalo en tu escritorio. Podemos nombrar el archivo de cualquier manera que queramos, lo importante aquí es asegurarse que el archivo finalice con **.py**, esto indica nuestro ordenador que este es un **archivo ejecutable de Python**.

Con el archivo guardado, es hora de ejecutarlo. Utilizando las habilidades que has aprendido en la sección de línea de comandos, utiliza la terminal para **cambiar los directorios** al escritorio.

En un Mac, el comando se verá algo como esto:

    cd /Users/<your_name>/Desktop
    

En Linux, va a ser así (la palabra "Desktop" puede ser traducido a su idioma):

    cd /home/<your_name>/Desktop
    

Y en windows, será así:

    cd C:\Users\<your_name>\Desktop
    

Si te quedas atascada, sólo pide ayuda.

y luego usa Python para ejecutar el código en el archivo como este:

    $ python3 python_intro.py
    Hello, Django girls!
    

Muy bien! Ejecutaste tu primer programa de Python. ¿Se siente increíble?

Ahora puedes moverte a una herramienta esencial en la programación:

## If...elif...else

Un montón de cosas en el código sólo son ejecutadas cuando se cumplen las condiciones. Por eso Python tiene algo llamado **sentencias if**.

Reemplace el código en el archivo **python_intro.py** por esto:

    if 3 > 2:
    

Si guardamos y ejecutams, veríamos un error como este:

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

Python da más instrucciones para lo que se suponen se ejecutará si la condición `3 > 2` resulta ser verdadera (o `True` para el caso). Intentemos hacer Python print "¡ funciona!". Cambiar tu código en el archivo **python_intro.py** a esto:

    if 3 > 2:
        print('It works!')
    

¿Observa cómo nos hemos puesto una sangría en la siguiente línea de código por 4 espacios? Tenemos que hacer esto para que Python sepa que el código resulta ser verdad. Puedes hacer un espacio, pero casi todos los programadores Python hacen 4 para hacerlo más legible. Una solo Tab también contará como 4 espacios.

Guarda y ejecútalo de nuevo:

    $ python3 python_intro.py
    It works!
    

### ¿Qué pasa si no?

En ejemplos anteriores, el código fue ejecutado sólo cuando las condiciones eran ciertas. Pero Python también tiene declaraciones `elif` y `else`:

    if 5 > 2:
        print('5 is indeed greater than 2')
    else:
        print('5 is not greater than 2')
    

Cuando esto se ejecute imprimiría:

    $ python3 python_intro.py
    5 is indeed greater than 2
    

Si 2 fuera un número mayor que 5, entonces el segundo comando sería ejecutado. Fácil, verdad? Vamos a ver cómo funciona `elif`:

    name = 'Sonja'
    if name == 'Ola':
        print('Hey Ola!')
    elif name == 'Sonja':
        print('Hey Sonja!')
    else:
        print('Hey anonymous!')
    

y ejecutado:

    $ python3 python_intro.py
    Hey Sonja!
    

¿Ves lo que pasó ahí?

### Resumen

En los últimos tres ejercicios aprendiste acerca de:

*   **comparando cosas** - en Python puedes comparar cosas mediante el uso de `>`, `> =`, `==`, `< =`, `<` y las `y` los operadores `o`
*   **Boolean** - un tipo de objeto que sólo puede tener uno de dos valores: `True` o `False`
*   **Guardar archivos** - almacenar código en archivos y puede ejecutar programas más grandes.
*   **si... elif... else** - las sentencias permiten ejecutar código sólo cuando se cumplan ciertas condiciones.

Sigue la última parte de este capítulo.

## Tus propias funciones!

¿Recuerdas las funciones como `len()` que puedes ejecutar en Python? Buenas noticias, aprenderás cómo escribir tus propias funciones ahora!

Una función es un conjunto de instrucciones que deben ser ejecutadas en Python. Cada función en Python comienza con la palabra clave `def`, se asigna un nombre y puede tener algunos parámetros. Vamos a empezar con algo fácil. Reemplace el código en **python_intro.py** con lo siguiente:

    def hi():
        print('Hi there!')
        print('How are you?')
    
    hi()
    

Bien, nuestra primera función está lista!

Te preguntarás por qué hemos escrito el nombre de la función en la parte inferior del archivo. Esto es porque Python lee el archivo y ejecuta desde arriba hacia abajo. Así que para poder utilizar nuestra función, tenemos que escribirla en la parte inferior.

Hay que ejecutar esto y ver lo que sucede:

    $ python3 python_intro.py
    Hi there!
    How are you?
    

Eso fue fácil! Vamos a construir nuestra primera función con parámetros. Utilizaremos el ejemplo anterior - una función que dice 'Hi' a la persona - con un nombre:

    def hi(name):
    

Como puedes ver, ahora dimos a nuestra función un parámetro que llamamos `name`:

    def hi(name):
        if name == 'Ola':
            print('Hi Ola!')
        elif name == 'Sonja':
            print('Hi Sonja!')
        else:
            print('Hi anonymous!')
    
    hi()
    

Como puedes ver, teníamos que poner dos guiones antes de la función `print`, porque `if` necesita saber lo que debe ocurrir cuando se cumple la condición. Vamos a ver cómo funciona:

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

Ops, un error. Por suerte, Python nos da un mensaje de error bastante útil. Nos dice que la función `hi()` tiene un argumento requerido `(name)` y que se nos olvidó pasarlo al llamar a la función. Vamos a arreglarlo en la parte inferior del archivo:

    hi("Ola")
    

y otra vez:

    $ python3 python_intro.py
    Hi Ola!
    

¿Y si cambiamos el nombre?

    hi("Sonja")
    

y ejecutamos:

    $ python3 python_intro.py
    Hi Sonja!
    

Ahora ¿qué crees que pasará si escribes otro nombre allí? (No Ola o Sonja) Prueba y verás si tienes razón. Esto debe imprimir:

    Hi anonymous!
    

Esto es increíble, ¿verdad? Así no tienes que repetirlo cada vez que deseas cambiar el nombre de la persona. Y eso es exactamente por qué necesitamos funciones - para no repetir tu código!

Vamos a hacer algo más inteligente - hay más de dos nombres, y escribir una condición para cada uno sería difícil, ¿no?

    def hi(name):
        print('Hi ' + name + '!')
    
    hi("Rachel")
    

Ahora vamos a llamar al código:

    $ python3 python_intro.py
    Hi Rachel!
    

¡Felicidades! Acabas de aprender cómo escribir funciones :)

## Loops

Ya es la última parte. ¿Eso fue rápido, verdad? :)

Como hemos mencionado, los programadores son perezosos, no les gusta repetir. Programación es automatizar las cosas, así que no queremos saludar a cada persona por su nombre manualmente, ¿verdad? Es ahí donde los ciclos son muy útil.

¿Todavía recuerda las listas? Hagamos una lista de las chicas:

    girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
    

Queremos saludar a todas ellas por su nombre. Tenemos la función `Hi` que hace eso, así que vamos a usarlo en un ciclo:

    for name in girls:
    

La sentencia ~ ~ ~ for ~ ~ ~ se comporta de manera similar a la sentencia ~ ~ ~ if ~ ~ ~, ve el código a continuación ambos necesitan ser ident a cuatro espacios.

Aquí está el código completo que estará en el archivo:

    def hi(name):
        print('Hi ' + name + '!')
    
    girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
    for name in girls:
        hi(name)
        print('Next girl')
    

y cuando lo eejcutamos:

    $ python3 python_intro.py
    Hi Rachel!
    Next girl
    Hi Monica!
    Next girl
    Hi Phoebe!
    Next girl
    Hi Ola!
    Next girl
    Hi You!
    Next girl
    

Como puedes ver, se repetirá todo lo que pones dentro de una instrucción `for` con una sangría para cada elemento de la lista de `girls`.

También puedes usar `for` en números usando el método `range`:

    for i in range(1, 6):
        print(i)
    

Lo cual imprime:

    1
    2
    3
    4
    5
    

`range` es una función que crea una lista de números en serie (estos números son proporcionados por ti como parámetros).

Ten en cuenta que la segunda de estas dos cifras no está incluida en la lista que es de salida en Python (significado `range(1, 6)` cuenta desde 1 a 5, pero no incluye el número 6).

## Resumen

Eso es todo. **Eres totalmente genial!** Esto realmente no fue tan fácil, así que deberías sentirte orgullosa de ti misma. Estamos definitivamente orgullosos de que hayas llegado hasta aquí!

Agarra un cupcake y vamos al siguiente capítulo :)

![Cupcake][3]

 [3]: images/cupcake.png
