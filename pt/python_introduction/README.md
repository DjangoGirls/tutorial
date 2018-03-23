# Introdução ao Python

> Parte deste capítulo é baseado nos Tutoriais de Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Vamos escrever um pouco de código!

## Interpretador Python

> Leitoras em casa: essa parte está disponível no vídeo (em inglês) [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U).

Para começar a brincar com Python nós precisamos abrir uma *linha de comando* no seu computador. Você já deve saber como fazer isso - você aprendeu no capítulo [Introdução à Linha de Comando](../intro_to_command_line/README.md).

Assim que estiver pronta, siga as instruções abaixo.

Nós queremos abrir o Python em um terminal, então digite `python` no Windows, `python3` no Mac OS/Linux, e tecle `Enter`.

{% filename %}command-line{% endfilename %}
```
$ python3
Python 3.5.1 (...)
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

## Seu primeiro comando Python!

Depois de executar o comando Python, o prompt mudou para `>>>`. Para nós, isso significa que por enquanto só utilizaremos comandos na linguagem Python. Você não precisa digitar `>>>` - o próprio Python fará isso por você.

Se você deseja sair do console do Python, apenas digite `exit()` ou use o atalho `Ctrl + Z` no Windows e `Ctrl + D` no Mac/Linux. Então você não vai ver mais o `>>>`.

Mas agora não queremos sair da linha de comando do Python. Queremos aprender mais sobre ela. Vamos, então, fazer algo muito simples. Por exemplo, tente digitar alguma operação matemática, como `2 + 3` e aperte o `Enter`.

{% filename %}command-line{% endfilename %}
```python
>>> 2 + 3
5
```

Incrível! Vê como a resposta simplesmente aparece? O Python conhece matemática! Você pode tentar outros comandos como:

- `4 * 5`
- `5 - 1`
- `40 / 2`

Para desenvolver cálculo exponencial, digamos 2 elevado a potência de 3, nós digitamos:
```python
>>> 2 ** 3
8
```

Divirta-se com isso por um tempo e depois volte aqui :).

Como você pode ver, o Python é uma ótima calculadora. Se você está se perguntando o que mais você pode fazer...

## Strings

Que tal o seu nome? Digite seu primeiro nome entre aspas, desse jeito:

{% filename %}command-line{% endfilename %}
```python
>>> "Ana"
'Ana'
```

Você acabou de criar sua primeira string! String é uma sequência de caracteres que pode ser processada pelo computador. A string sempre precisa iniciar e terminar com o mesmo caractere. Este pode ser aspas duplas(`"`) ou simples(`'`) - elas dizem ao Python que o que está dentro delas é uma string.

Strings podem ser concatenadas (colocadas juntas). Tente isto:

{% filename %}command-line{% endfilename %}
```python
>>> "Oi " + "Ana"
'Oi Ana'
```

Você também pode multiplicar strings usando um número:

{% filename %}command-line{% endfilename %}
```python
>>> "Ana" * 3
'AnaAnaAna'
```

Se você precisa colocar um apóstrofo dentro de sua string, existem duas maneiras de fazer.

Usando aspas duplas:

{% filename %}command-line{% endfilename %}
```python
>>> "Runnin' down the hill"
"Runnin' down the hill"
```


