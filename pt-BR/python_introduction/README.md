# Introdução ao Python

> Parte deste capítulo é baseado no tutorial da Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Vamos escrever um pouco de código!

## Interpretador Python

> Para os leitores em casa: essa parte é abrangida no [ Básico do Python: Vídeo Números inteiros, Sequências, Listas e Erros ](https://www.youtube.com/watch?v=MO63L4s-20U).

Para começar a brincar com Python nós precisamos abrir uma *linha de comando* no seu computador. You should already know how to do that – you learned it in the [Intro to Command Line](../intro_to_command_line/README.md) chapter.

Assim que estiver pronto, siga as instruções abaixo.

Queremos abrir um console do Python, então digite`python` no Windows ou `python3`no Mac OS/Linux e pressione`enter`.

{% filename %}linha de comando{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Digite "ajuda", "direitos autorais", ou "licença" para mais informações.
    >>>
    

## Seu primeiro comando Python!

Depois de executar o comando Python, o prompt mudou para `>>>`. Para nós, isso significa que por enquanto só utilizaremos comandos na linguagem Python. You don't have to type in `>>>` – Python will do that for you.

Se você deseja sair do console do Python, apenas digite `exit()` ou use o atalho `Ctrl + Z` no Windows e `Ctrl + D` no Mac/Linux. Então você não vai ver mais o `>>>`.

For now, we don't want to exit the Python console. We want to learn more about it. Let's start by typing some math, like `2 + 3` and hitting `enter`.

{% filename %}linha de comando{% endfilename %}

```python
>>> 2 + 3
5
```

Legal! Viu como a resposta apareceu? Python sabe matemática! Você pode tentar outros comandos como:

- `4 * 5`
- `5 - 1`
- `40 / 2`

Para executar cálculo exponencial, diga 2 à potência 3, digitamos: {% filename %}linha de comando{% endfilename %}

```python
>>> 2 ** 3
8
```

Divirta-se com isso por um tempo e depois volte aqui. :)

Como vê, o Python é uma ótima calculadora. Se está se perguntando o que mais pode fazer…

## Strings

Que tal o seu nome? Digite seu primeiro nome entre aspas, desse jeito:

{% filename %}linha de comando{% endfilename %}

```python
>>> "Ola"
'Ola'
```

Você acabou de criar sua primeira string! String é um sequência de caracteres que podem ser processada pelo computador. A string sempre precisa iniciar e terminar com o mesmo caractere. Ela pode ser aspa simples (`'`) ou dupla (`"`) (não há nenhuma diferença!) As aspas dizem ao Python que o que está dentro delas é uma string, ou sequência de caracteres.

Strings podem ser juntadas. Tente isto:

{% filename %}command-line{% endfilename %}

```python
>>> "Oi " + "Ola"
'Oi Ola'
```

Você também pode multiplicar strings por um número:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

Se você precisa colocar uma apóstrofe dentro de sua string, existem duas maneiras de fazer.

Usando aspas duplas:

{% filename %}command-line{% endfilename %}

```python
>>> "Correndo' ladeira abaixo" 
"Correndo' ladeira abaixo"
```

ou escapando a aspa simples (fazendo com que o Python entenda que ela não é o final da nossa string) com uma contra-barra (``):

{% filename %}command-line{% endfilename %}

```python
>>> "Correndo\' ladeira abaixo" 
"Correndo' ladeira abaixo"
```

Legal, hein? Para ver seu nome em letras maiúsculas, basta digitar:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

Você acabou de usar a **função** `upper` na sua string! Uma função (como `upper()`) é um conjunto de instruções que o Python tem que realizar em um determinado objeto (`"Ola"`) quando você chamar por ele.

Se você quer saber o número de letras contidas em seu nome, há uma **função** para isso também!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

Se perguntando porque algumas vezes você chama funções com um `.` no fim de uma string (como `"Ola".upper()`) e algumas vezes você primeiro chama a função colocando a string nos parênteses? Bem, em alguns casos, funções pertencem a objetos, como `upper()`, que só pode ser utilizada em strings. Nesse caso, nós chamamos a função de **método**. Outras vezes, funções não pertencem a nada específico e podem ser usadas em diferentes tipos de objetos, assim como `len()`. É por isso que nós estamos fornecendo `"Ola"` como um parâmetro para a função `len`.

### Sumário

OK, chega de strings. Até agora você aprendeu sobre:

- **the prompt** – typing commands (code) into the Python prompt results in answers in Python
- **numbers and strings** – in Python numbers are used for math and strings for text objects
- **operators** – like `+` and `*`, combine values to produce a new one
- **functions** – like `upper()` and `len()`, perform actions on objects.

Isso é o básico sobre todas as linguagens de programação que você aprende. Pronto para algo mais difícil? Apostamos que sim!

## Erros

Vamos tentar algo novo. Será que conseguimos ver o tamanho de um número da mesma forma que nós encontramos o tamanho de nosso nome? Digite `len(304023)` e aperte `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Temos nosso primeiro erro! Ele diz que objetos do tipo "int" (inteiros, apenas números) não têm nenhum comprimento. Então o que podemos fazer agora? Talvez possamos escrever nosso número como uma string? Strings têm um comprimento, certo?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Funcionou! Usamos a função `str` dentro da função `len`. `str ()` converte tudo para strings.

- A função `str` converte as coisas em **strings**
- A função `int` converte as coisas em **números inteiros**

> Important: we can convert numbers into text, but we can't necessarily convert text into numbers – what would `int('hello')` be anyway?

## Variáveis

Um conceito importante na programação é o conceito de variáveis. Uma variável não é nada mais do que um nome para alguma coisa, de tal forma que você possa usá-la mais tarde. Os programadores usam essas variáveis para guardar dados, para fazer seus códigos mais legíveis e para não ter que se lembrar sempre o que algumas coisas significam.

Digamos que queremos criar uma nova variável chamada `nome`:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

We type name equals Ola.

Como você deve ter percebido, a última linha não nos retornou algo como nas anteriores. Assim, como vamos saber se a variável realmente existe? Basta digitar `name` e apertar `enter`:

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

Você pode usá-la também em funções:

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

Mas, e se digitarmos o nome errado? Você consegue adivinhar o que aconteceria? Vamos tentar!

{% filename %}command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

Um erro! Como você pode ver, Python tem diferentes tipos de erros e este é chamado **NameError**. Python dará este erro se você tentar usar uma variável que não foi definida ainda. Se você encontrar esse erro depois, veja se no seu código se você não digitou o nome de uma variável errado.

Brinque com isso por um tempo e veja o que você consegue fazer!

## A função print

Tente isso:

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

Quando você apenas digita `name`, o interpretador Python responde com a *representação* como string da variável 'name', que são as letras M-a-r-i-a, entre aspas simples. Quando você diz `print(name)`, Python vai "imprimir" o conteúdo da variável na tela, sem as aspas, o que é mais puro.

Como veremos mais tarde, `print()` também é útil quando queremos imprimir algo dentro de funções, ou quando queremos imprimir algo em várias linhas.

## Listas

Além de strings e inteiros, o Python tem todos os tipos diferentes de objetos. Vamos apresentar um chamado **lista**. Listas são exatamente o que você pensa que elas são: objetos que são listas de outros objetos. :)

Vá em frente e crie uma lista:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Sim, esta é uma lista vazia. Não é muito, não é? Vamos criar uma lista dos números da loteria. Como não queremos ficar repetindo o código todo o tempo vamos criar uma variável para ela:

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

Tudo certo, nós temos uma lista! O que podemos fazer com isso? Vamos ver quantos números de loteria existem nesta lista. Você tem ideia de qual função deve usar para isso? Você já sabe disso!

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery)
6
```

Sim! `len()` pode te dar o número de objetos que fazem parte de uma lista. Uma mão na roda, não? Vamos organizar isso agora:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

Isso não retorna nada, apenas troca a ordem em que os números aparecem na lista. Vamos imprimir isso outra vez e ver o que acontece:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

Como você pode ver, os números na nossa lista estão ordenados do menor para o maior. Parabéns!

Talvez a gente queira inverter essa ordem? Vamos fazer isso!

{% filename %}command-line{% endfilename %}

```python
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

If you want to add something to your list, you can do this by typing this command:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

Se você quiser mostrar apenas o primeiro número você pode usar **indices**. Um índice é um número que diz onde um item da lista está. Programadores preferem começar a contar a partir do zero, então o primeiro objeto em sua lista está no índice 0, o segundo no 1 e assim por diante. Tente isso:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

Como você pode ver, você pode acessar diferentes objetos na sua lista usando o nome da lista e o índice do objeto dentro dos colchetes.

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

Funcionou perfeitamente!

Agora tente alguns outros índices, como: 6, 7, 1000, -1, -6 ou -1000. Veja se você consegue prever o resultado antes de executar o comando. Os resultados fazem sentido para você?

Você pode encontrar uma lista de todos os métodos disponíveis neste capítulo na documentação do Python: https://docs.python.org/3/tutorial/datastructures.html

## Dicionários

> For readers at home: this part is covered in the [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) video.

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

Isso mostra que você acabou de criar um dicionário vazio. Hurra!

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- A chave `nome` aponta para o valor `'Ola'` (um objeto `string`),
- `pais` aponta para `'Polonia'` (outra `string`),
- e `numeros_favoritos` apontam para `[7, 42, 92]` (uma `list` com três números nela).

Você pode verificar o conteúdo de chaves individuais com a sintaxe:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

See, it's similar to a list. But you don't need to remember the index – just the name.

O que acontece se pedirmos ao Python o valor de uma chave que não existe? Você consegue adivinhar? Vamos tentar e descobrir!

{% filename %}command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

Olha, outro erro! Esse é um **KeyError**. Python é bastante prestativo e te diz que a chave `'age'` não existe no nesse dicionário.

Você deve estar se perguntando quando deveria usar um dicionário ou uma lista, certo? Boa pergunta! A resposta rápida é:

- Você precisa de uma sequência ordenada de itens? Use uma list.
- Você precisa associar valores com chaves, assim você pode procurá-los eficientemente (pela chave) mais tarde? Use um dictionary.

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

You can use the `pop()` method to delete an item in the dictionary. Digamos, se você quer excluir a entrada correspondente a chave `'favorite_numbers'`, basta digitar o seguinte comando:

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

### Sumário

Incrível! Agora você sabe muito sobre programação. Nesta última parte você aprendeu sobre:

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

Empolgado(a) para o próximo passo? :)

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

Você deve estar se perguntando por que colocamos dois sinais de igual `==` lado a lado para comparar se os números são iguais? Nós usamos um único `=` para atribuir valores a variáveis. You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. Também é possível afirmar que as coisas são diferentes. Para isso, usamos o símbolo `! =`, conforme mostrado no exemplo acima.

Dê ao Python mais duas tarefas:

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

Fantástico! Quer mais? Tente isto:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

Você pode dar ao Python quantos números para comparar quanto você quiser, e ele vai te dar uma resposta! Espertinho, certo?

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

Já ouviu a expressão "comparar maçãs com laranjas"? Vamos tentar o equivalente em Python:

{% filename %}command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Aqui vemos que assim como na expressão, Python não é capaz de comparar um número (`int`) e uma string (`str`). Em vez disso, ele mostrou um **TypeError** e nos disse que os dois tipos não podem ser comparados juntos.

## Booleano

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

Booleanos podem ser variáveis também! Veja:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

Você também pode fazer desse jeito:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Pratique e divirta-se com os valores booleanos, tentando executar os seguintes comandos:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Parabéns! Booleanos são um dos recursos mais interessantes na programação, e você acabou de aprender como usá-los!

# Salvá-lo!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

Até agora escrevemos todos os códigos no interpretador Python, que nos limita a digitar uma linha por vez. Programas normais são salvos em arquivos e executados pelo nosso **interpretador** de linguagem de programação ou **compilador**. Até agora já corremos nossos programas de uma linha de cada vez no **interpretador** Python. Nós vamos precisar de mais de uma linha de código para as próximas tarefas, então precisaremos rapidamente:

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

Isso vai colocá-lo de volta no prompt de comando.

Anteriormente, nós escolhemos um editor de código da seção do [editor de código](../code_editor/README.md). Nós precisamos abrir o editor agora e escrever algum código em um novo arquivo:

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Agora você é um desenvolvedor Python bastante experiente, então sinta-se livre para escrever códigos com o que você aprendeu hoje.

Agora temos de salvar o arquivo e dar a ele um nome descritivo. Vamos chamar o arquivo **python_intro.py** e salvá-lo na sua área de trabalho. Nós podemos nomear esse arquivo do jeito que quisermos, mas é importante que ele termine com **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. Isso é chamado de destaque de sintaxe ("syntax highlightning", do Inglês) e é uma funcionalidade muito útil para usar quando estamos escrevendo código. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). Esta é uma das razões pelas quais que nós usamos um editor de código. :)

Com o arquivo salvo, é hora de executá-lo! Usando as habilidades que você aprendeu na seção de linha de comando, use o terminal para **alterar os diretórios** para o desktop.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Em um Mac, o comando será parecido com isto:

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

Se você não conseguir é só pedir ajuda.

Agora use o interpretador Python para executar o código que está dentro do arquivo, assim:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Muito bom! Você acabou de rodar o seu primeiro programa Python que foi salvo a um arquivo. Sente-se incrível?

Você pode agora passar para uma ferramenta essencial na programação:

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

Troque o código no arquivo **python_intro.py** para isso:

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
    

O Python espera que lhe demos instruções que devem ser executadas caso a condição `3 > 2` seja verdadeira (ou `True`). Vamos tentar fazer o Python imprimir "Funciona!”. Altere o seu código no seu arquivo **python_intro.py** para isto:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

Notou que a linha após o "if" começa com 4 espaços? Fizemos isso para que o Python saiba que essa linha só deve ser executada se a expressão do "if" for verdadeira. Você pode quantos espaços quiser, mas por convenção os programadores Python usam 4, para que os códigos fiquem mais uniformes. Um `tab` também conta como 4 espaços.

Salve-o e execute novamente:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
It works!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### E se uma condição não for verdadeira?

Nos exemplos anteriores, o código foi executado somente quando as condições eram verdadeiras, mas o Python também tem as instruções `elif` e `else`:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 e maior que 2')
else:
    print('5 nao e maior do que 2')
```

Rode o código acima e verá:

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

e executando:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hey Sonja!
    

Mas o que aconteceu ali? `elif` te possibilita adicionar uma condição extra que roda caso a primeira condição seja falsa.

Você pode adicionar quantos `elif` quiser depois do `if`. Por exemplo:

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

Python irá testar cada condição sequencialmente e então irá imprimir:

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

É hora da última parte deste capítulo!

## Suas próprias funções!

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

Uma função é um sequência de instruções que o Python deve executar. Cada função em Python se inicia com a palavra reservada `def`, possui um nome e pode ter parâmetros. Let's give it a go. Substitua o código no **python_intro.py** com o seguinte:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

Ok, nossa primeira função está pronta!

Você pode se perguntar por que escrevemos o nome da função na parte inferior do arquivo. Isto é porque Python lê o arquivo e executa-lo de cima para baixo. Então, para usar a nossa função, temos re-escrevê-lo na parte inferior.

Vamos executá-lo agora e ver o que acontece:

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

Como você pode ver, agora demos um parâmetro chamado `name` para nossa função:

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

Lembre-se: a função `print` está endentada de 4 espaços depois do `if`. Isso é necessário porque a função só rodará se a condição for verdadeira. Vamos ver como isso funciona agora:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

Oops, um erro. Felizmente, Python nos fornece uma mensagem de erro bastante útil. Ela diz que a função `hi()` (aquela que declaramos) tem um argumento obrigatório (chamado `name`) e que nós esquecemos de passá-lo ao chamar a função. Vamos corrigi-lo na parte inferior do arquivo:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

E ExEcutE novamEntE:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

E se mudarmos o nome?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

E ExEcutá-lo:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

Isto é incrível, não? Dessa maneira você não precisa se repetir (DRY - don't repeat yourself) cada vez que for mudar o nome da pessoa que a função pretende cumprimentar. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

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
    

Parabéns! Você acabou de aprender a criar funções! :)

## Laços

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

Essa já é a última parte! Rápido, né? :)

Programadores não gostam de repetirem código. Programar é automatizar coisas, então não queremos cumprimentar a cada pessoa manualmente, certo? É aí que entram os laços (ou "loops", em Inglês).

Ainda se lembra das listas? Vamos fazer uma lista de garotas:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

Queremos cumprimentar todas elas pelos seus nomes. Temos a função `hi` para fazer isso, então vamos usá-la em um laço:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

The `for` statement behaves similarly to the `if` statement; code below both of these need to be indented four spaces.

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

E quando ExEcutá-lo:

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

Você também pode usar o `for` em números usando a função `range`:

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

Note que o segundo desses dois números não está incluído na lista que o Python mostrou (em `range(1, 6)`, conta de 1 a 5, mas o 6 não é incluído). That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## Sumário

É isso. **Você mandou muito bem!** Esse foi um capítulo difícil, então você deve estar orgulhosa. Nós estamos orgulhosas de você por ter conseguido ir tão longe!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)