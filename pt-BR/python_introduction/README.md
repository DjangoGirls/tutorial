{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# Introdução ao Python

> Parte deste capítulo é baseada no tutorial das Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Vamos escrever um pouco de código!

## Interpretador de Python

> Para leitoras em casa: esta parte é abordada no vídeo [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U).

Para começar a trabalhar com Python, precisamos abrir uma * linha de comando* (ou prompt) no computador. Você provavelmente já sabe como fazer isso - aprendeu no capítulo [ Introdução à Linha de Comando ](../intro_to_command_line/README.md).

Assim que estiver pronta, siga as instruções abaixo.

Para abrir um prompt de comando do Python, digite `python` no Windows ou `python3` no Mac OS/Linux e clique `enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Digite "ajuda", "direitos autorais", ou "licença" para mais informações.
    >>>
    

## Seu primeiro comando em Python!

Depois de executar o comando python, o prompt mudou para `>>>`. Isso significa que, por enquanto, só podemos executar comandos na linguagem Python. Você não precisa digitar `>>>` - o Python fará isso por você.

Se a qualquer momento você quiser sair do prompt do Python, digite `exit()` ou use o atalho `Ctrl + Z` no Windows e `Ctrl + D` no Mac ou Linux. Fazendo isso, você não vai mais ver o `>>>`.

Por enquanto, não vamos sair do prompt do Python. Queremos aprender mais sobre ele. Para começar, vamos digitar um pouco de matemática, como `2 + 3`, e clicar `enter`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

Legal! Viu como a resposta apareceu? O Python sabe matemática! Você pode tentar outros comandos:

- `4 * 5`
- `5 - 1`
- `40 / 2`

Para executar cálculo exponencial, como 2 elevado a 3, digitamos: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

Brinque um pouco com isso e depois volte aqui. :)

Como você pode ver, o Python é uma ótima calculadora. Se você está se perguntando o que mais pode fazer…

## Strings

Que tal o seu nome? Digite seu primeiro nome entre aspas, desse jeito:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

Você acabou de criar sua primeira string! Uma string é uma sequência de caracteres que pode ser processada pelo computador. Ela deve sempre começar e terminar com o mesmo caractere. Este caractere pode ser aspas duplas (`"`) ou simples (`'`) (não há nenhuma diferença!). Elas dizem ao Python que o que está entre elas é uma string.

Strings podem ser juntadas. Tente isto:

{% filename %}command-line{% endfilename %}

```python
>>> "Olá " + "Ola"
'Olá Ola'
```

(Ola é o nome das duas criadoras do Django Girls!). Você também pode multiplicar strings por um número:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

Se você precisa colocar uma apóstrofe dentro de uma string, pode fazê-lo de duas maneiras.

Usando aspas duplas:

{% filename %}command-line{% endfilename %}

```python
>>> "Roda d'água" 
"Roda d'água"
```

ou "escapando" a aspa simples (o que sinaliza para o Python que aquele sinal é uma apóstrofe, e não uma aspa marcando o final da string) com uma contra-barra (``):

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

Você acabou de usar a **função** `upper` na sua string! Uma função (como `upper()`) é um conjunto de instruções que o Python tem que realizar em um determinado objeto (`"Ola"`) sempre que você o chamar.

Se você quer saber o número de letras contidas em seu nome, há uma **função** para isso também!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

Talvez você esteja se perguntando porque algumas vezes chamamos funções com um `.` depois de uma string (como `"Ola".upper()`) e outras vezes primeiro chamamos a função e depois colocamos a string entre parênteses. Bem, em alguns casos, funções pertencem a objetos - como `upper()`, que só pode ser utilizada em strings. Nesse caso, nós chamamos a função de **método**. Outras vezes, elas não pertencem a nada específico e podem ser usadas em diferentes tipos de objetos, como a função `len()`. É por isso que fornecemos `"Ola"` como parâmetro para a função `len`.

### Sumário

OK, chega de strings. Até agora, você aprendeu sobre:

- **o prompt** - digitar comandos (códigos) no interpretador de Python resulta em respostas em Python
- **números e strings** - no Python, números são usados para matemática e strings, para objetos de texto
- **operadores** - como `+` e `*`, combinam valores para produzir um novo valor
- **funções** - como `upper()` e `len()`, executam ações nos objetos.

Esse é o básico de todas as linguagens de programação. Pronta para algo mais difícil? Apostamos que sim!

## Erros

Vamos tentar algo novo. Será que conseguimos saber a extensão de um número da mesma forma que descobrimos a dos nossos nomes? Digite `len(304023)` e clique `enter`:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Temos nosso primeiro erro! O ícone {{ warning_icon }} é a forma que o Pyhton tem para avisar que o código que você está prestes a executar não vai funcionar conforme o esperado. Cometer erros (inclusive intencionalmente) é uma parte importante da aprendizagem!

Nossa primeira mensagem de erro nos diz que objetos do tipo "int" (inteiros, naturais) não têm comprimento algum. O que podemos fazer agora? Podemos escrever nosso número como string? Strings têm comprimento, certo?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Funcionou! Usamos a função `str` dentro da função `len`. A função `str ()` converte tudo em strings.

- A função `str` converte as coisas em **strings**
- A função `int` converte as coisas em **números inteiros**

> Importante: podemos converter números em texto, mas nem sempre é possível converter texto em números - o que `int('hello')` quer dizer?

## Variáveis

Variáveis são um conceito importante em programação. Uma variável é apenas um nome que você atribui a um objeto. Programadores armazenam dados nelas para tornar seus códigos mais legíveis e para não ter que lembrar a todo momento o que são certas coisas.

Se quisermos criar uma nova variável chamada `name`:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

Digitamos: name igual Ola.

Como você deve ter percebido, a última linha de código não retornou nada como nos exemplos anteriores. Então como vamos saber se a variável realmente existe? Basta digitar `name` e clicar `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> name
'Ola'
```

Uhuuu! Sua primeira variável! :) Você pode mudar o valor dela:

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