ou escapando o apóstrofo com uma barra invertida (`\`):

{% filename %}command-line{% endfilename %}
```python
>>> 'Runnin\' down the hill'
"Runnin' down the hill"
```

Legal, hein? Para ver seu nome em letras maiúsculas, basta digitar:

{% filename %}command-line{% endfilename %}
```python
>>> "Ana".upper()
'ANA'
```

Você acabou de usar o __método__ `upper` na sua string! Um método (como `upper()`) é um conjunto de instruções que o Python realiza em um determinado objeto (`"Ana"`), sempre que você chamar por ele.

Se você quer saber o número de letras do seu nome, existe um __método__ para isso também!


{% filename %}command-line{% endfilename %}
```python
>>> len("Ana")
3
```

Se perguntando porque algumas vezes você chama métodos com um `.` no fim de uma string (como `"Ana".upper()`) e algumas vezes você primeiro chama a função colocando a string nos parênteses? Bem, em alguns casos, métodos pertencem a objetos, como `upper()`, que só pode ser utilizada em strings. Nesse caso, nós chamamos a função de **método**. Outras vezes, métodos não pertencem a nada específico e podem ser usadas em diferentes tipos de objetos, assim como `len()`. É por isso que nós estamos fornecendo `"Ana"` como um parâmetro para a função `len`.

### Sumário

OK, chega de strings. Até agora você aprendeu sobre:

*   **o prompt** - digitar comandos (códigos) no interpretador Python resulta em respostas em Python
*   **números e strings** - no Python, números são usados para matemática e strings para objetos de texto
*   **operadores** - como `+` e `\*`, combinam valores para produzir um novo valor
*   **métodos** - como `upper()` e `len()`, executam ações nos objetos.

Isso é o básico sobre todas as linguagens de programação que você for aprender. Pronta para algo mais difícil? Apostamos que sim!

## Erros

Vamos tentar algo novo. Podemos obter o tamanho de um número da mesma forma que podemos encontrar o tamanho do nosso nome? Digite `len(304023)` e pressione `Enter`:

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

- A função `str` converte as coisas em __strings__
- A função `int` converte as coisas em __números inteiros__

> Importante: podemos converter números em texto, mas nós não podemos, necessariamente, converter texto em números - de qualquer
forma, o que `int('hello')` quer dizer?

## Variáveis

Um conceito importante na programação é o conceito de variáveis. Uma variável não é nada mais do que um nome para alguma coisa, de tal forma que você possa usá-la mais tarde. As programadoras usam essas variáveis para guardar dados, para fazer seus códigos mais legíveis e para não ter que se lembrar sempre o que algumas coisas significam.

Digamos que queremos criar uma nova variável chamada `nome`:

{% filename %}command-line{% endfilename %}
```python
>>> nome = "Ana"
```

Vê? É simples! É só fazer: nome igual a Ana.

Como você percebeu, seu programa não retornou nada como fez anteriormente. Então como sabemos que a variável realmente existe? Simplesmente digite `nome` e tecle `Enter`:

{% filename %}command-line{% endfilename %}
```python
>>> nome
'Ana'
```

Oba! Sua primeira variável! :) Você sempre pode mudar o seu valor:

{% filename %}command-line{% endfilename %}
```python
>>> nome = "Sonja"
>>> nome
'Sonja'
```

Você pode usá-la também em métodos:

{% filename %}command-line{% endfilename %}
```python
>>> len(nome)
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

Mas, e se digitarmos o nome errado? Você consegue adivinhar o que aconteceria? Vamos tentar!


{% filename %}command-line{% endfilename %}
```python
>>> cidade = "Tokyo"
>>> ciddae
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ciddae' is not defined
```

Um erro! Como você pode ver, Python tem diferentes tipos de erros e este é chamado **NameError**. Python dará este erro se você tentar usar uma variável que não foi definida ainda. Se você encontrar esse erro depois, veja se no seu código se você não digitou o nome de uma variável errado.

Brinque com isso por um tempo e veja o que você consegue fazer!

## A função print

Tente isso:

{% filename %}command-line{% endfilename %}
```python
>>> nome = 'Maria'
>>> nome
'Maria'
>>> print(nome)
Maria
```

Quando você apenas digita `nome`, o interpretador Python responde com a *representação* como string da variável 'nome', que são as letras M-a-r-i-a, entre aspas simples. Quando você diz `print(nome)`, Python vai "imprimir" o conteúdo da variável na tela, sem as aspas, o que é mais puro.

Como veremos mais tarde, `print()` também é útil quando queremos imprimir algo dentro de funções, ou quando queremos imprimir algo em várias linhas.

## Listas

Além de strings e inteiros, o Python tem vários tipos diferentes de objetos. Vamos apresentar um chamado **lista**. Listas são exatamente o que você acha que elas são: elas são objetos que são listas de outros objetos :)

