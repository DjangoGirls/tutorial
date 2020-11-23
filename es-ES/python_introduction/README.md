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
    Python {{ book.py_release }} (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## ¡Tu primer comando en Python!

Después de ejecutar el comando de Python, el cursor cambiará a `>>>`. Para nosotros esto significa que por ahora sólo podemos utilizar comandos del lenguaje Python. No tienes que escribir e`>>>` pues Python lo hará por ti.

Si deseas salir de la consola de Python en cualquier momento, solo escribe `exit()` o usa el atajo `Ctrl + Z` para Windows y `Ctrl + D` para Mac/Linux. Luego no verás más `>>>`.

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

Bien, ¿eh? Para ver tu nombre en letras mayúsculas, escribe:

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

Como habrás notado, tu programa no devolvió nada como lo hacía antes. Así que ¿cómo sabemos que la variable existe realmente? Escribe `name` y pulsa `intro`:

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

¿Cuando deberías usar un diccionario o una lista? Bueno, es un buen punto para reflexionar. Piensa sobre la respuesta, antes de mirar una solución en la siguiente línea.

- ¿Sólo necesitas una secuencia ordenada de elementos? Usa una lista.
- ¿Necesitas asociar valores con claves, así puedes buscarlos eficientemente (usando las claves) más adelante? Utiliza un diccionario.

Los diccionarios, como las listas, son *mutables*, lo que quiere decir que pueden ser modificados después de ser creados. Puedes agregar nuevos pares llave/valor a un diccionario luego de crearlo, como:

{% filename %}command-line{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

Like lists, using the `len()` function on the dictionaries returns the number of key–value pairs in the dictionary. Go ahead and type in this command:

{% filename %}command-line{% endfilename %}

```python
>>> len(participant)
4
```

Espero tenga sentido hasta ahora. :) ¿Listo para más diversión con diccionarios? Salta a la siguiente línea para algunas cosas sorprendentes.

Puedes utilizar el comando `pop()` para borrar un elemento en el diccionario. Por ejemplo, si deseas eliminar la entrada correspondiente a la clave `'favorite_numbers'`, tienes que escribir el siguiente comando:

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

Buena parte de la programación incluye comparar cosas. ¿Qué es lo más fácil para comparar? Números, por supuesto. Vamos a ver cómo funciona:

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
>>> len([1, 2, 3]) > len([4, 5])
True
```

We gave Python some numbers to compare. As you can see, not only can Python compare numbers, but it can also compare values of mathematical expressions like `2 * 2` and function results like the `2` returned by `len([4, 5])`. Nice, huh?

¿Te preguntas por qué pusimos dos signos igual `==` al lado del otro para comparar si los números son iguales? Utilizamos un solo `=` para asignar valores a las variables. Siempre, **siempre** es necesario poner dos `==` Si deseas comprobar que las cosas son iguales entre sí. También podemos afirmar que las cosas no son iguales a otras. Para eso, utilizamos el símbolo `!=`, como mostramos en el ejemplo anterior.

Da dos tareas más a Python:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

Hemos visto `>` y `<`, pero, ¿qué significan `>=` y `<=`? Los puedes leer así:

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

Incidentalmente, acabas de aprender sobre un nuevo tipo de objeto en Python. Se llama **Boolean** (booleano).

Hay sólo dos objetos booleanos:

- True - verdadero
- False - falso

Pero para que Python entienda esto, siempre los tienes que escribir de modo 'True' (la primera letra en mayúscula, con el resto de las letras en minúscula). **true, TRUE, y tRUE no funcionarán – solamente True es correcta.** (Lo mismo aplica también para 'False'.)

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

Hasta ahora hemos escrito todo nuestro código Python en el intérprete, lo cual nos limita a ingresar una línea de código a la vez. Normalmente los programas son guardados en archivos y son ejecutados por el **intérprete** o **compilador** de nuestro lenguaje de programación. Hasta ahora, hemos estado corriendo nuestros programas de a una línea por vez en el **intérprete** de Python. Necesitaremos más de una línea de código para las siguientes tareas, entonces necesitaremos hacer rápidamente lo que sigue:

- Salir del intérprete de Python
- Abrir el editor de texto de nuestra elección
- Guardar algo de código en un nuevo archivo de Python
- ¡Ejecutarlo!

Para salir del intérprete de Python que hemos estado usando, escribe `exit()`

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

Esto te llevará de vuelta a la línea de comandos.

Anteriormente, seleccionamos un editor de código de la sección </a>editor de código</0>. Necesitaremos abrir el editor ahora y escribir algo de código en un nuevo archivo (o si está usando un Chromebook, cree un nuevo archivo en el IDE de la nube y abra el archivo, que estará en el editor de código incluido):

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Obviamente, ahora eres una desarrolladora Python muy experimentada, asi que sintete libre de escribir algo del código que has aprendido hoy.

Ahora tenemos que guardar el archivo y asignarle un nombre descriptivo. Vamos a llamar al archivo **python_intro.py** y guardarlo en tu escritorio. Podemos nombrar el archivo como queramos, pero la parte importante es asegurarse de que termina en **.py**. La extensión **.py** le dice a nuestro sistema operativo que es un **archivo ejecutable de python** y Python lo puede ejecutar.

> **Nota** Deberías notar una de las cosas más geniales de los editores de código: ¡los colores! En la consola de Python, todo era del mismo color, ahora deberías ver que la función `print` es de un color diferente a la cadena en su interior. Esto de denomina "sintaxis resaltada", y es una característica muy útil cuando se programa. El color de las cosas te dará pistas, como cadenas no cerradas o errores tipográficos en un nombre clave (como `def` en una función, que veremos a continuación). Esta es una de las razones por las cuales usar un editor de código. :)

Con el archivo guardado, ¡es hora de ejecutarlo! Utilizando las habilidades que has aprendido en la sección de línea de comandos, utiliza la terminal para **cambiar los directorios** e ir al escritorio.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

En una Mac, el comando se verá algo como esto:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

En Linux, será así:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

(Recuerde que la palabra "Desktop" puede traducirse a su idioma local.)

<!--endsec-->

<!--sec data-title="Change directory: Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

En la consola de Windows, ésto será como:

{% filename %}command-line{% endfilename %}

    > cd %HomePath%\Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

Y en Windows Powershell, será así:

{% filename %}command-line{% endfilename %}

    > cd $Home\Desktop
    

<!--endsec-->

Si tú estás atascada, pregunta por ayuda. ¡Eso es exactamente lo que hacen los entrenadores!

Ahora usa Python para ejecutar el código en el archivo como esto:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Nota: en Windows 'python3' no es reconocido como un comando. En su lugar, usa 'python' para ejecutar el archivo:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

¡Correcto! Ahora corriste tu primer programa de Python que fue guardado en un archivo. ¿Se siente increíble?

Puedes ahora moverte a una herramienta esencial en programación:

## If … elif … else

Muchas de las cosas en código debería ser ejecutadas solo cuando las condiciones son conocidas. Eso es por qué Python lo ha llamado **sentencias if**.

Reemplaza el código en tu archivo **python_intro.py** con esto:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
```

Si guardáramos y corriéramos esto, veríamos un error como éste:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

Python nos espera dar nuevas instrucciones, las cuales son ejecutadas si la condición `3 > 2` torna a ser verdadera (o `True` para ese caso). Intentemos imprimir en Python "¡Funciona!". Cambia el código de tu archivo **python_intro.py** a esto:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

¿Notas cómo estamos indentando la siguiente línea de código con 4 espacios? Nosotros necesitamos hacer ésto para que Python comprenda que el código se ejecuta si el resultado es verdadero. Tú puedes hacer un espacio, pero prácticamente todos los programadores en Python hacen 4 espacios para hacer el código más legible. Un simple tabulador también contará como 4 espacios tan largos como tu editor de texto esté configurado. Cuando tú haces tu elección, ¡no la cambies! Si tu ya identaste con 4 espacios, sigue haciendo futuras identaciones con 4 espacios también, de otra forma, tú puedes correr con problemas.

Guárdalo y ejecútalo de nuevo:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
It works!
```

Nota: Recuerda que en Windows, 'python3' no es reconocido como un comando. Desde ahora, reemplaza 'python3' con 'python' para ejecutar el archivo.

### ¿Qué pasa si una condición no es verdadera?

En previos ejemplos, el código fue ejecutado solamente cuando las condiciones eran Verdaderas. Pero Python también tiene sentencias `elif` y `else`:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

Cuando ésto se ejecuta, imprimirá:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    5 is indeed greater than 2
    

Si 2 era mayor que el número 5, entonces el segundo comando sería ejecutado. Veamos cómo `elif` funciona:

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

y ejecuta:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hey Sonja!
    

¿Ves qué sucedió allí? `elif` te deja añadir condiciones adicionales que se ejecutan si las condiciones previas fallan.

Tú puedes añadir tantas sentencias `elif` como quieras, luego de tu sentencia inicial `if`. Por ejemplo:

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

Python corre a través de cada prueba secuencialmente e imprime:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Perfect, I can hear all the details
    

## Comentarios

Los comentarios son líneas que comienzan con `#`. Tú puedes escribir lo que quieras luego de el `#` y Python lo ignorará. Los comentarios pueden hacer que el código sea más fácil de entender para otras personas.

Veamos cómo luce:

{% filename %}python_intro.py{% endfilename %}

```python
# Cambiar el volumen si esta muy alto o muy bajo
if volume < 20 or volume > 80:
    volume = 50
    print("Mucho mejor!")
```

Tú no necesitas escribir un comentario para cada línea de código, pero ellos son útiles para explicar qué está haciendo el código, o proveer un resumen cuando se está haciendo algo complejo.

### Resumen

En los últimos ejercicios tú aprendiste acerca de:

- **Comparar cosas** - en Python puedes comparar cosas haciendo uso de `>`, `>=`, `==`, `<=`, `<` y de los operatores `and` y `or`
- **Boolean** - un tipo de objeto que sólo puede tener uno de dos valores: `True` o `False`
- **Guardar archivos** - almacenar código en archivos para que puedas ejecutar programas más grandes.
- **if... elif... else** - sentencias que te permiten ejecutar código sólo cuando se cumplen ciertas condiciones.
- **comentarios** - líneas que Python no ejecutará que permiten documentar el código

¡Es tiempo para leer la última parte de éste capítulo!

## ¡Tus propias funciones!

> Para lectores en casa: este capítulo está cubierto en el video [Bases de Python: Funciones](https://www.youtube.com/watch?v=5owr-6suOl0).

¿Recuerdas las funciones como `len()` que puedes ejecutar en Python? Bien, buenas noticias - ¡tú aprenderás cómo escribir tus propias funciones ahora!

Una función es una secuencia de instrucciones que Python debería ejecutar. Cada función en Python inicia con la palabra clave `def`, el nombre es dado, y puede tener algunos parámetros. Veamos. Reemplaza el código en **python_intro.py** con lo siguiente:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

Okay, ¡nuestra primera función está lista!

Tú puedes preguntar por qué hemos escrito el nombre de la función en la parte inferior de el archivo. Cuando escribimos `def hi():` y las líneas indentadas que siguen, estamos escribiendo instrucciones que la función `hi()` debe hacer. Python leerá y recordará estas instrucciones, pero no ejecutará la función todavía. Para decirle a Python que queremos ejecutar la función, tenemos que llamar a la función con `hi()`. Python lee el archivo y lo ejecuta desde arriba hacia abajo, así que tenemos que definir la función en el archivo antes de llamarla.

Ejecuta ésto ahora y ve qué sucede:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi there!
    How are you?
    

Nota: si ésto no funciona, ¡Tranquil@! La salida te ayudará a entender por qué:

- Si te sale `NameError`, probablemente significa que escribiste algo mal, así que deberias comprobar si utilizaste el mismo nombre para crear la función con `def hi():` y al llamarla con `hi()`.
- Si te sale un `IndentationError`, comprueba que las líneas del `print` tienen el mismo espacio en blanco al comienzo de línea: python requiere que todo el código dentro de la función esté perfectamente alineado.
- Si no hay ninguna salida, comprueba que el último `hi()` *no esté* identado - si lo está, esa línea también sera parte de la función, y nunca se ejecutará.

Construyamos nuestra primera función con parámetros. Cambiarémos el ejemplo anterior - una función que dice 'hola' para la persona que lo ejecuta - con un nombre:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
```

Como puedes ver, ahora le dimos a nuestra función un parámetro que llamamos `nombre`:

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

Recuerda: La función `print` está indentada con 4 espacios en la sentencia `if`. Esto es porque la función se ejecuta cuando la condición es conocida. Veamos cómo funciona ahora:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

Oops, un error. Por suerte, Python nos da un útil y agradable mensaje de error. Este nos dice que la función `hi()` (que definimos) tiene un argumento requerido (llamado `nombre`) y que olvidamos pasarlo cuando llamamos a la función. Configuremos esto en la parte inferior del archivo:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

Y ejecutemos otra vés:

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
    

Ahora, ¿Qué piensas que sucederá si escribes otro nombre allí? (No Ola o Sonja.) Intenta y ve si estás en lo correcto. Debería imprimir esto:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

Esto es sorprendente, ¿Verdad? De esta manera tú no tienes que repetir la función cada vez que cambies el nombre de la persona que está supuesta a recibir. Y eso es exactamente por qué necesitamos funciones - ¡tú nunca quieres repetir tú código!

Hacer algo más inteligente - hay más nombres que dos, y escribir una condición para cada uno sería difícil, ¿Verdad? Reemplaza el contenido de tu archivo con lo siguiente:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

Llamarémos al código ahora:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    

¡Felicidades! ¡Ya aprendíste a cómo escribir funciones! :)

## Bucles

> Para lectores en casa: este capítulo está cubierto en el video [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0).

Listo ésta es la última parte. Eso fue rápido, ¿verdad? :)

Los programadores no les gusta repetir. Programar es todo acerca de automatizar cosas, así que no queremos recibir a cada persona por su nombre manualmente, ¿verdad? Allí es dónde los ciclos vienen a manejarse.

¿Aún recuerdas las listas? Hagamos una lista de niñas:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

Queremos recibir a todos ellos con sus nombres. Tenemos la función `hola` para hacerlo, así que usémosla en un ciclo:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

La sentencia `for` se comporta parecido a una sentencia `if`; ambos códigos necesitan ser indentados por 4 espacios.

Aquí está completo el código que estará en el archivo:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

Y cuando lo ejecutemos:

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
    

Como puedes ver, todo lo que coloques dentro de una sentencia `for` con una indentación, será repetida para cada elemento de la lista `girls`.

Tu puedes también usar `for` con números usando la función `range`:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

El cuál imprimirá:

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

`range` es una función que crea una lista de números en serie (estos números son proporcionados por ti como parámetros).

Nota que el segundo de estos números no está incluido en la lista que regresa Python (es decir, `range(1, 6)` cuenta desde 1 a 5, pero no incluye el número 6). Esto es porque "range" está medio-abierto, y por eso se incluye el primer valor, pero no el último.

## Resumen

Eso es todo. **¡Tú rockeas totalmente!** Esto fue un capítulo difícil, así que deberías sentirte orgullos@ de ti. ¡Estamos definitivamente encantados de que hayas llegado tan lejos!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers! :)

Tu podrías querer un momento para algo - estirarte, caminar cerca, descansar tus ojos - antes de avanzar a un próximo capítulo. :)

![Pastelillo](images/cupcake.png)