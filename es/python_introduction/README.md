# Introducción a Python

> Part of this chapter is based on tutorials by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

¡Vamos a escribir algo de código!

## El prompt de Python

> For readers at home: this part is covered in the [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) video.

Para empezar a jugar con Python, tenemos que abrir una *línea de comandos* en nuestra computadora. You should already know how to do that – you learned it in the [Intro to Command Line](../intro_to_command_line/README.md) chapter.

Una vez que estés lista, sigue las siguientes instrucciones.

We want to open up a Python console, so type in `python` on Windows or `python3` on Mac OS/Linux and hit `enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## ¡Tu primer comando en Python!

Después de ejecutar el comando de Python, el cursor cambia a `>>>`. Para nosotros esto significa que por ahora sólo podemos utilizar comandos en el lenguaje Python. You don't have to type in `>>>` – Python will do that for you.

Si deseas salir de la consola de Python en cualquier momento, simplemente escribe `exit()` o usa el atajo `Ctrl + Z` para Windows y `Ctrl + D` para Mac/Linux. Luego no verás más `>>>`.

Por ahora no queremos salir de la consola de Python. Queremos aprender más sobre ella. Empecemos con algo muy sencillo. For example, try typing some math, like `2 + 3` and hit `enter`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

Nice! See how the answer popped out? Python knows math! You could try other commands like:

- `4 * 5`
- `5 - 1`
- `40 / 2`

To perform exponential calculation, say 2 to the power 3, we type: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

Have fun with this for a little while and then get back here. :)

As you can see, Python is a great calculator. If you're wondering what else you can do…

## Cadena de caracteres

¿Qué tal tu nombre? Escribe tu nombre entre comillas, así:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

¡Has creado tu primer string! Es una secuencia de caracteres que puede ser procesada por una computadora. El string (o en español, cadena) debe comenzar y terminar con el mismo carácter. Pueden ser comillas simples (`'`) o dobles (`"`) (¡no hay diferencia!) Las comillas le dicen a Python que lo que está dentro de ellas es una cadena.

Las cadenas pueden ser concatenadas. Prueba esto:

{% filename %}command-line{% endfilename %}

```python
>>> "Hola " + "Ola"
'Hola Ola'
```

También puedes multiplicar las cadenas por un número:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

Si necesitas poner un apóstrofe dentro de la cadena, hay dos formas de hacerlo.

Usar comillas dobles:

{% filename %}command-line{% endfilename %}

```python
>>> "Runnin' down the hill"
"Runnin' down the hill"
```

o escapar el apóstrofe con la diagonal inversa (``):

{% filename %}command-line{% endfilename %}

```python
>>> 'Runnin\' down the hill'
"Runnin' down the hill"
```

Bien, ¿eh? Para ver tu nombre en letras mayúsculas, simplemente escribe:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

You just used the `upper` **method** on your string! A method (like `upper()`) is a sequence of instructions that Python has to perform on a given object (`"Ola"`) once you call it.

If you want to know the number of letters contained in your name, there is a **function** for that too!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

Te preguntarás por qué a veces se llama a las funciones con un `.` al final de una cadena (como `"Ola".upper()`) y a veces se llama a una función y colocas la cadena entre paréntesis. Bueno, en algunos casos las funciones pertenecen a objetos, como `upper()`, que sólo puede ser utilizado sobre cadenas (upper() es una función de los objetos string). En este caso, llamamos **método** a esta función. Otra veces, las funciones no pertenecen a ningún objeto específico y pueden ser usados en diferentes objetos, como `len()`. Esta es la razón de por qué estamos pasando `"Ola"` como un parámetro a la función `len`.

### Resumen

Ok, suficiente sobre las cadenas. Hasta ahora has aprendido sobre:

- **the prompt** – typing commands (code) into the Python prompt results in answers in Python
- **numbers and strings** – in Python numbers are used for math and strings for text objects
- **operators** – like `+` and `*`, combine values to produce a new one
- **functions** – like `upper()` and `len()`, perform actions on objects.