Vá em frente e crie uma lista:

{% filename %}command-line{% endfilename %}
```python
>>> []
[]
```

Sim, esta é uma lista vazia. Não é muito, não é? Vamos criar uma lista dos números da loteria. Como não queremos ficar repetindo o código todo o tempo vamos criar uma variável para ela:

{% filename %}command-line{% endfilename %}
```python
>>> loteria = [3, 42, 12, 19, 30, 59]
```

Tudo certo, nós temos uma lista! O que podemos fazer com isso? Vamos ver quantos números de loteria existem nesta lista. Você tem ideia de qual função deve usar para isso? Você já sabe disso!

{% filename %}command-line{% endfilename %}
```python
>>> len(loteria)
6
```

Sim! `len()` pode te dar o número de objetos que fazem parte de uma lista. Uma mão na roda, não? Vamos organizar isso agora:

{% filename %}command-line{% endfilename %}
```python
>>> loteria.sort()
```

Isso não retorna nada, apenas troca a ordem em que os números aparecem na lista. Vamos imprimir isso outra vez e ver o que acontece:

{% filename %}command-line{% endfilename %}
```python
>>> print(loteria)
[3, 12, 19, 30, 42, 59]
```

Como você pode ver, os números na nossa lista estão ordenados do menor para o maior. Parabéns!

Talvez a gente queira inverter essa ordem? Vamos fazer isso!

{% filename %}command-line{% endfilename %}
```python
>>> loteria.reverse()
>>> print(loteria)
[59, 42, 30, 19, 12, 3]
```

Moleza né? Se você quiser adicionar alguma coisa à sua lista, você pode fazer isto digitando o seguinte comando:

{% filename %}command-line{% endfilename %}
```python
>>> loteria.append(199)
>>> print(loteria)
[59, 42, 30, 19, 12, 3, 199]
```

Se você quiser mostrar apenas o primeiro número você pode usar **índices**. Um índice é um número que diz onde um item da lista está. Os computadores gostam de iniciar a contagem por 0, então o primeiro objeto tem índice 0, o próximo tem índice 1 e por aí vai. Tente isso:

{% filename %}command-line{% endfilename %}
```python
>>> print(loteria[0])
59
>>> print(loteria[1])
42
```

Como você pode ver, você pode acessar diferentes objetos na sua lista usando o nome da lista e o índice do objeto dentro dos colchetes.

Para apagar alguma coisa de sua lista, você precisará usar **índices** como nós aprendemos acima e o método `pop()`. Vamos
tentar um exemplo e reforçar o que aprendemos previamente; nós iremos apagar o primeiro número de nossa lista.

{% filename %}command-line{% endfilename %}
```python
>>> print(loteria)
[59, 42, 30, 19, 12, 3, 199]
>>> print(loteria[0])
59
>>> loteria.pop(0)
>>> print(loteria)
[42, 30, 19, 12, 3, 199]
```

Isso funcionou com perfeição!

Por diversão extra, tente alguns outros índices: 6, 7, 1000, -1, -6 ou -1000. Veja se você consegue prever o resultado antes de tentar o comando. Os resultados fazem sentido?

Você pode encontrar uma lista de todos os métodos disponíveis neste capítulo na documentação do Python: https://docs.python.org/3/tutorial/datastructures.html

## Dicionários

> Leitoras em casa: essa parte está disponível no vídeo (em inglês) [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c).

Um dicionário é semelhante a uma lista, mas você pode acessar valores através de uma chave ao invés de um índice. Uma chave pode ser qualquer string ou número. A sintaxe para definir um dicionário vazio é:

{% filename %}command-line{% endfilename %}
```python
>>> {}
    {}
```    

Isso mostra que você acabou de criar um dicionário vazio. Oba!

Agora, tente escrever o seguinte comando (tente substituir com as suas próprias informações também):

{% filename %}command-line{% endfilename %}
```python
>>> participante = {'nome': 'Ana', 'pais': 'Polonia', 'numeros_favoritos': [7, 42, 92]}
```  

