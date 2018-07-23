{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# Introdução ao Python

> Parte deste capítulo é baseado no tutorial da Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Vamos escrever um pouco de código!

## Interpretador Python

> Para os leitores em casa: essa parte é abrangida no [ Básico do Python: Vídeo Números inteiros, Sequências, Listas e Erros ](https://www.youtube.com/watch?v=MO63L4s-20U).

Para começar a trabalhar com Python, nós precisamos abrir uma * linha de comando* no seu computador. Você provavelmente já sabe como fazer isso - aprendeu no capítulo [ Introdução à Linha de Comando ](../intro_to_command_line/README.md).

Assim que estiver pronto, siga as instruções abaixo.

Queremos abrir um console do Python, então digite `python` no Windows ou `python3` no Mac OS/Linux e pressione `enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Digite "ajuda", "direitos autorais", ou "licença" para mais informações.
    >>>
    

## Seu primeiro comando Python!

Depois de executar o comando Python, o prompt mudou para `>>>`. Para nós, isso significa que por enquanto só podemos utilizar comandos na linguagem Python. Você não precisa digitar `>>>` - o Python fará isso por você.

Se você deseja sair do console do Python a qualquer momento, apenas digite `exit()` ou use o atalho `Ctrl + Z` no Windows e `Ctrl + D` no Mac ou Linux. Então você não vai mais ver o `>>>`.

Por enquanto, não queremos sair do console de Python. Queremos saber mais sobre isso. Vamos começar digitando um pouco de matemática, como `2 + 3`, e clicar `entrar`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

Legal! Viu como a resposta apareceu? O Python sabe matemática! Você pode tentar outros comandos como:

- `4 * 5`
- `5 - 1`
- `40 / 2`

Para executar cálculo exponencial, como 2 elevado a 3, digitamos: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

Divirta-se com isso por um tempo e depois volte aqui. :)

Como você pode ver, o Python é uma ótima calculadora. Se você está se perguntando o que mais você pode fazer…

## Strings

Que tal o seu nome? Digite seu primeiro nome entre aspas, desse jeito:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

Você acabou de criar sua primeira string! String é um sequência de caracteres que podem ser processada pelo computador. A string deve sempre começar e terminar com o mesmo caractere. Este caractere pode ser aspas duplas (`'`) ou simples (`"`) (não há nenhuma diferença!). Elas dizem ao Python que o que está entre elas é uma string.

Strings podem ser juntadas. Tente isto:

{% filename %}command-line{% endfilename %}

```python
>>> "Oi " + "Ola"
'Oi Ola'
```

(Ola é o nome das duas criadoras do Django Girls!) Você também pode multiplicar strings por um número:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

Se você precisa colocar uma apóstrofe dentro de sua string, pode fazê-lo de duas maneiras.

Usando aspas duplas:

{% filename %}command-line{% endfilename %}

```python
>>> "Roda d'água" 
"Roda d'água"
```

Ou escapando a aspa simples (o que sinaliza para o Python que aquele sinal é uma apóstrofe, e não uma aspa marcando o final da nossa string) com uma contra-barra (``):

{% filename %}command-line{% endfilename %}

```python
>>> "Roda d\'água" 
"Roda d'água"
```

Legal, hein? Para ver seu nome em letras maiúsculas, basta digitar:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

Você acabou de usar a **função** `upper` na sua string! Uma função (como `upper()`) é um conjunto de instruções que o Python tem que realizar em um determinado objeto (`"Ola"`) quando você a chamar.

Se você quer saber o número de letras contidas em seu nome, há uma **função** para isso também!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

Se perguntando porque algumas vezes você chama funções com um `.` depois de uma string (como `"Ola".upper()`) e algumas vezes você primeiro chama a função e coloca a string entre parênteses? Bem, em alguns casos, funções pertencem a objetos, como `upper()`, que só pode ser utilizada em strings. Nesse caso, nós chamamos a função de **método**. Outras vezes, funções não pertencem a nada específico e podem ser usadas em diferentes tipos de objetos, assim como `len()`. É por isso que nós estamos fornecendo `"Ola"` como um parâmetro para a função `len`.

### Sumário

OK, chega de strings. Até agora você aprendeu sobre:

- **o prompt** -- digitar comandos (códigos) no interpretador Python resulta em respostas em Python
- **números e strings** -- no Python, números são usados para matemática e strings, para objetos de texto
- **operadores** - como + e * combinam valores para produzir um novo valor
- **funções** - como upper() e len() executam ações nos objetos.

Esso é o básico de todas as linguagens de programação que você aprender. Pronto para algo mais difícil? Apostamos que sim!

## Erros

Vamos tentar algo novo. Será que conseguimos saber a extensão de um número da mesma forma que descobrimos a de nossos nomes? Digite `len(304023)` e clique `enter`:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Temos nosso primeiro erro! O ícone {{ warning_icon }} é a forma que o Pyhton tem para te avisar que o código que você está prestes a executar não vai funcionar conforme o esperado. Cometer erros (inclusive intencionalmente) é uma parte importante da aprendizamgem!

Nossa primeira mensagem de erro nos diz que objetos do tipo "int" (inteiros, natuairs) não têm comprimento algum. Então o que podemos fazer agora? Podemos escrever nosso número como string? Strings têm comprimento, certo?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Funcionou! Usamos a função `str` dentro da função `len`. A função `str ()` converte tudo para strings.

- A função `str` converte as coisas em **strings**
- A função `int` converte as coisas em **números inteiros**

> Importante: podemos converter números em texto, mas nem sempre é possível converter texto em números -- o que `int('hello')` quer dizer?

## Variáveis

Variáveis são um conceito importante em programação. Uma variável é apenas um nome que você atribui a alguma coisa de tal forma que possa usá-lo mais tarde. Os programadores usam essas variáveis para armazenar dados, para tornar seus códigos mais legíveis e para não ter que se lembrar a todo momento o que são certas coisas.

Digamos que queremos criar uma nova variável chamada `nome`:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

Digitamos nome igual Ola.

Como você deve ter percebido, a última linha de código não retornou nada como nos exemplos anteriores. Então como vamos saber se a variável realmente existe? Basta digitar `name` e clicar `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> name
'Ola'
```

Uhuuu! Sua primeira variável! :) Você sempre pode mudar o seu valor:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Sonja"
>>> name
'Sonja'
```

Você pode usá-la também em funções:

{% filename %}command-line{% endfilename %}

```python
>>> len(name)
5
```

Incrível, não? Claro, variáveis podem ser qualquer coisa, então podem ser números também! Tente isso:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

E se digitarmos o nome errado? Você consegue imaginar o que aconteceria? Vamos tentar!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

Um erro! Como você pode ver, o Python tem diferentes tipos de erros e este é chamado **NameError**. O Python mostrará esta mensagem de erro se você tentar usar uma variável que ainda não foi definida. Se você encontrar esse erro mais tarde, confira no seu código se você não digitou errado o nome de uma variável.

Brinque com isso por um tempo e veja o que você consegue fazer!

## A função print

Tente o seguinte:

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

Quando você digita `name`, o interpretador de Python responde com a *representação* da variável 'name' na forma de string, que é sequência de letras M-a-r-i-a, entre aspas simples. Quando você diz para o Python `print(name)`, ele vai "imprimir" o conteúdo da variável na tela sem as aspas, o que é mais bonitinho. :)

Como veremos mais tarde, `print()` também é útil quando queremos imprimir algo dentro de funções ou quando queremos imprimir algo em várias linhas.

## Listas

Além de strings e números inteiros, o Python tem muitos tipos diferentes de objetos. Agora vamos apresentar um chamado **lista**. Listas são exatamente o que você imagina: objetos que são listas de outros objetos. :)

Vá em frente e crie uma lista:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Sim, esta é uma lista vazia. Não é muito útil, né? Vamos criar uma lista de números de loteria. Para não precisar repetir o código o tempo todo, vamos atribuí-la a uma variável:

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

Legal, criamos uma lista! O que podemos fazer com ela? Vamos ver quantos números de loteria ela tem. Você tem ideia de qual é a função que deve usar para isso? Você já aprendeu ;)

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery)
6
```

Sim! `len()` pode te dizer o número de objetos que fazem parte de uma lista. Uma mão na roda, né? Agora vamos organizá-los:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

Isso não retorna nada, apenas troca a ordem em que os números aparecem na lista. Vamos imprimir a lista outra vez e ver o que acontece:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

Como você pode ver, agora os números na nossa lista estão ordenados do menor para o maior. Parabéns!

E se quisermos inverter essa ordem? Vamos fazer isso!

{% filename %}command-line{% endfilename %}

```python
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

Moleza né? Se você quiser adicionar alguma coisa à sua lista, você pode fazer isto digitando o seguinte comando:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

Se você quiser ver apenas o primeiro número da lista, pode usar **índices**. Um índice é o número que diz onde na lista um item está. Programadores preferem começar a contar a partir do zero, então o primeiro objeto em sua lista está no índice 0, o segundo no 1 e assim por diante. Try this:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

Como você pode ver, você pode acessar diferentes objetos na sua lista usando o nome da lista e o índice do objeto entre colchetes.

Para apagar algum objeto da sua lista, você precisa usar **índices**, como aprendemos acima, e o método `pop()`. Vamos usar um exemplo para reforçar o que aprendemos antes: vamos deletar o primeiro número de nossa lista.

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

Funcionou perfeitamente!

Agora tente alguns outros índices, como: 6, 7, 1000, -1, -6 ou -1000. Veja se você consegue prever o resultado antes de executar o comando. Os resultados fazem sentido para você?

Você pode encontrar uma lista de todos os métodos disponíveis neste capítulo na documentação do Python: https://docs.python.org/3/tutorial/datastructures.html

## Dicionários

> Para leitoras em casa: este capítulo é abordado no vídeo [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c).

Um dicionário é similar a uma lista, mas para acessar seus valores você usa uma chave ao invés de um índice. Uma chave pode ser qualquer string ou número. A sintaxe para definir um dicionário vazio é:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

Você acabou de criar um dicionário vazio. Uhuuu!

Agora tente escrever o seguinte comando (tente substituir com as suas próprias informações também):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

Com esse comando, você criou uma variável chamada `participant` com três pares de chave-valor:

- A chave `nome` aponta para o valor `'Ola'` (um objeto `string`),
- a chave `pais` aponta para `'Polonia'` (outra `string`),
- e a chave `favorite_numbers` aponta para `[7, 42, 92]` (uma `list` com três números nela).

Você pode verificar o conteúdo de chaves individuais com a sintaxe:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

É similar a uma lista, mas você não precisa lembrar o índice - apenas o nome.

O que acontece se perguntarmos ao Python qual é o valor de uma chave que não existe? Você consegue adivinhar? Vamos tentar e descobrir!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

Olha, outro erro! Esse é um **KeyError**. O Python é bastante prestativo e te diz que a chave `'age'` não existe no nesse dicionário.

Você deve estar se perguntando quando deve usar um dicionário ou uma lista, certo? Boa pergunta! A resposta rápida é:

- Você precisa de uma sequência ordenada de itens? Use uma lista.
- Você precisa associar valores com chaves para poder procurá-los eficientemente (pela chave) mais tarde? Use um dicionário.

Dicionários, assim como listas, são *mutáveis*. Isso significa que eles podem ser alterados depois de criados. Você pode adicionar um novo par chave-valor a um dicionário depois de ele ser criado, por exemplo:

{% filename %}command-line{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

Como nas listas, usando a função `len()` em dicionários retorna o número de pares chave-valor contidos nele. Vá em frente e digite o comando:

{% filename %}command-line{% endfilename %}

```python
>>> len(participant)
4
```

Espero que esteja fazendo sentido até agora. :) Pronta para mais diversão com dicionários? Pule para a próxima linha para coisas incríveis.

Você pode usar o método `pop()` para deletar um item do dicionário. Digamos que você queira excluir a entrada correspondente à chave `'favorite_numbers'`. Basta digitar o seguinte comando:

{% filename %}command-line{% endfilename %}

```python
>>> participant.pop('favorite_numbers')
[7, 42, 92]
>>> participant
{'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
```

Como você pode ver no resultado, o par chave-valor correspondente à chave 'favorite_numbers' foi excluído.

Além disso, você pode mudar o valor associado a uma chave já criada no dicionário. Digite:

{% filename %}command-line{% endfilename %}

```python
>>> participant['country'] = 'Germany'
>>> participant
{'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
```

Como você pode ver, o valor da chave `'country'` foi alterado de `'Poland'` para `'Germany'`. :) Emocionante? Uhu! Você acabou de aprender outra coisa incrível.

### Sumário

Incrível! Agora você sabe muito sobre programação. Nesta última parte você aprendeu sobre:

- **erros** -- agora você sabe como ler e entender mensagens de erro que aparecem quando o Python não entende um comando que você deu
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

Excited for the next part? :)

## Compare coisas

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

Do you wonder why we put two equal signs `==` next to each other to compare if numbers are equal? We use a single `=` for assigning values to variables. You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. We can also state that things are unequal to each other. For that, we use the symbol `!=`, as shown in the example above.

Give Python two more tasks:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

We've seen `>` and `<`, but what do `>=` and `<=` mean? Read them like this:

- x `>` y significa: x é maior que y
- x `<` y significa: x é menor que y
- x `< =` y significa: x é menor ou igual a y
- x `>=` y significa: x é maior ou igual a y

Awesome! Wanna do one more? Try this:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

You can give Python as many numbers to compare as you want, and it will give you an answer! Pretty smart, right?

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

Have you heard of the expression "comparing apples to oranges"? Let's try the Python equivalent:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Here you see that just like in the expression, Python is not able to compare a number (`int`) and a string (`str`). Instead, it shows a **TypeError** and tells us the two types can't be compared together.

## Booleano

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

Booleans can be variables, too! See here:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

You can also do it this way:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Practice and have fun with Booleans by trying to run the following commands:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Congrats! Booleans are one of the coolest features in programming, and you just learned how to use them!

# Salvá-lo!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

So far we've been writing all our python code in the interpreter, which limits us to entering one line of code at a time. Normal programs are saved in files and executed by our programming language **interpreter** or **compiler**. So far we've been running our programs one line at a time in the Python **interpreter**. We're going to need more than one line of code for the next few tasks, so we'll quickly need to:

- Saída do interpretador Python
- Abra o editor de código de sua escolha
- Salvar algum código em um novo arquivo de python
- Executá-lo!

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

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. Isso é chamado de destaque de sintaxe ("syntax highlightning", do Inglês) e é uma funcionalidade muito útil para usar quando estamos escrevendo código. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). Esta é uma das razões pelas quais que nós usamos um editor de código. :)

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

### E se uma condição não for verdadeira?

In previous examples, code was executed only when the conditions were True. But Python also has `elif` and `else` statements:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 e maior que 2')
else:
    print('5 nao e maior do que 2')
```

When this is run it will print out:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    5 é de fato maior que 2
    

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
    print("My ears are hurting! :(")
```

Python runs through each test in sequence and prints:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Perfeito, posso ouvir todos os detalhes
    

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

### Sumário

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

Time for the last part of this chapter!

## Suas próprias funções!

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

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

- If you get a `NameError`, that probably means you typed something wrong, so you should check that you used the same name when creating the function with `def hi():` and when calling it with `hi()`.
- If you get an `IndentationError`, check that both of the `print` lines have the same whitespace at the start of a line: python wants all the code inside the function to be neatly aligned.
- If there's no output at all, check that the last `hi()` *isn't* indented - if it is, that line will become part of the function too, and it will never get run.

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
    

Oops, um erro. Felizmente, Python nos fornece uma mensagem de erro bastante útil. Ela diz que a função `hi()` (aquela que declaramos) tem um argumento obrigatório (chamado `name`) e que nós esquecemos de passá-lo ao chamar a função. Let's fix it at the bottom of the file:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

E rode novamente:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

E se mudarmos o nome?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

E rode novamente:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

Agora, o que você acha que aconteceria se você escrevesse um outro nome lá (que não seja "Ola" ou "Sonja")? Faça um teste e verifique se você estava certo. Ele deve imprimir o seguinte:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

Isto é incrível, não? Dessa maneira você não precisa se repetir cada vez que for mudar o nome da pessoa que a função pretende cumprimentar. And that's exactly why we need functions – you never want to repeat your code!

Vamos fazer algo mais inteligente -- existem mais que dois nomes e escrever uma condição para cada um seria difícil, certo?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

Vamos chamar o código agora:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    

Parabéns! Você acabou de aprender como criar funções. :)

## Laços

> Para leitores em casa: este capítulo é coberto no vídeo [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0).

Essa já é a última parte! Rápido, né? :)

Programadores não gostam de repetir código. Programar é automatizar coisas, então não queremos cumprimentar a cada pessoa manualmente, certo? É aí que entram os laços (ou "loops", em Inglês).

Ainda se lembra de listas? Vamos fazer uma lista de garotas:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

Queremos cumprimentar todas elas pelos seus nomes. Temos a função `hi` para fazer isso, então vamos usá-la em um laço:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

A instrução `for` se comporta de maneira similar ao `if`; o código abaixo de qualquer uma destas instrução deve ser endentado com quatro espaços.

Aqui está o código completo que será salvo no arquivo:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

E quando rodamos:

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
    

Como você pode ver, tudo o que você vai colocar dentro de uma instrução `for` com espaço será repetido para cada elemento da lista `girls`.

You can also use `for` on numbers using the `range` function:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

Que iria imprimir:

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

`range` é uma função que cria uma lista de números que se seguem um após o outro (esses números são dados por você como parâmetros).

Note que o segundo desses dois números não está incluído na lista que o Python mostrou (em `range(1, 6)`, conta de 1 a 5, mas o 6 não é incluído). Isso porque o intervalo é semi-aberto, o que significa que ele inclui o primeiro valor, mas não o último.

## Sumário

É isso. **Você mandou muito bem!** Esse foi um capítulo difícil, então você deve estar orgulhosa. Nós estamos orgulhosas de você por ter conseguido ir tão longe!

Para um tutorial de Python oficial e completo, visite https://docs.python.org/3/tutorial/. Isto te dará um guia da linguagem mais exaustivo e completo. Até lá :)

Talvez você queira brevemente fazer algo mais -- espreguiçar, andar um pouco, descansar os olhos -- antes de ir para o próximo capítulo. :)

![Cupcake](images/cupcake.png)