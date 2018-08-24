{% set warning_icon = ' <span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# Introducción a Python

> Parte de este capítulo se basa en tutoriales de Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

¡Escribamos algo de código!

## La Consola de Python

> Para los lectores en casa: el video [conceptos básicos de Python: enteros, cadenas, listas, variables y errores](https://www.youtube.com/watch?v=MO63L4s-20U) cubre esta parte.

Para empezar a jugar con Python, tenemos que abrir una *línea de comandos* en nuestra computadora. Deberías saber cómo hacerlo, pues lo aprendiste en el capítulo de [Introducción a la Línea de Comandos](../intro_to_command_line/README.md).

Una vez que estés lista, sigue las instrucciones a continuación.

Queremos abrir una consola de Python, así que escribe `python` en Windows o `python3` en Mac OS/Linux y pulsa `intro`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## ¡Tu primer comando en Python!

Después de ejecutar el comando de Python, el cursor cambiará a `>>>`. Para nosotros esto significa que por ahora sólo podemos utilizar comandos del lenguaje Python. No tienes que escribir e`>>>` pues Python lo hará por ti.

Si deseas salir de la consola de Python en cualquier momento, simplemente escribe `exit()` o usa el atajo `Ctrl + Z` para Windows, o `Ctrl + D` para Mac/Linux. Luego no verás más `>>>`.

Por ahora, no queremos salir de la consola de Python. Deseamos aprender más sobre ella. Vamos a comenzar escribiendo algo de matemática, escribe `2 + 3` y oprime la tecla `enter`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

¡Qué bien! ¿Ves cómo salió la respuesta? ¡Python sabe matemática! Puedes probar otros comandos como:

- `4 * 5`
- `5 - 1`
- `40 / 2`

Para realizar una operación exponencial, digamos 2 elevado al cubo, escribimos: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

Diviértete con esto por un momento y luego vuelve aquí. :)

Como puedes ver, Python es una gran calculadora. Si te estás preguntando qué más puedes hacer…

## Cadena de caracteres

¿Qué tal tu nombre? Escribe tu nombre entre comillas, así:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

¡Has creado tu primera cadena de texto! La misma es una secuencia de caracteres que puede ser procesada por una computadora. La cadena de texto (o string, en inglés) debe comenzar y terminar con el mismo carácter. Pueden ser comillas simples (`'`) o dobles (`"`) (¡no hay ninguna diferencia!) Las comillas le dicen a Python que lo que está dentro de ellas es una cadena de texto.

Las cadenas pueden estar concatenadas. Prueba esto:

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

Si necesitas poner un apóstrofe dentro de una cadena, hay dos formas de hacerlo.

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

Bien, ¿eh? Para ver tu nombre en letras mayúsculas, sencillamente escribe:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

¡Acabas de usar el **método** `upper` sobre tu cadena de texto! Un método (como `upper()`) es un conjunto de instrucciones que Python tiene que realizar sobre un objeto determinado (`"Ola"`) una vez que se le invoca.

Si quieres saber el número de letras que contiene tu nombre, ¡también hay una **función** para eso!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

Te preguntarás ¿por qué a veces se invoca a las funciones con un `.` al final de una cadena (como `"Ola".upper()`) y a veces se invoca a la función colocando la cadena entre paréntesis? Bueno, en algunos casos las funciones pertenecen a los objetos, como `upper()`, que sólo puede ser utilizada sobre cadenas. En este caso, a la función le llamamos **método**. Otra veces, las funciones no pertenecen a ningún objeto específico y pueden ser usadas en diferentes objetos, como `len()`. Esta es la razón de por qué estamos pasando `"Ola"` como un parámetro a la función `len`.

### Resumen

Ok, es suficiente sobre las cadenas. Hasta ahora has aprendido sobre:

- **la terminal** - teclear comandos (código) en la terminal de Python resulta en respuestas de Python
- **números y strings** - en Python los números son usados para matemáticas y strings (cadenas de caracteres) para objetos de texto
- **operadores** - como `+` y `*`, combinan valores para producir uno nuevo
- **funciones** - como `upper()` y `len()`, ejecutan acciones sobre los objetos.

Estos son los conocimientos básicos que puedes aprender de cualquier lenguaje de programación. ¿Lista para algo más difícil? ¡Seguro que lo estás!

## Errores

Vamos a intentar algo nuevo. ¿Podemos obtener la longitud de un número de la misma manera que pudimos averiguar la longitud de nuestro nombre? Escribe `len(304023)` y pulsa `enter`:

{% filename %}PythonAnywhere command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

¡Pues tenemos nuestro primer error! El icono de {{ warning_icon }} es nuestra manera de darte un aviso de que el código que estás ejecutando no funciona como se espera. ¡Cometer errores (incluso algunos intencionales) son una parte importante del aprendizaje!

Dicho error dice que los objetos de tipo "int" (números enteros) no tienen longitud. ¿Qué podemos hacer ahora? ¿Quizás podamos escribir el número como una cadena? Las cadenas tienen longitud, ¿verdad?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

¡Funcionó! Hemos utilizado la función `str` dentro de la función `len`. `str()` convierte todo en cadenas de texto.

- La función `str` convierte cosas en cadenas, **strings**
- La función `int` convierte cosas en enteros, **integers**

> Importante: podemos convertir números en texto, pero no necesariamente podemos convertir texto en números - ¿qué sería `int('hello')`?

## Variables

Un concepto importante en la programación son las variables. Una variable no es más que un nombre para algo, de forma que puedas usarlo más tarde. Los programadores usan estas variables para almacenar datos, hacer su código más legible y para no tener que recordar qué es cada cosa.

Supongamos que queremos crear una nueva variable llamada `name`:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

Tecleamos que nombre es igual a Ola.

Como habrás notado, el programa no devuelve nada como lo hacía antes. ¿Cómo sabemos que la variable existe realmente? Sencillamente escribe `name` y pulsa `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> name
'Ola'
```

¡Genial! ¡Tu primera variable :)! Siempre puedes cambiar a lo que se refiere:

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