Com esse comando, você acabou de criar uma variável chamada `participante` com três pares de chave-valor:

- A chave `nome` aponta para o valor `'Ana'` (um objeto `string`),
- `pais` aponta para `'Polonia'` (outra `string`),
- `numeros_favoritos` apontam para `[7, 42, 92]` (uma `list` com três números nela).

Você pode checar o conteúdo de chaves individuais com a sintaxe:

```  
>>> print(participante['nome'])
Ana
```      

Veja, é similar a uma lista. Mas você não precisa lembrar o índice - apenas o nome.

O que acontece se pedirmos ao Python o valor de uma chave que não existe? Você consegue adivinhar? Vamos tentar e descobrir!

{% filename %}command-line{% endfilename %}
```python
>>> participante['idade']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'idade'
```

Olha, outro erro! Esse é um **KeyError**. Python é bastante prestativo e te diz que a chave `'idade'` não existe nesse dicionário.

Quando usar um dicionário ou uma lista? Bem, um bom ponto para refletir. Pense em uma solução antes de olhar a resposta na próxima linha.

- Você precisa de uma sequência ordenada de itens? Use uma lista.
- Você precisa associar valores com chaves, assim você pode procurá-los eficientemente (pela chave) mais tarde? Use um dicionário.

Dicionários, como listas, são *mutáveis*, ou seja, que podem ser mudados depois que são criados. Você pode adicionar novos pares de chave-valor para o dicionário após sua criação, como:

{% filename %}command-line{% endfilename %}
```python
>>> participante['linguagem_favorita'] = 'Python'
```

Como as listas, usar o método `len()` em dicionários retorna o número de pares chave-valor no dicionário. Vá em frente e digite o comando:

{% filename %}command-line{% endfilename %}
```python
>>> len(participante)
4
```

Espero que isso faça sentido até agora. :) Pronta para mais diversão com dicionários? Pule na próxima linha para coisas incríveis.

Você pode usar o comando `pop()` para deletar um item no dicionário. Digamos, se você quer excluir a entrada correspondente à chave `'numeros_favoritos'`, basta digitar o seguinte comando:

{% filename %}command-line{% endfilename %}
```python
>>> participante.pop('numeros_favoritos')
>>> participante
{'pais': 'Polonia', 'linguagem_favorita': 'Python', 'nome': 'Ana'}
```

Como você pode ver no retorno, o par chave-valor correspondente à chave `'numeros_favoritos`' foi excluído.

Além disso você pode mudar o valor associado com uma chave já criada no dicionário. Digite:

{% filename %}command-line{% endfilename %}
```python
>>> participante['pais'] = 'Alemanha'
>>> participante
{'pais': 'Alemanha', 'linguagem_favorita': 'Python', 'nome': 'Ana'}
```

Como você pode ver, o valor da chave `'pais'` foi alterado de `'Polonia'` para `'Alemanha'`. :) Emocionante? Oba! Você acabou de aprender outra coisa incrível.

### Sumário

Incrível! Agora você sabe muito sobre programação. Nesta última parte você aprendeu sobre:

- __erros__ - agora você sabe como ler e entender erros que aparecem se o Python não entender um comando que você passou
* __variáveis__ - nomes para objetos que permitem você programar facilmente e deixar seu código mais legível
* __listas__ - listas de objetos armazenados em uma ordem específica
* __dicionários__ - objetos armazenados como pares chave-valor

Empolgada para o próximo passo? :)

## Compare coisas

> Leitoras em casa: essa parte está disponível no vídeo (em inglês) [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4).

Grande parte da programação consiste em comparar coisas. O que é mais fácil de comparar? Números, é claro. Vamos ver como isso funciona:

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


Demos ao Python alguns números para comparar. Como você pode ver, Python pode comparar não só números mas também resultados de métodos. Legal, hein?

