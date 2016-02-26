# Introdução ao Python

> Parte deste capítulo é baseado nos Tutoriais de Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Vamos escrever um pouco de código!

## Interpretador Python

Para começar a brincar com Python nós precisamos abrir uma *linha de comando* no seu computador. Você já deve saber como fazer isso -- você aprendeu isso no capítulo  [Introdução à Linha de Comando][2].
Assim que estiver pronto, siga as instruções abaixo.

Nós queremos abrir o Python num terminal, então digite `python3` e tecle Enter.

    $ python3
    Python 3.4.2 (...)
    Type "copyright", "credits" or "license" for more information.
    >>>
    

## Seu primeiro comando Python!

Depois de executar o comando Python, o prompt mudou para `>>>`. Para nós, isso significa que por enquanto só utilizaremos comandos na linguagem Python. Você não precisa digitar `>>>` - O Python fará isso por você.

Se você deseja sair do console do Python, apenas digite `exit()` ou use o atalho `Ctrl + Z` no Windows e `Ctrl + D` no Mac/Linux. Então você não vai ver mais o `>>>`.

Mas agora não queremos sair da linha de comando do Python. Queremos aprender mais sobre ele. Vamos, então, fazer algo muito simples. Por exemplo, tente digitar alguma operação matemática, como `2 + 3` e aperte Enter.

    >>> 2 + 3
    5
    

Incrível! Vê como a resposta simplesmente aparece? O Python conhece matemática! Você pode tentar outros comandos como: - `4 * 5` - `5 - 1` - `40 / 2`

Divirta-se com isso por um tempo e depois volte aqui :).

Como você pode ver, o Python é uma ótima calculadora. Se você está se perguntando o que mais você pode fazer...

## Strings

Que tal o seu nome? Digite seu primeiro nome entre aspas, desse jeito:

    >>> "Ola"
    'Ola'
    

Você acabou de criar sua primeira string! String é um sequência de caracteres que podem ser processada pelo computador. A string sempre precisa iniciar e terminar com o mesmo caractere. Este pode ser aspas duplas(`'`) ou simples(`"`) - elas dizem ao Python que o que está dentro delas é uma string.

Strings podem ser juntadas. Tente isto:

    >>> "Oi " + "Ola"
    'Oi Ola'
    

Você também pode multiplicar strings por um número:

    >>> "Ola" * 3
    'OlaOlaOla'
    

Se você precisa colocar uma apóstrofe dentro de sua string, existem duas maneiras de fazer.

Usando aspas duplas:

    >>> "Correndo' ladeira abaixo" 
    "Correndo' ladeira abaixo"
    

ou escapando apóstrofo com uma barra invertida (``):

    >>> "Correndo\' ladeira abaixo" 
    "Correndo' ladeira abaixo"
    

Legal, hein? Para ver seu nome em letras maiúsculas, basta digitar:

    >>> "Ola".upper()
    'OLA'
    

Você acabou de usar a **função** `upper` na sua string! Uma função (como `upper()`) é um conjunto de instruções que o Python realiza em um determinado objeto (`"Ola"`), sempre que você chamar por ele.

Se você quer saber o número de letras do seu nome, existe uma função para isso também!

    >>> len("Ola")
    3
    

Se perguntando porque algumas vezes você chama funções com um `.` no fim de uma string (como `"Ola".upper()`) e algumas vezes você primeiro chama a função colocando a string nos parênteses? Bem, em alguns casos, funções pertencem a objetos, como `upper()`, que só pode ser utilizada em strings. Nesse caso, nós chamamos a função de **método**. Outras vezes, funções não pertencem a nada específico e podem ser usadas em diferentes tipos de objetos, assim como `len()`. É por isso que nós estamos fornecendo `"Ola"` como um parâmetro para a função `len`.

### Sumário

OK, chega de strings. Até agora você aprendeu sobre:

*   **o prompt** - digitar comandos (códigos) no interpretador Python resulta em respostas em Python
*   **números e strings** - no Python, números são usados para matemática e strings para objetos de texto
*   **operadores** - como + e *, combinam valores para produzir um novo valor
*   **funções** - como upper() e len(), executam ações nos objetos.

Isso é o básico sobre todas as linguagens de programação que você aprende. Pronto para algo mais difícil? Apostamos que sim!

## Erros

Vamos tentar algo novo. Podemos obter o tamanho de um número da mesma forma que podemos encontrar o tamanho do nosso nome? Digite `len(304023)` e pressione Enter:

    >>> len(304023)
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: object of type 'int' has no len()
    