Increíble, ¿verdad? Por supuesto, las variables pueden ser cualquier cosa, ¡también números! Prueba esto:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

Pero ¿qué pasa si usamos el nombre equivocado? ¿Puedes adivinar qué pasaría? ¡Vamos a probar!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

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

Además de cadenas y enteros, Python tiene toda clase de tipos de objetos diferentes. Ahora vamos a introducir uno llamado **list**. Las listas son exactamente lo que piensas que son: objetos que son listas de otros objetos. :)

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

Si quieres añadir algo a tu lista, puedes hacerlo escribiendo este comando:

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

Para borrar algo de tu lista tendrás que usar **índices** como aprendimos anteriormente y la función `pop()`. Vamos a tratar de ejemplificar esto y reforzaar lo que aprendimos anteriormente; vamos a borrar el primer número de nuestra lista.

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

> Para lectores en casa: este capítulo está cubierto en el video [Bases de Python: Diccionarios](https://www.youtube.com/watch?v=ZX1CVvZLE6c).

Un diccionario es similar a una lista, pero accedes a valores usando una llave en vez de un índice. Una llave puede ser cualquier cadena o número. La sintaxis para definir un diccionario vacío es:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

Esto demuestra que acabas de crear un diccionario vacío. ¡Hurra!

Ahora, trata escribiendo el siguiente comando (intenta reemplazando con tu propia información):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

Con este comando, acabas de crear una variable llamada `participant` con tres pares llave-valor:

- La llave `name` apunta al valor `'Ola'` (un objeto `string`),
- `country` apunta a `'Poland'` (otro `string`),
- y `favorite_numbers` apunta a `[7, 42, 92]` (una `list` con tres números en ella).

Puedes verificar el contenido de claves individuales con esta sintaxis:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

Lo ves, es similar a una lista. Pero no necesitas recordar el índice - sólo el nombre.

¿Qué pasa si le pedimos a Python el valor de una clave que no existe? ¿Puedes adivinar? ¡Pruébalo y verás!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

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

Los diccionarios, como las listas, son *mutables*, lo que quiere decir que pueden ser modificados después de ser creados. Puedes agregar nuevos pares llave/valor a un diccionario luego de crearlo, como:

{% filename %}command-line{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

Como las listas, usando el método `len()` en los diccionarios devulven el número de pares llave-valor en el diccionario. Adelante escribe el comando:

{% filename %}command-line{% endfilename %}

```python
>>> len(participant)
4
```

Espero tenga sentido hasta ahora. :) ¿Listo para más diversión con diccionarios? Salta a la siguiente línea para algunas cosas sorprendentes.

Puedes utilizar el comando `pop()` para borrar un elemento en el diccionario. Por ejemplo, si deseas eliminar la entrada correspondiente a la clave `'favorite_numbers'`, sólo tienes que escribir el siguiente comando:

{% filename %}command-line{% endfilename %}

```python
>>> participant.pop('favorite_numbers')
[7, 42, 92]
>>> participant
{'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
```

Como puedes ver en la salida, el par de llave-valor correspondiente a la llave 'favorite_numbers' ha sido eliminado.

Además de esto, también puedes cambiar un valor asociado a una llave ya creada en el diccionario. Escribe:

{% filename %}command-line{% endfilename %}

```python
>>> participant['country'] = 'Germany'
>>> participant
{'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
```

Como puedes ver, el valor de la llave `'country'` ha sido modificado de `'Poland'` a `'Germany'`. :) ¿Emocionante? ¡Hurra! Has aprendido otra cosa asombrosa.