Você está se perguntando por que colocamos dois sinais de igual `==` lado a lado para comparar se os números são iguais? Nós usamos um único `=` para atribuir valores a variáveis. Você sempre, **sempre** precisa colocar dois `==` se quiser verificar se as coisas são iguais. Também é possível afirmar que as coisas são desiguais entre si. Para isso, usamos o símbolo `!=`, conforme mostrado no exemplo acima.

Dê ao Python mais duas tarefas:

{% filename %}command-line{% endfilename %}
```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

`>` e `<` são compreensíveis, mas o que `>=` e `<=` significam? Leia-os da seguinte forma:

- x `>` y significa: x é maior que y
- x `<` y significa: x é menor que y
- x `<=` y significa: x é menor ou igual a y
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

Você pode dar ao Python quantos números você quiser para comparar, e ele vai te dar uma resposta! Espertinho, certo?

- __and__ - se você usar o operador `and`, ambas as comparações terão que ser verdadeiras para que todo o comando seja verdadeiro
- __or__ - se você usar o operador `or`, apenas uma das comparações precisa ser verdadeira para que o comando todo seja verdadeiro

Já ouviu a expressão "comparar maçãs com laranjas"? Vamos tentar o equivalente em Python:

{% filename %}command-line{% endfilename %}
```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Aqui vemos que assim como na expressão, Python não é capaz de comparar um número (`int`) e uma string (`str`).

Em vez disso, ele mostrou um **TypeError** e nos disse que os dois tipos não podem ser comparados entre si.

##Booleano

Acidentalmente, você aprendeu sobre um novo tipo de objeto em Python. Ele é chamado de __Booleano__ - e provavelmente é o tipo mais fácil que existe.

Existem apenas dois objetos booleanos:
- True (verdadeiro)
- False (falso)

Mas para o Python entender isso, você precisa sempre escrever True (primeira letra maiúscula, com o resto das letras em minúsculo). true, TRUE, tRUE não vai funcionar - só True é correto. (O mesmo se aplica ao False, claro.)

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

# Salvando o Código!

> Leitoras em casa: essa parte está disponível no vídeo (em inglês) [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk).

Até agora nós escrevemos todo nosso código em um interpretador python, o que nos limita a uma linha de código a cada momento. Programas normais são salvos em arquivos e executados pelo nosso **interpretador** de linguagem de programação ou **compilador**. Até agora nós executamos nossos programas uma linha de cada vez no **interpretador** Python. Nós vamos precisar de mais de uma linha de código para as próximas tarefas, então precisaremos rapidamente:

- Sair do interpretador Python
- Abrir o editor de código de sua escolha
- Salvar algum código em um novo arquivo python
- Executá-lo!

Para sair do interpretador Python que estamos usando, simplesmente digite a função `exit()`:

{% filename %}command-line{% endfilename %}
```python
>>> exit()
$
```

Isso vai colocá-la de volta no prompt de comando.

Anteriormente, nós escolhemos um editor de código da seção do [editor de código](../code_editor/README.md). Nós precisamos abrir o editor agora e escrever algum código em um novo arquivo:

{% filename %}editor{% endfilename %}
```python
print('Hello, Django girls!')
```

Obviamente, agora você é uma desenvolvedora Python com alguma experiência, então sinta-se livre para escrever algum código com o que
aprendeu hoje.

Então, nós precisamos salvar o arquivo e nomeá-lo de forma descritiva. Vamos chamar o arquivo de **python_intro.py** e
salvá-lo em seu desktop. Nós podemos nomeá-lo da maneira que quisermos, mas a parte importante aqui é garantir que termine
com __.py__. A extensão __.py__ informa ao nosso sistema operacional que o arquivo é um **arquivo Python executável** e
o Python pode rodá-lo.

> **Nota** Você deve ter observado uma das coisas mais legais sobre editores de código: cores! No console do Python, tudo era da mesma cor, mas agora você deve ver que a função `print` tem uma cor diferente da sequência de caracteres no seu interior. Isso é chamado de "realce de sintaxe", e é uma ajuda muito útil quando está programando. Perceba a cor das coisas e você vai obter uma dica para quando você esquecer de fechar uma sequência de caracteres, ou fazer um erro de digitação em um nome de palavra-chave (como `def` em uma função, que veremos abaixo). Esta é uma das razões pelas quais nós usamos um editor de código :)