Temos nosso primeiro erro! Ele diz que objetos do tipo "int" (inteiros, apenas números) não têm nenhum comprimento. Então o que podemos fazer agora? Talvez possamos escrever nosso número como uma string? Strings têm um comprimento, certo?

    >>> len(str(304023))
    6
    

Funcionou! Usamos a função `str` dentro da função `len`. `str ()` converte tudo para strings.

*   A função `str` converte as coisas em **strings**
*   A função `int` converte as coisas em **números inteiros**

> Importante: podemos converter números em texto, mas nós não podemos, necessariamente, converter texto em números - o que `int('hello')` quer dizer?

## Variáveis

Um conceito importante na programação é o conceito de variáveis. Uma variável não é nada mais do que um nome para alguma coisa, de tal forma que você possa usá-la mais tarde. Os programadores usam essas variáveis para guardar dados, para fazer seus códigos mais legíveis e para não ter que se lembrar sempre o que algumas coisas significam.

Digamos que queremos criar uma nova variável chamada `nome`:

    >>> nome = "Ola"
    

Vê? É fácil! É só fazer: nome igual a Ola.

Como você percebeu, seu programa não retornou nada como fez anteriormente. Então como sabemos que a variável realmente existe? Simplesmente digite `nome` e tecle Enter:

    >>> nome
    'Ola'
    

Yippee! Sua primeira variável! :) Você sempre pode mudar o seu valor:

    >>> nome = "Sonja"
    >>> nome
    'Sonja'
    

Você pode usá-la também em funções:

    >>> len(nome)
    5
    

Incrível não? Claro, variáveis podem ser qualquer coisa, então podem ser números também! Tente isso:

    >>> a = 4
    >>> b = 6
    >>> a * b
    24
    

Mas, e se digitarmos o nome errado? Você consegue adivinhar o que aconteceria? Vamos tentar!

    >>> city = "Tokyo"
    >>> ctiy
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    NameError: name 'ctiy' is not defined
    

Um erro! Como você pode ver, Python tem diferentes tipos de erros e este é chamado **NameError**. Python dará este erro se você tentar usar uma variável que não foi definida ainda. Se você encontrar esse erro depois, veja se no seu código se você não digitou o nome de uma variável errado.

Brinque com isso por um tempo e veja o que você consegue fazer!

## A função print

Tente isso:

    >>> nome = 'Maria'
    >>> nome
    'Maria'
    >>> print(nome)
    Maria
    

Quando você apenas digita `nome`, o interpretador Python responde com a *representação* como string da variável 'name', que são as letras M-a-r-i-a, entre aspas simples. Quando você diz `print(nome)`, Python vai "imprimir" o conteúdo da variável na tela, sem as aspas, o que é mais puro.

Como veremos mais tarde, `print()` também é útil quando queremos imprimir algo dentro de funções, ou quando queremos imprimir algo em várias linhas.

## Listas

Além de strings e inteiros, o Python tem todos os tipos diferentes de objetos. Vamos apresentar um chamado **lista**. Listas são exatamente o que você acha que elas são: elas são objetos que são listas de outros objetos :)

Vá em frente e crie uma lista:

    >>> []
    []
    

Sim, esta é uma lista vazia. Não é muito, não é? Vamos criar uma lista dos números da loteria. Como não queremos ficar repetindo o código todo o tempo vamos criar uma variável para ela:

    >>> loteria = [3, 42, 12, 19, 30, 59]
    

Tudo certo, nós temos uma lista! O que podemos fazer com isso? Vamos ver quantos números de loteria existem nesta lista. Você tem ideia de qual função deve usar para isso? Você já sabe disso!

    >>> len(loteria)
    6
    

Sim! `len()` pode te dar o número de objetos que fazem parte de uma lista. Uma mão na roda, não? Vamos organizar isso agora:

    >>> loteria.sort()
    

Isso não retorna nada, apenas troca a ordem em que os números aparecem na lista. Vamos imprimir isso outra vez e ver o que acontece:

    >>> print(loteria)
    [3, 12, 19, 30, 42, 59]
    

Como você pode ver, os números na nossa lista estão ordenados do menor para o maior. Parabéns!

Talvez a gente queira inverter essa ordem? Vamos fazer isso!

    >>> loteria.reverse()
    >>> print(loteria)
    [59, 42, 30, 19, 12, 3]
    