Estos son los conocimientos básicos que puedes aprender de cualquier lenguaje de programación. ¿Listo para algo más difícil? ¡Seguro que lo estás!

## Errores

Vamos a intentar algo nuevo. ¿Podemos obtener la longitud de un número de la misma manera que pudimos averiguar la longitud de nuestro nombre? Escribe `len(304023)` y pulsa `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

¡Tenemos nuestro primer error! Dice que los objetos de tipo "int" (números enteros) no tienen longitud. ¿Qué podemos hacer ahora? ¿Quizá podamos escribir el número como una cadena? Las cadenas tienen longitud, ¿verdad?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

¡Funcionó! Hemos utilizado la función `str` dentro de la función `len`. `str()` convierte todo en cadenas.

- La función `str` convierte cosas en cadenas, **strings**
- La función `int` convierte cosas en enteros, **integers**

> Important: we can convert numbers into text, but we can't necessarily convert text into numbers – what would `int('hello')` be anyway?

## Variables

Un concepto importante en programación son las variables. Una variable no es más que un nombre para alguno de forma que puedas usarlo más tarde. Los programadores usan estas variables para almacenar datos, hacer su código más legible y para no tener que recordar qué es cada cosa.

Supongamos que queremos crear una nueva variable llamada `name`:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

¿Ves? ¡Es fácil! Es simplemente: name equivale a Ola.

Como habrás notado, el programa no devuelve nada como lo hacía antes. ¿Cómo sabemos que la variable existe realmente? Simplemente escribe `name` y pulsa `intro`:

{% filename %}command-line{% endfilename %}

```python
>>> name
'Ola'
```

Yippee! Your first variable! :) You can always change what it refers to:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Sonja"
>>> name
'Sonja'
```

También puedes usarla dentro de funciones:

{% filename %}command-line{% endfilename %}

```python
>>> len(name)
5
```

Awesome, right? Of course, variables can be anything – numbers too! Try this:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

Pero ¿qué pasa si usamos el nombre equivocado? ¿Puedes adivinar qué pasaría? ¡Vamos a probar!

{% filename %}command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

¡Un error! Como puedes ver, Python tiene diferentes tipos de errores y este se llama **NameError**. Python te dará este error si intentas utilizar una variable que no ha sido definida aún. Si más adelante te encuentras con este error, verifica tu código para ver si no has escrito mal una variable.

¡Juega con esto un rato y descubre qué puedes hacer!

## La función print

Intenta esto:

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

Cuando sólo escribes `name`, el intérprete de Python responde con la *representación* en forma de cadena de la variable 'name', que son las letras M-a-r-i-a, rodeadas de comillas simples ''. Cuando dices `print(name)`, Python va a "imprimir" el contenido de la variable a la pantalla, sin las comillas, que es más claro.

Como veremos después, `print()` también es útil cuando queremos imprimir cosas desde adentro de las funciones, o cuando queremos imprimir cosas en múltiples líneas.

## Listas

Además de cadenas y enteros, Python tiene toda clase de tipos de objetos diferentes. Ahora vamos a introducir uno llamado **list**. Lists are exactly what you think they are: objects which are lists of other objects. :)

Anímate y crea una lista:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Sí, esta lista está vacía. No es muy útil, ¿verdad? Vamos a crear una lista de números de lotería. No queremos repetirnos todo el rato, así que la pondremos también en una variable:

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

Muy bien, ¡tenemos una lista! ¿Qué podemos hacer con ella? Vamos a ver cuántos números de lotería hay en la lista. ¿Tienes alguna idea de qué función deberías usar para eso? ¡Ya lo sabes!

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery)
6
```

¡Sí! `len()` puede darte el número de objetos en una lista. Útil, ¿verdad? Tal vez la ordenemos ahora:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

No devuelve nada, sólo ha cambiado el orden en que los números aparecen en la lista. Vamos a imprimirla otra vez y ver que ha pasado:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

Como puedes ver, los números de tu lista ahora están ordenados de menor a mayor. ¡Enhorabuena!

¿Te gustaría invertir ese orden? ¡Vamos a hacerlo!

{% filename %}command-line{% endfilename %}

```python
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