Com o arquivo salvo, é hora de executá-lo! Usando as habilidades que você aprendeu na seção de linha de comando, use o terminal e **mude de diretório** para o desktop.

<!--sec data-title="OS X" data-id="python_OSX"
data-collapse=true ces-->

Em um Mac, o comando será parecido com isto:

{% filename %}command-line{% endfilename %}
```
$ cd ~/Desktop
```
<!--endsec-->

<!--sec data-title="Linux" data-id="python_linux"
data-collapse=true ces-->

No Linux, será assim (a palavra "Desktop" pode estar traduzida para "Área de Trabalho"):

{% filename %}command-line{% endfilename %}
```
$ cd ~/Desktop
```

<!--endsec-->

<!--sec data-title="Windows" data-id="python_windows" data-collapse=true ces-->

E no windows, vai ser assim:

{% filename %}command-line{% endfilename %}
```
> cd %HomePath%\Desktop
```
<!--endsec-->

Se você ficar confusa, é só pedir ajuda.

Em seguida, use o Python para executar o código do arquivo assim:

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
Hello, Django girls!
```

Nota: no Windows 'python3' não é reconhecido como um comando. Em vez disso, use 'python' para executar o arquivo:

{% filename %}command-line{% endfilename %}
```python
> python python_intro.py
```

Muito bem! Você acabou de executar seu primeiro programa em Python que foi salvo em um arquivo. Se sente ótima?

Você pode agora passar para uma ferramenta essencial na programação:

## if...elif...else

Muitas coisas no código só podem ser executadas se determinadas condições forem atendidas. É por isso que o Python tem uma coisa chamada **declaração if**.

Substitua o código no arquivo **python_intro.py** para isto:

{% filename %}python_intro.py{% endfilename %}
```python
if 3 > 2:
```

Se salvarmos isso e rodar o arquivo, nós veremos um erro como este:

{% filename %}command-line{% endfilename %}
```python
$ python3 python_intro.py
File "python_intro.py", line 2
         ^
SyntaxError: unexpected EOF while parsing
```

Python espera que nós forneçamos mais instruções que serão supostamente executadas caso a condição `3 > 2` venha a ser verdadeira (ou `True` nesse caso). Vamos tentar fazer o Python imprimir "It works!". Altere o seu código no seu arquivo **python_intro.py** para isto:

{% filename %}python_intro.py{% endfilename %}
```python
if 3 > 2:
    print('It works!')
```

Você percebeu que identamos a próxima linha com 4 espaços? Precisamos fazer isso para que o Python saiba qual código será executado se o resultado for True. Você pode fazer com 1 espaço, mas quase todas as programadoras Python fazem com 4 para deixar as coisas arrumadas. Um único `tab` também vai contar como 4 espaços.

Salve o arquivo e execute novamente:

{% filename %}command-line{% endfilename %}
```python
$ python3 python_intro.py
It works!
```

Nota: Lembre-se que no Windows, 'python3' não é reconhecido como um comando. A partir de agora, substitua 'python3' por
'python' para executar o arquivo.

### E se a condição não for True?

Nos exemplos anteriores, o código era executado apenas quando as condições eram verdadeiras - True. Mas Python também tem
as declarações `elif` e `else`:

{% filename %}python_intro.py{% endfilename %}
```python
if 5 > 2:
    print('5 é de fato maior que 2')
else:
    print('5 não é maior que 2')
```

Quando isso é executado será impresso:

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
5 é de fato maior que 2
```

Se 2 fosse um número maior que 5, então o segundo comando seria executado. Simples, não é? Vamos ver como o `elif` funciona:

{% filename %}python_intro.py{% endfilename %}
```python
nome = 'Sonja'
if nome == 'Ana':
    print('Hey Ana!')
elif nome == 'Sonja':
    print('Hey Sonja!')
else:
    print('Hey anonymous!')
```