Incrível, né? Variáveis podem ser qualquer coisa, então podem ser números também! Tente isso:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

E se digitarmos errado o nome da variável? Você consegue imaginar o que aconteceria? Vamos tentar!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

Um erro! O Python tem diferentes tipos de erros e este é chamado **NameError**. Ele mostrará esta mensagem se você tentar usar uma variável que ainda não foi definida. Se encontrar esse erro mais tarde, confira no seu código se você não digitou errado o nome de uma variável.

Brinque com isso por um tempo e veja o que consegue fazer!

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

Quando você digita `name`, o interpretador de Python responde com a *representação* da variável 'name' na forma de string, que é sequência de letras M-a-r-i-a, entre aspas simples. Quando você disser para o Python `print(name)`, ele vai "imprimir" (ou mostrar) na tela o conteúdo da variável sem as aspas.

Como veremos mais tarde, `print()` também é útil quando queremos imprimir algo dentro de funções ou quando queremos imprimir algo em várias linhas.

## Listas

Além de strings e números inteiros, o Python tem muitos tipos diferentes de objetos. Agora, vamos apresentar um chamado **lista**. Listas são objetos que são listas de outros objetos. :)

Vá em frente e crie uma lista:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Sim, esta é uma lista vazia. Não é muito útil, né? Vamos criar uma outra composta por números de loteria. Para não precisar repetir o código o tempo todo, vamos atribuí-la a uma variável:

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

Legal, criamos uma lista! O que podemos fazer com ela? Vamos ver quantos números de loteria ela contém. Você tem ideia de que a função deve usar para isso? Você já aprendeu ;)

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

Isso não retorna nada, apenas muda a ordem em que os números aparecem na lista. Vamos imprimi-la outra vez e ver o que acontece:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

Agora os números estão ordenados do menor para o maior. Parabéns!

E se quisermos inverter a ordem? Vamos fazer isso!

{% filename %}command-line{% endfilename %}