Fácil, ¿no? Si quieres añadir algo a tu lista, puedes hacerlo escribiendo este comando:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

Si deseas mostrar sólo el primer número, puedes hacerlo mediante el uso de **indexes** (en español, índices). Un índice es el número que te dice dónde en una lista aparece un ítem. Las programadoras y los programadores prefieren comenzar a contar desde 0, por lo tanto el primer objeto en tu lista esta en el indice 0, el próximo esta en el 1, y así sucesivamente. Intenta esto:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

Como puedes ver, puedes acceder a diferentes objetos en tu lista utilizando el nombre de la lista y el índice del objeto dentro de corchetes.

To delete something from your list you will need to use **indexes** as we learned above and the `pop()` method. Let's try an example and reinforce what we learned previously; we will be deleting the first number of our list.

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
>>> print(lottery[0])
59
>>> lottery.pop(0)
59
>>> print(lottery)
[42, 30, 19, 12, 3, 199]
```

Funcionó de maravilla!

Para diversión adicional, prueba algunos otros índices: 6, 7, 1000, -1, -6 ó -1000. A ver si se puedes predecir el resultado antes de intentar el comando. ¿Tienen sentido los resultados?

Puedes encontrar una lista de todos los métodos disponibles para listas en este capítulo de la documentación de Python: https://docs.python.org/3/tutorial/datastructures.html

## Diccionarios

> For readers at home: this part is covered in the [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) video.

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

Esto demuestra que acabas de crear un diccionario vacío. ¡Hurra!

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- La clave `name` apunta al valor `'Ola'` (un objeto `string`),
- `country` points to `'Poland'` (another `string`),
- y `favorite_numbers` apunta a `[7, 42, 92]` (una `list` con tres números en ella).

Puedes verificar el contenido de claves individuales con esta sintaxis:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

See, it's similar to a list. But you don't need to remember the index – just the name.

¿Qué pasa si le pedimos a Python el valor de una clave que no existe? ¿Puedes adivinar? ¡Pruébalo y verás!

{% filename %}command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

¡Mira, otro error! Este es un **KeyError**. Python te ayuda y te dice que la llave `'age'` no existe en este diccionario.

¿Cuando deberías usar un diccionario o una lista? Bueno, es un buen punto para reflexionar. Simplemente ten una solución en mente antes de buscar una respuesta en la siguiente línea.

- ¿Sólo necesitas una secuencia ordenada de elementos? Usa una lista.
- ¿Necesitas asociar valores con claves, así puedes buscarlos eficientemente (usando las claves) más adelante? Utiliza un diccionario.

Dictionaries, like lists, are *mutable*, meaning that they can be changed after they are created. You can add new key–value pairs to a dictionary after it is created, like this:

{% filename %}command-line{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

Like lists, using the `len()` method on the dictionaries returns the number of key–value pairs in the dictionary. Go ahead and type in this command:

{% filename %}command-line{% endfilename %}

```python
>>> len(participant)
4
```

I hope it makes sense up to now. :) Ready for some more fun with dictionaries? Read on for some amazing things.

You can use the `pop()` method to delete an item in the dictionary. Por ejemplo, si deseas eliminar la entrada correspondiente a la clave `'favorite_numbers'`, sólo tienes que escribir el siguiente comando:

{% filename %}command-line{% endfilename %}

```python
>>> participant.pop('favorite_numbers')
[7, 42, 92]
>>> participant
{'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
```

As you can see from the output, the key–value pair corresponding to the 'favorite_numbers' key has been deleted.

As well as this, you can also change a value associated with an already-created key in the dictionary. Type this:

{% filename %}command-line{% endfilename %}

```python
>>> participant['country'] = 'Germany'
>>> participant
{'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
```

As you can see, the value of the key `'country'` has been altered from `'Poland'` to `'Germany'`. :) Exciting? Hurrah! You just learned another amazing thing.

### Resumen

¡Genial! Sabes mucho sobre programación ahora. En esta última parte aprendiste sobre:

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

¿Emocionada por la siguiente parte? :)

## Compara cosas

> For readers at home: this part is covered in the [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4) video.

A big part of programming involves comparing things. What's the easiest thing to compare? Numbers, of course. Let's see how that works:

{% filename %}command-line{% endfilename %}

```python
>>> 5 > 2
True
>>> 3 < 1
False
>>> 5 > 2 * 2
True
>>> 1 == 1
True
>>> 5 != 2
True
```

We gave Python some numbers to compare. As you can see, not only can Python compare numbers, but it can also compare method results. Nice, huh?

¿Te preguntas por qué pusimos dos signos igual `==` al lado del otro para comparar si los números son iguales? Utilizamos un solo `=` para asignar valores a las variables. You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. También podemos afirmar que las cosas no son iguales a otras. Para eso, utilizamos el símbolo `!=`, como mostramos en el ejemplo anterior.

Da dos tareas más a Python:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

`>` y `<` son fáciles, pero ¿qué es significa `> =` y `< =`? Se leen así:

- x `>` y significa: x es mayor que y
- x `<` y significa: x es menor que y
- x `<=` y significa: x es menor o igual que y
- x `>=` y significa: x es mayor o igual que y

¡Genial! ¿Quieres hacer uno mas? Intenta esto:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

Puedes darle a Python todos los números para comparar que quieras, y siempre te dará una respuesta. Muy inteligente, ¿verdad?

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

¿Has oído la expresión "comparar manzanas con naranjas"? Vamos a probar el equivalente en Python:

{% filename %}command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: unorderable types: int() > str()
```

Aquí verás que al igual que en la expresión, Python no es capaz de comparar un número (`int`) y un string (`str`). En cambio, muestra un **TypeError** y nos dice que los dos tipos no se pueden comparar.

## Boolean

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**, and it is probably the easiest type there is.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

Los valores booleanos pueden ser variables, también. Ve el siguiente ejemplo:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

También puedes hacerlo de esta manera:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Practica y diviértete con los booleanos ejecutando los siguientes comandos:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

¡Felicidades! Los booleanos son una de las funciones más geniales en programación y acabas de aprender cómo usarlos.

# ¡Guárdalo!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

Hasta ahora hemos escrito todo nuestro código Python en el intérprete, lo cual nos limita a ingresar una línea de código a la vez. Normalmente los programas son guardados en archivos y son ejecutados por el **intérprete** o **compilador** de nuestro lenguaje de programación. Hasta ahora, hemos estado corriendo nuestros programas de a una línea por vez en el **intérprete** de Python. Necesitaremos más de una línea de código para las siguientes tareas, entonces necesitaremos hacer rápidamente lo que sigue:

- Salir del intérprete de Python
- Abrir el editor de texto de nuestra elección
- Guardar algo de código en un nuevo archivo de Python
- ¡Ejecutarlo!

To exit from the Python interpreter that we've been using, simply type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

Esto te llevará de vuelta a la línea de comandos.

Anteriormente, elegimos un editor de código en la sección de [Editor de código](code_editor/README.md). Tendremos que abrir el editor ahora y escribir algo de código en un archivo nuevo:

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Obviamente, ahora eres una desarrolladora Python muy experimentada, asi que sintete libre de escribir algo del código que has aprendido hoy.

Ahora tenemos que guardar el archivo y asignarle un nombre descriptivo. Vamos a llamar al archivo **python_intro.py** y guardarlo en tu escritorio. Podemos nombrar el archivo como queramos, pero la parte importante es asegurarse de que termina en **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. Esto de denomina "sintaxis resaltada", y es una característica muy útil cuando se programa. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). This is one of the reasons we use a code editor. :)