e depois de executar:

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
Hey Sonja!
```

Vê o que acontece aqui? `elif` permite que você adicione condições extras que acontecem se as condições anteriores falharem.

Você pode adicionar quantas declarações `elif` você quiser após a declaração `if` inicial. Por exemplo:

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

O Python roda cada um dos testes em sequência e imprime:

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
Perfect, I can hear all the details
```

## Comentários

Comentários são linhas que começam com um `#`. Você pode escrever qualquer coisa que você quiser após o `#` que o Python irá
ignorar completamente. Comentários podem deixar seu código mais fácil de  ser entendido por outras pessoas.

Vejamos como isso se parece:

{% filename %}python_intro.py{% endfilename %}
```python
# Change the volume if it's too loud or too quiet
if volume < 20 or volume > 80:
    volume = 50
    print("That's better!")
```

Você não precisa escrever um comentário para cada linha de código, mas eles são úteis para explicar o por quê de seu código
estar fazendo algo, ou para prover um sumário se estiver fazendo algo complexo.

### Sumário

Nos poucos exercícios anteriores você aprendeu:

- __comparar as coisas__ - em Python, você pode comparar as coisas usando os operadores `>`, `>=`, `==`, `<=`, `<` e o `and`, `or`
- __Booleano__ - um tipo de objeto que só tem um dos dois valores: `True` ou `False`
- __Salvando arquivos__ - armazenamento de código em arquivos assim você pode executar programas maiores.
- __if... elif... else__ - instruções que permitem que você execute o código somente se determinadas condições forem atendidas.
- __comentários__ - linhas que o Python não executa que deixam você documentar o seu código

É hora da última parte deste capítulo!

## Suas próprias funções!

Se lembra de funções como `len()` que você pode executar no Python? Bem, boas notícias, agora você vai aprender a escrever suas próprias funções!

Uma função é uma sequência de instruções que o Python deve executar. Cada função em Python começa com a palavra-chave `def`, seguida de um nome para a função e opcionalmente uma lista de parâmetros. Vamos começar com uma função simples. Substitua o código no **python_intro.py** com o seguinte:

{% filename %}python_intro.py{% endfilename %}
```python
def hi():
    print('Olá!')
    print('Como vai você?')

hi()
```

Ok, nossa primeira função está pronta!

Você pode se perguntar por que escrevemos o nome da função na parte inferior do arquivo. Porque Python lê o arquivo e executa de cima para baixo. Então, para usar a nossa função, temos de reescrevê-la na parte inferior.

Vamos executa-lo agora e ver o que acontece:

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
Olá!
Como vai você?
```

Isso foi fácil! Vamos construir nossa primeira função com parâmetros. Usaremos o exemplo anterior - uma função que diz 'hi' para quem o executa - com um nome:

{% filename %}python_intro.py{% endfilename %}
```python
def hi(nome):
```

Como você pode ver, nós demos a nossa função um parâmetro que nós chamamos de `nome`:

{% filename %}python_intro.py{% endfilename %}
```python
def hi(nome):
    if nome == 'Ana':
        print('Hi Ana!')
    elif nome == 'Sonja':
        print('Hi Sonja!')
    else:
        print('Hi anônima!')

hi()
```

Lembre-se: A função `print` é identada com quatro espaços dentro da declaração `if`. A razão disso é porque a função roda
quando a condição é satisfeita. Vamos ver como isso funciona agora:

{% filename %}command-line{% endfilename %}
```python
$ python3 python_intro.py
Traceback (most recent call last):
File "python_intro.py", line 10, in <module>
  hi()
TypeError: hi() missing 1 required positional argument: 'nome'
```

Opa! Um erro. Ainda bem que o Python sempre nos dá uma mensagem de erro clara. Ela nos informa que a função `hi()` (a que nós definimos) requer um argumento (chamado `nome`) e que nós nos esquecemos de
passá-lo quando chamamos a função. Vamos consertar isso no final do arquivo:

{% filename %}python_intro.py{% endfilename %}
```python
hi("Ana")
```

E execute o arquivo novamente:

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
Hi Ana!
```