```python
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

Moleza, né? Se quiser adicionar alguma coisa à sua lista, digite o seguinte comando:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

Se quiser ver apenas o primeiro número da lista, pode usar **índices**. Um índice é o número que diz onde na lista um item está. Programadores preferem começar a contar a partir do zero, então o primeiro objeto em sua lista está no índice 0, o segundo no 1 e assim por diante. Tente isso:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

Como você pode ver, podemos acessar diferentes objetos na lista usando o nome da lista e o índice do objeto entre colchetes.

Para apagar algum objeto da sua lista, você precisa usar **índices**, como aprendemos acima, e o método `pop()`. Vamos usar um exemplo para reforçar o que já aprendemos: vamos deletar o primeiro número de nossa lista.

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

Agora, tente alguns outros índices, como: 6, 7, 1000, -1, -6 ou -1000. Veja se consegue prever o resultado antes de executar o comando. Os resultados fazem sentido para você?

Uma lista de todos os métodos disponíveis nesta seção pode ser encontrada na documentação do Python: https://docs.python.org/3/tutorial/datastructures.html

## Dicionários

> Para leitoras em casa: esta seção é abordada no vídeo [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c).

Um dicionário é similar a uma lista, mas para acessar seus valores você usa uma chave ao invés de um índice. Uma chave pode ser qualquer string ou número. A sintaxe para definir um dicionário vazio é:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

Você acabou de criar um dicionário vazio. Uhuuu!

Agora escreva o seguinte comando (e tente colocar suas próprias informações):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

Com esse comando, você criou uma variável chamada `participant` com três pares de chave-valor:

- A chave `name` aponta para o valor `'Ola'` (um objeto do tipo `string`),
- a chave `country` aponta para `'Poland'` (outra `string`),
- e a chave `favorite_numbers` aponta para `[7, 42, 92]` (uma `lista` de três números).

Você pode verificar o conteúdo de chaves individuais com a sintaxe:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

É similar a uma lista, mas você não precisa lembrar o índice - apenas o nome.

O que acontece se perguntarmos ao Python qual é o valor de uma chave que não existe? Você consegue adivinhar? Vamos testar e descobrir!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

Olha, outro erro! Esse é um **KeyError**. O Python é bastante prestativo e te diz que a chave `'age'` não existe no nesse dicionário.

Você deve estar se perguntando quando deveria usar um dicionário ou uma lista. Essa é uma questão importante. Pense sobre ela antes de ver a resposta nas próximas linhas.

- Você precisa de uma sequência ordenada de itens? Use uma lista.
- Você precisa associar valores a chaves para poder procurá-los eficientemente (pela chave) mais tarde? Use um dicionário.

Dicionários, assim como listas, são *mutáveis*. Isso significa que eles podem ser alterados depois de criados. Você pode adicionar um novo par chave-valor a um dicionário depois de ele ser criado, por exemplo:

{% filename %}command-line{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

Como nas listas, usar a função `len()` em dicionários retorna o número de pares chave-valor que ele contém. Vá em frente e digite o comando:

{% filename %}command-line{% endfilename %}

```python
>>> len(participant)
4
```

Esperamos que esteja fazendo sentido até agora. :) Pronta para mais diversão com dicionários?

Você pode usar o método `pop()` para deletar um item do dicionário. Se quiser excluir a entrada correspondente à chave `'favorite_numbers'`, por exemplo, basta digitar o seguinte comando:

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

Agora, o valor da chave `'country'` foi alterado de `'Poland'` para `'Germany'`. :) Emocionante? Uhu! Você acabou de aprender outra coisa incrível.

### Sumário

Legal! Agora você sabe muito sobre programação. ;) Nesta última parte, você aprendeu sobre:

- **erros** - você já sabe como ler e entender mensagens de erro que aparecem quando o Python não entende um comando que você deu;
- **variáveis** - são nomes para objetos que permitem que você programe facilmente e deixam seu código mais legível;
- **listas** - são listas de objetos armazenados em uma ordem específica;
- **dicionários** - contêm objetos armazenados como pares chave-valor.

Animada para a próxima parte? :)

## Compare coisas

> Para leitoras em casa: esta seção é abordada no vídeo [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4).

Grande parte da programação consiste em comparar coisas. O que é mais fácil comparar? Números! Vamos ver como funciona:

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

Demos ao Python alguns números para comparar. Como você pode ver, ele pode comparar não apenas números, mas também resultados de métodos. Legal, né?

Você deve estar se perguntando por que colocamos dois sinais de igual `==` lado a lado para verificar se os números são iguais. Nós usamos um único `=` para atribuir valores a variáveis. Você sempre, **sempre**, precisa colocar dois `==` se quiser verificar se as coisas são iguais. Também é possível afirmar que as coisas são diferentes. Para isso, usamos o símbolo `!=`, como mostrado no exemplo acima.

Dê ao Python mais duas tarefas:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

Já vimos `>` e `<`, mas o que significam `>=` e `<=`? Leia da seguinte forma:

- x `>` y significa: x é maior que y
- x `<` y significa: x é menor que y
- x `<=` y significa: x é menor ou igual a y
- x `>=` y significa: x é maior ou igual a y

Fantástico! Quer fazer mais? Tente isto:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

Você pode pedir ao Python para comprar quantos números quiser e ele vai te dar uma resposta! Espertinho, não é?

- **and** - se você usar o operador `and`, as duas comparações terão que ser verdadeiras para que a expressão seja verdadeira (True)
- **or** - se você usar o operador `or`, apenas uma das comparações precisa ser verdadeira para que a expressão seja verdadeira (True)

Já ouviu a expressão "comparar alhos com bugalhos"? Vamos tentar o equivalente em Python:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Aqui, vemos que assim como não podemos comparar alhos com bugalhos, o Python não é capaz de comparar um número (`int`) e uma string (`str`). Em vez de retornar um resultado, ele mostrou um **TypeError** e nos disse que os dois tipos não podem ser comparados um ao outro.

## Booleanos

Aliás, você acabou de aprender sobre um novo tipo de objeto em Python. Ele se chama **booleano**.

Existem apenas dois objetos booleanos:

- True (verdadeiro)
- False (falso)

Para que o Python entenda, você precisa escrever exatamente 'True' (primeira letra maiúscula e as outras minúsculas - mas sem as aspas). **true, TRUE ou tRUE não vão funcionar - só True está correto.** (A mesma coisa vale para 'False').

Booleanos também podem ser variáveis! Veja:

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

Pratique e divirta-se com os valores booleanos tentando executar os seguintes comandos:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Parabéns! Booleanos são um dos recursos mais interessantes na programação, e você acabou de aprender como usá-los!

# Salve!

> Para leitoras em casa: esta seção é abordada no vídeo [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk).

Até agora, escrevemos todos os códigos no interpretador de Python, que nos limita a digitar uma linha por vez. Programas normais são salvos em arquivos e executados pelo nosso **interpretador** de linguagem de programação ou **compilador**. Até aqui, executamos nossos programas uma linha de cada vez no **interpretador** de Python. Vamos precisar de mais de uma linha de código para as próximas tarefas, então vamos rapidamente:

- Sair do interpretador de Python
- Abrir o editor de código que escolhemos antes
- Salvar algum código em um novo arquivo de Python
- Executar o código!

Para sair do interpretador de Python, use a função `exit()`.

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

Isso vai levá-la de volta ao prompt de comando.

Earlier, we picked out a code editor from the [code editor](../code_editor/README.md) section. We'll need to open the editor now and write some code into a new file (or if you're using a Chromebook, create a new file in the cloud IDE and open the file, which will be in the included code editor):

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Você já é uma desenvolvedora Python bastante experiente, então sinta-se livre para escrever códigos com o que aprendeu hoje. ;)

Agora, precisamos salvar o arquivo e dar a ele um nome descritivo. Vamos nomear o arquivo **python_intro.py** e salvá-lo na sua área de trabalho. Podemos chamá-lo como quisermos, mas é importante que o nome termine com **.py**. A extensão **.py** diz ao sistema operacional que esse é um **arquivo Python executável** e o interpretador de Python pode rodá-lo.

> **Observação**: Você deve reparar numa das coisas mais legais nos editores de código: cores! No interpretador de Python, tudo é da mesma cor, mas no editor você deve estar vendo que a função `print` tem uma cor diferente da string que ela recebe como argumento. Isso se chama destaque de sintaxe ("syntax highlightning", do Inglês) e é uma funcionalidade muito útil quando escrevemos código. As cores de cada elemento nos dão dicas importantes. Elas avisam, por exemplo, sobre strings que esquecemos de fechar ou palavras reservadas que digitamos errado (como a palavra `def` na definição de uma função, que veremos adiante). Esta é uma das razões pelas quais usamos um editor de código. :)

O arquivo está salvo, então é hora de executá-lo! Com as habilidades que você aprendeu na seção sobre linhas de comando, use o terminal para **ir para os diretórios no desktop**.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Em um Mac, o comando é esse:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

On Linux, it will be like this:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

(Remember that the word "Desktop" might be translated to your local language.)

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

If you get stuck, ask for help. That's exactly what the coaches are here for!

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
    print('Funciona!')
```