### Resumen

¡Genial! Sabes mucho sobre programación ahora. En esta última parte aprendiste sobre:

- **errores** - ahora sabes cómo leer y entender los errores que aparecen si Python no entiende un comando
- **variables** - nombres para los objetos que te permiten codificar más fácilmente y hacer el código más legible
- **listas** - listas de objetos almacenados en un orden determinado
- **diccionarios** - objetos almacenados como pares llave-valor

¿Emocionada por la siguiente parte? :)

## Compara cosas

> Para lectores en casa: este capítulo está cubierto en el video [Bases de Python: Comparaciones](https://www.youtube.com/watch?v=7bzxqIKYgf4).

Una gran parte de la programación incluye comparar cosas. ¿Qué es lo más fácil para comparar? Números, por supuesto. Vamos a ver cómo funciona:

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

Le dimos a Python algunos números para comparar. Como puedes ver, Python no sólo puede comparar números, sino que también puede comparar resultados de funciones. Bien, ¿eh?

¿Te preguntas por qué pusimos dos signos igual `==` al lado del otro para comparar si los números son iguales? Utilizamos un solo `=` para asignar valores a las variables. Siempre, **siempre** es necesario poner dos `==` Si deseas comprobar que las cosas son iguales entre sí. También podemos afirmar que las cosas no son iguales a otras. Para eso, utilizamos el símbolo `!=`, como mostramos en el ejemplo anterior.

Da dos tareas más a Python:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

We've seen `>` and `<`, but what do `>=` and `<=` mean? Read them like this:

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

- **and** - si utilizas el operador `and`, ambas comparaciones deben ser True para que el resultado de todo el comando sea True
- **or** - si utilizas el operador `or`, sólo una de las comparaciones tiene que ser True para que el resultado de todo el comando sea True

¿Has oído la expresión "comparar manzanas con naranjas"? Vamos a probar el equivalente en Python:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Aquí verás que al igual que en la expresión, Python no es capaz de comparar un número (`int`) y un string (`str`). En cambio, muestra un **TypeError** y nos dice que los dos tipos no se pueden comparar.

## Boolean

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

Hay sólo dos objetos booleanos:

- True - verdadero
- False - falso

Pero para que Python entienda esto, siempre los tienes que escribir de modo 'True' (la primera letra en mayúscula, con el resto de las letras en minúscula). **true, TRUE, tRUE no funcionarán -- solo True es correcto.** (Lo mismo aplica para 'False', por supuesto.)

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

> Para lectores en casa: este capítulo está cubierto en el video [Bases de Python: Guardando archivos y condicionales](https://www.youtube.com/watch?v=dOAg6QVAxyk).

Hasta ahora hemos escrito todo nuestro código Python en el intérprete, lo cual nos limita a ingresar una línea de código a la vez. Normal programs are saved in files and executed by our programming language **interpreter** or **compiler**. So far we've been running our programs one line at a time in the Python **interpreter**. We're going to need more than one line of code for the next few tasks, so we'll quickly need to:

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

This will put you back into the command prompt.

Earlier, we picked out a code editor from the [code editor](../code_editor/README.md) section. We'll need to open the editor now and write some code into a new file:

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Obviously, you're a pretty seasoned Python developer now, so feel free to write some code that you've learned today.

Now we need to save the file and give it a descriptive name. Let's call the file **python_intro.py** and save it to your desktop. We can name the file anything we want, but the important part here is to make sure the file ends in **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Nota** Deberías notar una de las cosas más geniales de los editores de código: ¡los colores! En la consola de Python, todo era del mismo color, ahora deberías ver que la función `print` es de un color diferente a la cadena en su interior. Esto de denomina "sintaxis resaltada", y es una característica muy útil cuando se programa. El color de las cosas te dará pistas, como cadenas no cerradas o errores tipográficos en un nombre clave (como `def` en una función, que veremos a continuación). Esta es una de las razones por las cuales usar un editor de código. :)

With the file saved, it's time to run it! Using the skills you've learned in the command line section, use the terminal to **change directories** to the desktop.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

On a Mac, the command will look something like this:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

On Linux, it will be like this (the word "Desktop" might be translated to your local language):

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

On Windows Command Prompt, it will be like this:

{% filename %}command-line{% endfilename %}

    > cd %HomePath%\Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

And on Windows Powershell, it will be like this:

{% filename %}command-line{% endfilename %}

    > cd $Home\Desktop
    

<!--endsec-->

If you get stuck, just ask for help.

Now use Python to execute the code in the file like this:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Alright! You just ran your first Python program that was saved to a file. Feel awesome?

You can now move on to an essential tool in programming:

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

Replace the code in your **python_intro.py** file with this:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
```

If we were to save and run this, we'd see an error like this:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

Python expects us to give further instructions to it which are executed if the condition `3 > 2` turns out to be true (or `True` for that matter). Let’s try to make Python print “It works!”. Change your code in your **python_intro.py** file to this:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

Notice how we've indented the next line of code by 4 spaces? We need to do this so Python knows what code to run if the result is true. You can do one space, but nearly all Python programmers do 4 to make things look neat. A single Tab will also count as 4 spaces as long as your text editor is set to do so. When you made your choice, don't change it! If you already indented with 4 spaces, make any future indentation with 4 spaces, too - otherwise you may run into problems.

Save it and give it another run:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
It works!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### ¿Qué pasa si una condición no es verdadera?

In previous examples, code was executed only when the conditions were True. But Python also has `elif` and `else` statements:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

When this is run it will print out:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    5 is indeed greater than 2
    

If 2 were a greater number than 5, then the second command would be executed. Let's see how `elif` works:

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

and executed:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hey Sonja!
    

See what happened there? `elif` lets you add extra conditions that run if the previous conditions fail.

You can add as many `elif` statements as you like after your initial `if` statement. For example:

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
    print("Me duelen las orejas! :(")
```

Python runs through each test in sequence and prints:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Perfect, I can hear all the details
    

## Comentarios

Comments are lines beginning with `#`. You can write whatever you want after the `#` and Python will ignore it. Comments can make your code easier for other people to understand.

Let's see how that looks:

{% filename %}python_intro.py{% endfilename %}

```python
# Cambiar el volumen si esta muy alto o muy bajo
if volume < 20 or volume > 80:
    volume = 50
    print("Mucho mejor!")
```

You don't need to write a comment for every line of code, but they are useful for explaining why your code is doing something, or providing a summary when it's doing something complex.

### Resumen

In the last few exercises you learned about:

- **Comparar cosas** - en Python puedes comparar cosas haciendo uso de `>`, `>=`, `==`, `<=`, `<` y de los operatores `and` y `or`
- **Boolean** - un tipo de objeto que sólo puede tener uno de dos valores: `True` o `False`
- **Guardar archivos** - almacenar código en archivos para que puedas ejecutar programas más grandes.
- **if... elif... else** - sentencias que te permiten ejecutar código sólo cuando se cumplen ciertas condiciones.
- **comentarios** - líneas que Python no ejecutará que permiten documentar el código

Time for the last part of this chapter!

## ¡Tus propias funciones!

> Para lectores en casa: este capítulo está cubierto en el video [Bases de Python: Funciones](https://www.youtube.com/watch?v=5owr-6suOl0).

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

A function is a sequence of instructions that Python should execute. Each function in Python starts with the keyword `def`, is given a name, and can have some parameters. Let's give it a go. Replace the code in **python_intro.py** with the following:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

Okay, our first function is ready!

You may wonder why we've written the name of the function at the bottom of the file. This is because Python reads the file and executes it from top to bottom. So in order to use our function, we have to re-write it at the bottom.

Let's run this now and see what happens:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi there!
    How are you?
    

Note: if it didn't work, don't panic! The output will help you to figure why:

- Si te sale `NameError`, probablemente significa que escribiste algo mal, así que deberias comprobar si utilizaste el mismo nombre para crear la función con `def hi():` y al llamarla con `hi()`.
- Si te sale un `IndentationError`, comprueba que las líneas del `print` tienen el mismo espacio en blanco al comienzo de línea: python requiere que todo el código dentro de la función esté perfectamente alineado.
- Si no hay ninguna salida, comprueba que el último `hi()` *no esté* identado - si lo está, esa línea también sera parte de la función, y nunca se ejecutará.

Let's build our first function with parameters. We will use the previous example – a function that says 'hi' to the person running it – with a name:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
```

As you can see, we now gave our function a parameter that we called `name`:

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

Remember: The `print` function is indented four spaces within the `if` statement. This is because the function runs when the condition is met. Let's see how it works now:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

Oops, an error. Luckily, Python gives us a pretty useful error message. It tells us that the function `hi()` (the one we defined) has one required argument (called `name`) and that we forgot to pass it when calling the function. Let's fix it at the bottom of the file:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

And run it again:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

And if we change the name?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

And run it:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

This is awesome, right? This way you don't have to repeat yourself every time you want to change the name of the person the function is supposed to greet. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

Let's call the code now:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    

Congratulations! You just learned how to write functions! :)

## Ciclos

> Para lectores en casa: este capítulo está cubierto en el video [Bases de Python: Ciclos "For"](https://www.youtube.com/watch?v=aEA6Rc86HF0).

This is the last part already. That was quick, right? :)

Programmers don't like to repeat themselves. Programming is all about automating things, so we don't want to greet every person by their name manually, right? That's where loops come in handy.

Still remember lists? Let's do a list of girls:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

We want to greet all of them by their name. We have the `hi` function to do that, so let's use it in a loop:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

The `for` statement behaves similarly to the `if` statement; code below both of these need to be indented four spaces.

Here is the full code that will be in the file:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

And when we run it:

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

You can also use `for` on numbers using the `range` function:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

Which would print:

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

`range` is a function that creates a list of numbers following one after the other (these numbers are provided by you as parameters).

Note that the second of these two numbers is not included in the list that is output by Python (meaning `range(1, 6)` counts from 1 to 5, but does not include the number 6). That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## Resumen

That's it. **You totally rock!** This was a tricky chapter, so you should feel proud of yourself. We're definitely proud of you for making it this far!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)