Con el archivo guardado, ¡es hora de ejecutarlo! Utilizando las habilidades que has aprendido en la sección de línea de comandos, utiliza la terminal para **cambiar los directorios** e ir al escritorio.

<!--sec data-title="OS X" data-id="python_OSX"
data-collapse=true ces-->

En una Mac, el comando se verá algo como esto:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Linux" data-id="python_linux"
data-collapse=true ces-->

On Linux, it will be like this (the word "Desktop" might be translated to your local language):

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

On Windows Command Prompt, it will be like this:

{% filename %}command-line{% endfilename %}

    > cd %HomePath%\Desktop
    

<!--endsec-->

<!--sec data-title="Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

And on Windows Powershell, it will be like this:

{% filename %}command-line{% endfilename %}

    > cd $Home\Desktop
    

<!--endsec-->

Si te quedas atascada, sólo pide ayuda.

Ahora usa Python para ejecutar el código en el archivo así:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

¡Muy bien! Ejecutaste tu primer programa de Python desde un archivo. ¿Te sientes increíble?

Ahora puedes moverte a una herramienta esencial en la programación:

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

Reemplaza el código en tu archivo **python_intro.py** con esto:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
```

If we were to save and run this, we'd see an error like this:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

Python espera que le demos más instrucciones las cuales se ejecutan si la condición `3 > 2` es verdadera (o `True`). Intentemos hacer que Python imprima "It works!". Cambia tu código en el archivo **python_intro.py** para que se vea como esto:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

¿Observas cómo hemos indentado la siguiente línea de código con 4 espacios? Necesitamos hacer esto para que Python sepa que código ejecutar si es resultado es verdadero. Puedes poner un espacio, pero casi todas las programadores y los programadores Python hacen 4 espacios para hacer que el código sea más legible. Un solo `tab` también cuenta como 4 espacios.

Guárdalo y ejecútalo de nuevo:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
It works!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### ¿Qué pasa si una condición no es verdadera?

En ejemplos anteriores, el código fue ejecutado sólo cuando las condiciones eran ciertas. Pero Python también tiene declaraciones `elif` y `else`:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

Cuando esto se ejecute imprimirá:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    5 is indeed greater than 2
    

Si 2 fuera un número mayor que 5, entonces el segundo comando sería ejecutado. Fácil, ¿verdad? Vamos a ver cómo funciona `elif`:

{% filename %}python_intro.py{% endfilename %}

```python
name = 'Sonja'
if name == 'Ola':
    print('Hey Ola!')