E se nós mudarmos o nome?

{% filename %}python_intro.py{% endfilename %}
```python
hi("Sonja")
```

E executá-lo:

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
Hi Sonja!
```

Agora, o que você acha que irá acontecer se você escrever outro nome lá, como o que chamamos de argumento? (Nem Ana, nem Sonja.) Tente e veja se você está certa. Deveria colocar isso na tela:

{% filename %}command-line{% endfilename %}
```
Hi anônima!
```

Isso é incrível, não é? Dessa forma você não tem que repetir o código toda vez que você quiser trocar o nome da pessoa que a função deve cumprimentar. E é justamente por isso que nós precisamos de funções – você nunca quer repetir seu código!

Vamos fazer algo mais elaborado – existem muitos nomes, e escrever uma condição para cada um seria muito trabalhoso, não é?

{% filename %}python_intro.py{% endfilename %}
```python
def hi(nome):
    print('Hi ' + nome + '!')

hi("Rachel")
```

Vamos chamar o código agora

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
Hi Rachel!
```

Parabéns! Você acabou de aprender como escrever funções! :)

## Laços de repetição

> Leitoras em casa: essa parte está disponível no vídeo (em inglês) [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0).

Essa já é a última parte. Isso foi rápido, não? :)

Programadoras não gostam de ficar se repetindo. Programação é tudo sobre automatizar coisas, então nós não queremos cumprimentar cada pessoa por seu nome manualmente, certo? É aí que os laços de repetição entram em cena.

Ainda se lembra das listas? Vamos fazer uma lista de garotas:

{% filename %}python_intro.py{% endfilename %}
```python
garotas = ['Rachel', 'Monica', 'Phoebe', 'Ana', 'You']
```

Nós queremos cumprimentar todas elas por seus nomes. Nós temos a função `hi` para fazer isso, então vamos fazer isso com um laço de repetição:

{% filename %}python_intro.py{% endfilename %}
```python
for nome in garotas:
```

A declaração ```for``` se comporta  de maneira similar a da declaração ```if```; os dois códigos abaixo precisam estar
identados com quatro espaços.

Aqui está o código completo que irá para dentro do arquivo:

{% filename %}python_intro.py{% endfilename %}
```python
def hi(nome):
    print('Hi ' + nome + '!')

garotas = ['Rachel', 'Monica', 'Phoebe', 'Ana', 'You']
for nome in garotas:
    hi(nome)
    print('Próxima garota')
```

A nós rodamos ele:

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
Hi Rachel!
Próxima garota
Hi Monica!
Próxima garota
Hi Phoebe!
Próxima garota
Hi Ana!
Próxima garota
Hi You!
Próxima garota
```

Como você pode ver, tudo que você colocar dentro da declaração `for`, com a indentação (aqueles quatro espaços a partir da margem esquerda) será repetido para cada elemento da lista `garotas`.

Você também pode usar o `for` com números usando a função `range`:

{% filename %}python_intro.py{% endfilename %}
```python
for i in range(1, 6):
    print(i)
```

Que irá imprimir:

{% filename %}command-line{% endfilename %}
```
1
2
3
4
5
```

`range` é uma função que cria uma lista de números em sequência (esses números são fornecidos por você como parâmetros).

Note que o segundo desses números não é incluído na lista que é exibida pelo Python (o que significa que `range(1, 6)` conta de 1 até 5, não inclui o número 6). É por isso que "range" é meio aberta ("half-open"), e com isso nós queremos dizer que a função inclui o primeiro valor, mas não o último.

## Sumário

É isso. __Você arrebentou!__ Esse foi um capítulo exigente, então você deve se sentir orgulhosa. Nós definitivamente estamos orgulhosas de você chegar tão longe!

Você deve estar querendo, por um momento, fazer alguma outra coisa – alongar, dar uma volta por aí, descansar os olhos. Faça isso antes de passar para o próximo capítulo. :)

![Cupcake](images/cupcake.png)