Notice how we've indented the next line of code by 4 spaces? We need to do this so Python knows what code to run if the result is true. You can do one space, but nearly all Python programmers do 4 to make things look neat. A single Tab will also count as 4 spaces as long as your text editor is set to do so. When you made your choice, don't change it! If you already indented with 4 spaces, make any future indentation with 4 spaces, too - otherwise you may run into problems.

Save it and give it another run:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
Funciona!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### E se uma condição não for verdadeira?

In previous examples, code was executed only when the conditions were True. But Python also has `elif` and `else` statements:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 é maior que 2')
else:
    print('5 não é maior que 2')
```

When this is run it will print out:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    5 é maior que 2
    

If 2 were a greater number than 5, then the second command would be executed. Let's see how `elif` works:

{% filename %}python_intro.py{% endfilename %}

```python
name = 'Sonja'
if name == 'Ola':
    print('Olá Ola!')
elif name == 'Sonja':
    print('Olá Sonja!')
else:
    print('Olá estranho!')
```

and executed:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Olá Sonja!
    

See what happened there? `elif` lets you add extra conditions that run if the previous conditions fail.

You can add as many `elif` statements as you like after your initial `if` statement. For example:

{% filename %}python_intro.py{% endfilename %}

```python
volume = 57
if volume < 20: 
    print("Está um pouco baixo")