elif name == 'Sonja':
    print('Hey Sonja!')
else:
    print('Hey anonymous!')
```

y al ejecutarlo:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hey Sonja!
    

¿Ves lo que pasó allí?`elif` te permite agregar condiciones adicionales que se ejecutan si la condición previa falla.

Puede agregar tantas sentencias `elif` como quieras despues de la sentencia `if` inicial. Por ejemplo:

{% filename %}python_intro.py{% endfilename %}

```python
volume = 57
if volume < 20:
    print("It's kinda quiet.")
elif 20 <= volume < 40:
    print("It's nice for background music")
elif 40 <= volume < 60:
    print("Perfect, I can hear all the details")
elif 60 <= volume < 80:
    print("Nice for parties")
elif 80 <= volume < 100:
    print("A bit loud!")
else:
    print("My ears are hurting! :(")
```

Python corre a través de cada prueba en secuencia e imprime:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Perfect, I can hear all the details
    

## Comments

Comments are lines beginning with `#`. You can write whatever you want after the `#` and Python will ignore it. Comments can make your code easier for other people to understand.

Let's see how that looks:

{% filename %}python_intro.py{% endfilename %}

```python
# Change the volume if it's too loud or too quiet
if volume < 20 or volume > 80:
    volume = 50
    print("That's better!")
```

You don't need to write a comment for every line of code, but they are useful for explaining why your code is doing something, or providing a summary when it's doing something complex.