Moleza né? Se você quiser adicionar alguma coisa à sua lista, você pode fazer isto digitando o seguinte comando:

    >>> loteria.append(199)
    >>> print(loteria)
    [59, 42, 30, 19, 12, 3, 199]
    

Se você quiser mostrar apenas o primeiro número você pode usar **índices**. Um índice é um número que diz onde um item da lista está. Os computadores gostam de iniciar a contagem por 0, então o primeiro objeto tem índice 0, o próximo tem índice 1 e por aí vai. Tente isso:

    >>> print(loteria[0])
    59
    >>> print(loteria[1])
    42
    

Como você pode ver, você pode acessar diferentes objetos na sua lista usando o nome da lista e o índice do objeto dentro dos colchetes.

Por diversão extra, tente alguns outros índices: 6, 7, 1000, -1, -6 ou -1000. Veja se você consegue prever o resultado antes de tentar o comando. Os resultados fazem sentido?

Você pode encontrar uma lista de todos os métodos disponíveis neste capítulo na documentação do Python: https://docs.python.org/3/tutorial/datastructures.html

## Dicionários

Um dicionário é semelhante a uma lista, mas você pode acessar valores através de uma chave ao invés de um índice. Uma chave pode ser qualquer string ou número. A sintaxe para definir um dicionário vazio é:

    >>> {}
    {}
    

Isso mostra que você acabou de criar um dicionário vazio. Hurra!

Agora, tente escrever o seguinte comando (tente substituir com as suas próprias informações também):

    >>> participante = {'nome': 'Ola', 'pais': 'Polonia', 'numeros_favoritos': [7, 42, 92]}
    

Com esse comando, você acabou de criar uma variável chamada `participant` com três pares de chave-valor:

*   A chave `nome` aponta para o valor `'Ola'` (um objeto `string`),
*   `pais` aponta para `'Polonia'` (outra `string`),
*   e `numeros_favoritos` apontam para `[7, 42, 92]` (uma `list` com três números nela).

Você pode checar o conteúdo de chaves individuais com a sintaxe:

    >>> print(participante['nome'])
    Ola
    

Veja, é similar a uma lista. Mas você não precisa lembrar o índice - apenas o nome.

O que acontece se pedirmos ao Python o valor de uma chave que não existe? Você consegue adivinhar? Vamos tentar e descobrir!

    >>> participante['idade']
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    KeyError: 'idade'
    

Olha, outro erro! Esse é um **KeyError**. Python é bastante prestativo e te diz que a chave `'idade'` não existe nesse dicionário.

Quando usar um dicionario ou uma lista? Bem, um bom ponto para refletir. Pense em uma solução antes de olhar a resposta na próxima linha.

*   Você precisa de uma sequência ordenada de itens? Use uma list.
*   Você precisa associar valores com chaves, assim você pode procurá-los eficientemente (pela chave) mais tarde? Use um dictionary.

Dicionários, como listas, são *mutáveis*, ou seja, que podem ser mudados depois que são criados. Você pode adicionar novos pares de chave/valor para o dicionário após sua criação, como:

    >>> participante['linguagem_favorita'] = 'Python'
    

Como as lists, usar o método `len()` em dicionários retorna o número de pares chave-valor no dicionario. Vá em frente e digite o comando:

    >>> len(participante)
    4
    

Espero que agora faça sentido até agora. :) Pronta para mais diversão com dicionários? Pule na próxima linha para coisas incríveis.

Você pode usar o comando `del` para deletar um item no dicionario. Digamos, se você quer excluir a entrada correspondente a chave `'numeros_favoritos'`, basta digitar o seguinte comando:

    >>> del participante['numeros_favoritos']
    >>> participante
    {'pais': 'Polonia', 'linguagem_favorita': 'Python', 'nome': 'Ola'}

Como você pode ver no retorno, o par chave-valor correspondente à chave 'numeros_favoritos' foi excluído.

Além disso você pode mudar o valor associado com uma chave já criada no dicionário. Digite:

    >>> participante['pais'] = 'Alemanha'
    >>> participante
    {'pais': 'Alemanha', 'linguagem_favorita': 'Python', 'nome': 'Ola'}

Como você pode ver, o valor da chave `'pais'` foi alterado de `'Polonia'` para `'Alemanha'`. :) Emocionante? Hurra! Você acabou de aprender outra coisa incrível.

### Sumário

Incrível! Agora você sabe muito sobre programação. Nesta última parte você aprendeu sobre:

*   **erros** - agora você sabe como ler e entender erros que aparecem se o Python não entender um comando que você deu
*   **variáveis** - nomes para objetos que permitem você programar facilmente e deixar seu código mais legível
*   **listas** - listas de objetos armazenados em uma ordem específica
*   **dicionários** - objetos armazenados como pares chave-valor

Empolgado(a) para o próximo passo? :)

## Compare coisas

Grande parte da programação consiste em comparar coisas. O que é mais fácil de comparar? Números, é claro. Vamos ver como isso funciona:

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
    

Demos ao Python alguns números para comparar. Como você pode ver, Python pode comparar não só números mas também resultados de métodos. Legal, hein?

Você está se perguntando por que colocamos dois sinais de igual `==` lado a lado para comparar se os números são iguais? Nós usamos um único `=` para atribuir valores a variáveis. Você sempre, **sempre** precisa colocar dois `==` se quiser verificar se as coisas são iguais. Também é possível afirmar que as coisas são desiguais entre si. Para isso, usamos o símbolo `! =`, conforme mostrado no exemplo acima.

Dê ao Python mais duas tarefas:

    >>> 6 >= 12 / 2
    True
    >>> 3 <= 2
    False
    

`>` e `<` são fáceis, mas o que `>=` e `<=` significam? Leia eles da seguinte forma:

*   x `>` y significa: x é maior que y
*   x `<` y significa: x é menor que y
*   x `< =` y significa: x é menor ou igual a y
*   x `>=` y significa: x é maior ou igual a y

Fantástico! Quer mais? Tente isto:

    >>> 6 > 2 and 2 < 3
    True
    >>> 3 > 2 and 2 < 1
    False
    >>> 3 > 2 or 2 < 1
    True
    

Você pode dar ao Python quantos números para comparar quanto você quiser, e ele vai te dar uma resposta! Espertinho, certo?

*   **and** - se você usar o operador `and`, ambas as comparações terão que ser verdadeiras para que todo o comando seja verdadeiro
*   **or** - se você usar o operador `or`, apenas uma das comparações precisa ser verdadeira para que o comando todo seja verdadeiro

Já ouviu a expressão "comparar maçãs com laranjas"? Vamos tentar o equivalente em Python:

    >>> 1 > 'django'
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: unorderable types: int() > str()
    

Aqui vemos que assim como na expressão, Python não é capaz de comparar um número (`int`) e uma string (`str`).
Em vez disso, ele mostrou um <strong>TypeError</strong> e nos disse que os dois tipos não podem ser comparados juntos.</p>

<h2>Booleano</h2>

<p>Acidentalmente, você aprendeu sobre um novo tipo de objeto em Python. É chamado de <strong>booleano</strong> -- e provavelmente o tipo mais fácil que existe.</p>

<p>Existem apenas dois objetos booleanos: - True (verdadeiro) - False (falso)</p>

<p>Mas para o Python entender isso, você precisa sempre escrever True (primeira letra maiúscula, com o resto das letras em minúsculo). <strong>true, TRUE, tRUE não vai funcionar -- só True é correto.</strong> (O mesmo se aplica ao False, claro.)</p>

<p>Booleanos podem ser variáveis também! Veja:</p>

```
>>> a = True
>>> a
True
```

Você também pode fazer desse jeito:

```
>>> a = 2 > 5
>>> a
False
```

Pratique e divirta-se com os valores booleanos, tentando executar os seguintes comandos:

*   `True and True`
*   `False and True`
*   `True or 1 == 1`
*   `1 != 2`

Parabéns! Booleanos são um dos recursos mais interessantes na programação, e você acabou de aprender como usá-los!

# Salvá-lo!

Até agora nós escrevemos todo nosso código em um interpretador python, que nos limita a uma linha de código em um momento. Programas normais são salvos em arquivos e executados pelo nosso **interpretador** de linguagem de programação ou **compilador**. Até agora já corremos nossos programas de uma linha de cada vez no **interpretador** Python. Nós vamos precisar de mais de uma linha de código para as próximas tarefas, então precisaremos rapidamente:

*   Saída do interpretador Python
*   Abra seu editor de código de sua escolha
*   Salvar algum código em um novo arquivo de python
*   Executá-lo!

Para sair do interpretador Python que estamos usando, simplesmente digite o ~~~ exit() ~~~ função:

    >>> exit()
    $
    

Isso vai colocá-la no prompt de comando.