elif 20 <= volume < 40: 
    print("Está bom para música ambiente")
elif 40 <= volume < 60: 
    print("Perfeito, posso ouvir todos os detalhes")
elif 60 <= volume < 80: 
    print("Ótimo para festas!")
elif 80 <= volume < 100: 
    print("Está muito alto!")
else: 
    print("Meus ouvidos doem! :(")
```

Python runs through each test in sequence and prints:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Perfeito, posso ouvir todos os detalhes
    

## Comentários

Comments are lines beginning with `#`. You can write whatever you want after the `#` and Python will ignore it. Comments can make your code easier for other people to understand.

Let's see how that looks:

{% filename %}python_intro.py{% endfilename %}

```python
# Mudar o volume se estiver muito alto ou muito baixo
if volume < 20 or volume > 80
    volume = 50
    print("Bem melhor!")
```

You don't need to write a comment for every line of code, but they are useful for explaining why your code is doing something, or providing a summary when it's doing something complex.

### Sumário

In the last few exercises you learned about:

- a **comparar coisas** - em Python, você pode comparar objetos usando os operadores `>`, `>=`, `==`, `<=`, `<` e `and`, `or`;
- **booleano** - um tipo de objeto que só tem dois valores possíveis: `True` ou `False`;
- a **salvar arquivos** - armazenar código em arquivos para que você possa executar programas maiores;
- **if... elif... else** - instruções que permitem que você execute o código somente se determinadas condições forem atendidas;
- **comentários** - linhas que o Python não executa e que permitem que você documente seu código.

Time for the last part of this chapter!

## Suas próprias funções!

> Para leitoras em casa: esta parte do capítulo é abordada no vídeo [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0).

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

A function is a sequence of instructions that Python should execute. Each function in Python starts with the keyword `def`, is given a name, and can have some parameters. Let's give it a go. Replace the code in **python_intro.py** with the following:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Olá!')
    print('Tudo bem?')

hi()
```

Okay, our first function is ready!

You may wonder why we've written the name of the function at the bottom of the file. This is because Python reads the file and executes it from top to bottom. So in order to use our function, we have to re-write it at the bottom.

Let's run this now and see what happens:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Olá!
    Tudo bem?
    

Note: if it didn't work, don't panic! The output will help you to figure why:

- Se você recebeu uma mensagem `NameError`, provavelmente foi um erro de digitação, então confira se usou o mesmo nome ao criar a função com `def hi()` e quando a chamou no final com `hi()`.
- Se recebeu uma mensagem `IdentationError`, confira se as duas linhas de `print` têm o mesmo recuo no começo: o Python precisa que o código dentro da função esteja bem alinhado.
- Se a função não retornou nenhum resultado, certifique-se de que o útlimo `hi()`*não* esteja endentado - se ele estiver, essa linha vai se tornar parte da função e o Python não vai receber nenhum comando para executar.

Let's build our first function with parameters. We will change the previous example – a function that says 'hi' to the person running it – with a name:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
```

As you can see, we now gave our function a parameter that we called `name`:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    if name == 'Ola':
        print('Olá Ola!')
    elif name == 'Sonja':
        print('Olá Sonja!')
    else:
        print('Olá estranho!')

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
    Olá Ola!
    

And if we change the name?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

And run it:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Olá Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Olá estranho!
    

This is awesome, right? This way you don't have to repeat yourself every time you want to change the name of the person the function is supposed to greet. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right? Replace the content of your file with the following:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Olá ' + name + '!')

hi("Rachel")
```

Let's call the code now:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Olá Rachel!
    

Congratulations! You just learned how to write functions! :)

## Laços

> Para leitoras em casa: esta parte do capítulo é abordada no vídeo [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0).

This is the last part already. That was quick, right? :)

Programmers don't like to repeat themselves. Programming is all about automating things, so we don't want to greet every person by their name manually, right? That's where loops come in handy.

Still remember lists? Let's do a list of girls:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'você']
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
    print('Olá ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'você']
for name in girls:
    hi(name)
    print('Próxima')
```

And when we run it:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Olá Rachel!
    Próxima
    Olá Monica!
    Próxima
    Olá Phoebe!
    Próxima
    Olá Ola!
    Próxima
    Olá você!
    Próxima
    

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

## Sumário

That's it. **You totally rock!** This was a tricky chapter, so you should feel proud of yourself. We're definitely proud of you for making it this far!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)