### Resumen

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

¡Es hora de leer la última parte de este capítulo!

## ¡Tus propias funciones!

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

Una función es una secuencia de instrucciones que Python debe ejecutar. Cada función en Python comienza con la palabra clave `def`, se le asigna un nombre y puede tener algunos parámetros. Vamos a empezar con algo fácil. Reemplaza el código en **python_intro.py** con lo siguiente:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

Bien, ¡nuestra primera función está lista!

Te preguntarás por qué hemos escrito el nombre de la función en la parte inferior del archivo. Esto es porque Python lee el archivo y lo ejecuta desde arriba hacia abajo. Así que para poder utilizar nuestra función, tenemos que reescribir su nombre en la parte inferior.

Ejecutemos esto y veamos qué sucede:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi there!
    How are you?
    

Note: if it didn't work, don't panic! The output will help you to figure why:

- If you get a `NameError`, that probably means you typed something wrong, so you should check that you used the same name when creating the function with `def hi():` and when calling it with `hi()`.
- If you get an `IndentationError`, check that both of the `print` lines have the same whitespace at the start of a line: python wants all the code inside the function to be neatly aligned.
- If there's no output at all, check that the last `hi()` *isn't* indented - if it is, that line will become part of the function too, and it will never get run.

Let's build our first function with parameters. We will use the previous example – a function that says 'hi' to the person running it – with a name:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
```

Como puedes ver, ahora dimos a nuestra función un parámetro que llamamos `name`:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    if name == 'Ola':
        print('Hi Ola!')
    elif name == 'Sonja':
        print('Hi Sonja!')
    else:
        print('Hi anonymous!')

hi()
```

Recuerda: La función `print` está indentada cuatro espacios dentro del `if`. Esto es porque la función corre cuando la condición se cumple. Veremos como funciona ahora:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

Oops, un error. Por suerte, Python nos da un mensaje de error bastante útil. Nos dice que la función `hi()` (la que definimos) tiene un argumento requerido (llamado `name`) y que se nos olvidó pasarlo al llamar a la función. Vamos a arreglarlo en la parte inferior del archivo:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

Y lo ejecutamos de nuevo:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

¿Y si cambiamos el nombre?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

Y lo ejecutamos:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

Esto es increíble, ¿verdad? De esta forma no tienes que repetir todo cada vez que deseas cambiar el nombre de la persona a la que la función debería saludar. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

Ahora vamos a llamar al código:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    

¡Felicidades! Acabas de aprender cómo escribir funciones :)

## Bucles

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

Esta es la última parte. Bien rápido, ¿cierto? :)

A las programadoras no les gusta repetirse a si mismas. Programar es sobre automatizar cosas, entonces no queremos saludar a cada persona por su nombre manualmente, ¿no? Ahí es donde los loops son útiles.

¿Todavía recuerdas las listas? Hagamos una lista de las chicas:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

Queremos saludar a todas ellas por su nombre. Tenemos la función `hi` que hace eso, así que vamos a usarla en un bucle:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

The ```for``` statement behaves similarly to the ```if``` statement; code below both of these need to be indented four spaces.

Aquí está el código completo que estará en el archivo:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

Y cuando lo ejecutamos:

{% filename %}command-line{% endfilename %}

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
    

As you can see, everything you put inside a `for` statement with an indent will be repeated for every element of the list `girls`.

También puedes usar el `for` en números usando la función `range`:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

Lo que imprimirá:

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

`range` es una función que crea una lista de números en serie (estos números son proporcionados por ti como parámetros).

Ten en cuenta que el segundo de estos dos números no será incluido en la lista que retornará Python (es decir, `range(1, 6)` cuenta desde 1 a 5, pero no incluye el número 6). That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## Resumen

Eso es todo. **¡Eres genial!** Este fue un capítulo difícil, por lo que debes sentirte orgullosa de ti misma. ¡Nosotras estamos orgullosas de ti porque has llegado lejos!

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)