Anteriormente, nós escolhemos um editor de código da seção do [editor de código][4]. Nós precisamos abrir o editor agora e escrever algum código em um novo arquivo:
```python
print('Hello, Django girls!')
```

> **Nota** Você deve observar que uma das coisas mais legais sobre editores de código: cores! No console do Python, tudo era da mesma cor, mas agora você deve ver que a função de `Imprimir` é uma cor diferente da sequência de caracteres no seu interior. Isso é chamado de "realce de sintaxe", e é uma ajuda muito útil quando está programando. Perceba a cor das coisas e você vai obter uma dica para quando você esquecer de fechar uma seqüência de caracteres, ou fazer um erro de digitação em um nome de palavra-chave (como `def` em uma função, que veremos abaixo). Esta é uma das razões pelas quais que nós usamos um editor de código :)

Obviamente, você é um desenvolvedor python bastante experiente agora, então sinta-se livre para escrever um código que você aprendeu hoje.

Agora temos de salvar o arquivo e dê um nome descritivo. Vamos chamar o arquivo **python_intro.py** e salve-o em seu desktop. Podemos nomear o arquivo tudo o que quisermos, o importante aqui é ter certeza que o arquivo termina no **py**, isto diz nosso computador, que é um **arquivo executável de python** e Python pode executá-lo.

Com o arquivo salvo, é hora de executá-lo! Usando as habilidades que você aprendeu na seção de linha de comando, use o terminal **altere os diretórios** para o desktop.

Em um Mac, o comando será parecido com isto:

    cd /Users/<your_name>/Desktop
    

No Linux, será assim (a palavra "Desktop" pode ser traduzido para seu idioma):

    cd /home/<your_name>/Desktop
    

E no windows, vai ser assim:

    cd C:\Users\<your_name>\Desktop
    

Se você ficar preso, só pedir ajuda.

e, em seguida, usar o Python para executar o código no arquivo assim:

    $ python3 python_intro.py
    Hello, Django girls!
    

Tudo bem! Você acabou de seu primeiro programa em python que foi salvo em um arquivo. Se sente ótima?

Você pode agora passar para uma ferramenta essencial na programação:

## if...elif...else

Muitas coisas no código só podem ser executadas se determinadas condições forem atendidas. É por isso que o Python tem alguma coisa chamada **declaração if**.

Substitua o código no arquivo **python_intro.py** para isto:

```python
if 3 > 2:
```    

Se salvou este e ele foi executado, nós veríamos um erro como este:

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

Python espera que fornecemos mais instruções que serão supostamente executadas caso a condição `3 > 2` venha a ser verdadeira (ou `True` nesse caso). Vamos tentar fazer o Python imprimir "It works!". Altere o seu código no seu arquivo **python_intro.py** para isto:

```python
if 3 > 2:
    print('It works!')
```
Você percebeu que identamos a próxima linha com 4 espaços? Precisamos fazer isso para que o Python saiba qual código será executado se o resultado for True. Você pode fazer com 1 espaço, mas quase todos os programadores Python fazem com 4 para deixar as coisas arrumadas. Um único tab também vai contar como 4 espaços.

Salvá-lo e execute novamente:

    $ python3 python_intro.py
    It works!
    

### E se não?

Nos exemplos anteriores, o código foi executado somente quando as condições eram verdade. Mas o Python também tem instruções `elif` e `else`:

```python
if 5 > 2:
    print('5 é realmente maior que 2')
else:
    print('5 não é maior que 2')
```

Quando for executado irá imprimir:

    $ python3 python_intro.py
    5 é realmente maior que 2
    

Se 2 for um número maior do que 5, então o segundo comando será executado. Fácil, né? Vamos ver como funciona o `elif`:

```python
name = 'Sonja'
if name == 'Ola':
    print('Hey Ola!')
elif name == 'Sonja':
    print('Hey Sonja!')
else:
    print('Hey anonymous!')
``` 

e executado:

    $ python3 python_intro.py
    Hey Sonja!
    

Viu o que aconteceu?

### Sumário

Nos últimos três exercícios você aprendeu:

*   **comparar as coisas** - em Python, você pode comparar as coisas usando os operadores `>`, `>=`, `==`, `<=`, `<` e o `and`, `or`
*   **Booleano** - um tipo de objeto que só tem um dos dois valores: `True` ou `False`
*   **Salvando arquivos** - armazenamento de código em arquivos assim você pode executar programas maiores.
*   **if... elif... else** - instruções que permitem que você execute o código somente se determinadas condições forem atendidas.

É hora da última parte deste capítulo!

## Suas próprias funções!

Se lembra de funções como `len()` que você pode executar no Python? Bem, boas notícias, agora você vai aprender a escrever suas próprias funções!

Uma função é um sequência de instruções que o Python deve executar. Cada função em Python começa com a palavra-chave `def`, seguido de um nome para a função e opcionalmente uma lista de parâmetros. Vamos começar com uma função simples. Substitua o código no **python_intro.py** com o seguinte:

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
``` 

Ok, nossa primeira função está pronta!

Você pode se perguntar por que escrevemos o nome da função na parte inferior do arquivo. Isto é porque Python lê o arquivo e executa de cima para baixo. Então, para usar a nossa função, temos re-escrevê-lo na parte inferior.

Vamos executa-lo agora e ver o que acontece:

    $ python3 python_intro.py
    Hi there!
    How are you?
    

Isso foi fácil! Vamos construir nossa primeira função com parâmetros. Usaremos o exemplo anterior - uma função que diz 'hi' para quem o executa - com um name:

```python
def hi(name):
``` 

Como você pode ver, agora demos um parâmetro chamado `name` para nossa função:

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

Como você pode ver, nós precisamos colocar dois espaços antes da função `print`, porque `if` precisa saber o que deve acontecer quando a condição for atendida. Vamos ver como isso funciona agora:

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

Oops, um erro. Felizmente, Python nos fornece uma mensagem de erro bastante útil. Ela diz que a função `hi()` (aquela que declaramos) tem um argumento obrigatório (chamado `name`) e que nós esquecemos de passá-lo ao chamar a função. Vamos corrigi-lo na parte inferior do arquivo:

```python
hi("Ola")
```

e execute novamente:

    $ python3 python_intro.py
    Hi Ola!
    

E se mudarmos o nome?

```python
hi("Sonja")
``` 

e executá-lo:

    $ python3 python_intro.py
    Hi Sonja!
    

Agora, o que acha que vai acontecer se você escrever outro nome lá? (Sem ser Ola ou Sonja) Experimentá-lo e ver se você está certo. Ele deve imprimir isto:

    Hi anonymous!
    

Isto é incrível, não? Dessa maneira você não precisa se repetir (DRY - don't repeat yourself, ou em português, não se repita) cada vez que for mudar o nome da pessoa que a função pretende cumprimentar. E é exatamente por isso que precisamos de funções - você nunca quer repetir seu código!

Vamos fazer algo mais inteligente..--existem mais que dois nomes, e escrever uma condição para cada um seria difícil, certo?

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
``` 

Vamos chamar o código agora:

    $ python3 python_intro.py
    Hi Rachel!
    

Parabéns! Você acabou de aprender a criar funções :)!

## Laços

Já é a última parte. Foi rápido, não? :)

Como mencionamos, os programadores são preguiçosos, não gostam de repetir as mesmas coisas. Programação fala sobre como automatizar as coisas, então não queremos cumprimentar cada pessoa pelo seu nome manualmente, certo? É aí onde os laços vem a calhar.

Ainda se lembra das listas? Vamos fazer uma lista de garotas:

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

Queremos cumprimentar todas elas pelos seus nomes. Temos a função `hi` para fazer isso, então vamos usá-la em um loop:

```python
for name in girls:
```

O ~~~ for ~~~ declaração se comporta da mesma forma para o ~~~ if ~~~ declaração, código abaixo esses dois precisam ser recuados quatro espaços.

Aqui está o código completo que será salvo no arquivo:

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

e quando executá-lo:

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

```python
for i in range(1, 6):
    print(i)
```  

Que iria imprimir:

    1
    2
    3
    4
    5
    

`range` é uma função que cria uma lista de números que se seguem um após o outro (esses números são dados por você como parâmetros).

Note que o segundo desses dois números não está incluído na lista que o Python mostrou (em `range(1, 6)`, conta de 1 a 5, mas o 6 não é incluído).

## Sumário

É isso. **Você é totalmente demais!** Não é tão fácil, então você deve se sentir orgulhosa de si mesma. Estamos definitivamente orgulhosas de você por ter chegado até aqui!

Talvez você queira brevemente fazer algo mais - espreguiçar, andar um pouco, descansar os olhos - antes de ir para o próximo capítulo. :)

![Cupcake](images/cupcake.png)

 [2]: /intro_to_command_line/README.html
 [4]: ../code_editor/README.md
