{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# Introdução ao Python

> Parte deste capítulo é baseado no tutorial da Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Vamos escrever um pouco de código!

## Interpretador de Python

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
>>> "Olá " + "Ola"
'Olá Ola'
```

(Ola é o nome das duas criadoras do Django Girls!). Você também pode multiplicar strings por um número:

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

- **o prompt** -- digitar comandos (códigos) no interpretador de Python resulta em respostas em Python
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

Digitamos: nome igual Ola.

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
- a chave `country` aponta para `'Poland'` (outra `string`),
- e a chave `favorite_numbers` aponta para `[7, 42, 92]` (uma `list` com três números nela).

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

Você deve estar se perguntando quando deve usar um dicionário ou uma lista, certo? Boa pergunta! A resposta rápida é:

- Você precisa de uma sequência ordenada de itens? Use uma lista.
- Você precisa associar valores a chaves para poder procurá-los eficientemente (pela chave) mais tarde? Use um dicionário.

Dicionários, assim como listas, são *mutáveis*. Isso significa que eles podem ser alterados depois de criados. Você pode adicionar um novo par chave-valor a um dicionário depois de ele ser criado, por exemplo:

{% filename %}command-line{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

Como nas listas, usar a função `len()` em dicionários retorna o número de pares chave-valor contidos nele. Vá em frente e digite o comando:

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
- **variáveis** -- nomes para objetos que permitem que você programe facilmente e deixam seu código mais legível
- **listas** -- listas de objetos armazenados em uma ordem específica
- **dicionários** - objetos armazenados como pares chave-valor

Animada para a próxima parte? :)

## Compare coisas

> Para leitoras em casa: este capítulo é abordado no vídeo [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4).

Grande parte da programação consiste em comparar coisas. O que é mais fácil comparar? Números, é claro. Vamos ver como isso funciona:

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

Você deve estar se perguntando por que colocamos dois sinais de igual `==` lado a lado para comparar se os números são iguais. Nós usamos um único `=` para atribuir valores a variáveis. Você sempre, **sempre**, precisa colocar dois `==` se quiser verificar se as coisas são iguais. Também é possível afirmar que as coisas são diferentes. Para isso, usamos o símbolo `! =`, como mostrado no exemplo acima.

Dê ao Python mais duas tarefas:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

Vimos `>` e `<`, mas o que significam `>=` e `<=`? Leia da seguinte forma:

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

Você pode pedir ao Python para comprar quantos números você quiser, e ele vai te dar uma resposta! Espertinho, não é?

- **and** -- se você usar o operador `and`, as duas comparações terão que ser verdadeiras para que a expressão seja verdadeiro (True)
- **or** - se você usar o operador `or`, apenas uma das comparações precisa ser verdadeira para que a expressão seja verdadeira (True)

Já ouviu a expressão "comparar alhos com bugalhos"? Vamos tentar o equivalente em Python:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Aqui vemos que assim como na expressão, o Python não é capaz de comparar um número (`int`) e uma string (`str`). Em vez disso, ele mostrou um **TypeError** e nos disse que os dois tipos não podem ser comparados um ao outro.

## Booleano

Aliás, você acabou de aprender sobre um novo tipo de objeto em Python. Ele se chama **booleano**.

Existem apenas dois objetos booleanos:

- True (verdadeiro)
- False (falso)

Para que o Python entenda, você precisa escrever exatamente 'True' (primeira letra maiúscula e as outras minúsculas -- mas sem as aspas). **true, TRUE ou tRUE não vão funcionar -- só True está correto.** (A mesma coisa vale para 'False', obviamente.)

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

> Para leitoras em casa: este capítulo é abordado no vídeo [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk).

Até agora escrevemos todos os códigos no interpretador de Python, que nos limita a digitar uma linha por vez. Programas normais são salvos em arquivos e executados pelo nosso **interpretador** de linguagem de programação ou **compilador**. Até agora executamos nossos programas uma linha de cada vez no **interpretador** de Python. Vamos precisar de mais de uma linha de código para as próximas tarefas, então precisaremos rapidamente:

- Sair do interpretador de Python
- Abrir o editor de código de sua escolha
- Salvar algum código em um novo arquivo de Python
- Executar o código!

Para sair do interpretador de Python que estamos usando, simplesmente digite a função `exit()`

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

Isso vai levá-lo de volta ao prompt de comando.

Anteriormente, nós escolhemos um editor de código da seção [editor de código](../code_editor/README.md). Agora precisamos abrir o editor e escrever algum código em um novo arquivo:

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Agora você é um desenvolvedor Python bastante experiente, então sinta-se livre para escrever códigos com o que você aprendeu hoje.

Agora precisamos salvar o arquivo e dar a ele um nome descritivo. Vamos nomear o arquivo **python_intro.py** e salvá-lo na sua área de trabalho. Podemos chamá-lo como quisermos, mas é importante que o nome termine com **.py**. A extensão **.py** diz ao sistema operacional que esse é um **arquivo Python executável** e o interpretador de Python pode rodá-lo.

> **Observação**: Você deve reparar numa das coisas mais legais nos editores de código: cores! No interpretador de Python tudo é da mesma cor, mas agora você deve ver que a função `print` aparece em uma cor diferente da string que ela recebe como argumento. Isso é chamado de destaque de sintaxe ("syntax highlightning", do Inglês) e é uma funcionalidade muito útil quando estamos escrevendo código. As cores de cada elemento nos dão dicas sobre o código. Elas avisam, por exemplo, sobre strings que esquecemos de fechar ou palavras reservadas que digitamos errado (como `def` na definição de uma função, que veremos adiante). Esta é uma das razões pelas quais que nós usamos um editor de código. :)

Com o arquivo salvo, é hora de executá-lo! Com as habilidades que você aprendeu na seção sobre linhas de comando, use o terminal para **ir para os diretórios no desktop**.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Em um Mac, o comando é esse:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

No Linux, o comando é assim (a palavra "Desktop" pode estar traduzida para o português "Área de Trabalho"):

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

No prompt de comando Windows, é assim:

{% filename %}command-line{% endfilename %}

    > cd %HomePath%\Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

E no Windows Powershell, é assim:

{% filename %}command-line{% endfilename %}

    > cd $Home\Desktop
    

<!--endsec-->

Se você tiver alguma dificuldade, é só pedir ajuda.

Agora use o interpretador de Python para executar o código que está no arquivo, assim:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Observação: no Windows, 'python3' não é reconhecido como um comando. Em vez disso, use 'python' para executar o arquivo:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Muito bem! Você acabou de rodar seu primeiro programa em Python que foi salvo em um arquivo. Arrasou!

Agora você pode começar a aprender uma ferramenta essencial na programação:

## If … elif … else

Várias coisas em um código só podem ser executadas se determinadas condições forem atendidas. É por isso que o Python tem um comando chamado **if**.

Substitua o código no arquivo **python_intro.py** pelo seguinte:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
```

Se você salvar e executar esse código, verá um erro como este:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

O Python espera receber de nós instruções que devem ser executadas caso a condição `3 > 2` seja verdadeira (ou `True`). Vamos tentar fazer o Python mostrar na tela "Funciona!". Altere o código no seu arquivo **python_intro.py** para o seguinte:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('Funciona!')
```

Notou que o texto na linha seguinte ao "if" começa depois de quatro espaços? (Chamamos esse tipo de formatação de endentação). Precisamos dessa endentação para que o Python saiba quais linhas executar se a condição dentro do if for verdadeira. Você pode quantos espaços quiser, mas para que os códigos tenham uma aparência mais limpa e organizada, os programadores de Python costumam usar quatro. Uma tabulação conta como quatro espaços se você configurar seu editor de texto assim. Quando escolher quantos espaços usar, não mude! Se você já começou a endentar com quatro espaços, siga esse padrão em todo o código -- ou você poderá encontrar problemas.

Salve o código e execute outra vez:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
Funciona!
```

Observação: Lembre-se que no Windows 'python3' não é reconhecido como um comando. Se você usa esse sistema operacional, de agora em diante, substitua 'python3' 'python' para executar o arquivo.

### E se uma condição não for verdadeira?

Nos exemplos anteriores, o código foi executado somente quando as condições eram verdade. No entanto, o Python também tem as instruções `elif` e `mais`:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 é maior que 2')
else:
    print('5 não é maior que 2')
```

Quando esse código for executado, o Python mostrará:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    5 é maior que 2
    

Se 2 fosse um número maior que 5, o segundo comando seria executado. Fácil, né? Vamos ver como funciona o `elif`:

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

e executando:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Olá Sonja!
    

Viu o que aconteceu? O `elif` te possibilita adicionar uma condição que só vai ser executada se a primeira condição for falsa.

Você pode adicionar quantos `elif` quiser depois do `if`. Por exemplo:

{% filename %}python_intro.py{% endfilename %}

```python
volume = 57
if volume < 20: 
    print("Está um pouco baixo")
elif 20 <= volume < 40: 
    print("Está bom como música ambiente")
elif 40 <= volume < 60: 
    print("Perfeito, posso ouvir todos os detalhes")
elif 60 <= volume < 80: 
    print("Ótimo para festas!")
elif 80 <= volume < 100: 
    print("Está muito alto!")
else: 
    print("Meus ouvidos doem! :(")
```

O Python testa cada condição na sequência em que aparece no código e então mostra:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Perfeito, posso ouvir todos os detalhes
    

## Comentários

Comentários são linhas que começam com `#`. Você pode escrever o que quiser após o # `` e o Python vai ignorar. Comentários podem tornar seu código mais fácil para outras pessoas entenderem.

Vamos ver como isso funciona:

{% filename %}python_intro.py{% endfilename %}

```python
# Mudar o volume se estiver muito alto ou muito baixo
if volume < 20 or volume > 80
    volume = 50
    print("Bem melhor!")
```

Você não precisa escrever um comentário para cada linha de código, mas eles são úteis para explicar porque o seu código faz alguma coisa ou para fornecer um breve resumo de algo mais complexo.

### Sumário

Nos últimos exercícios você aprendeu:

- a **comparar coisas** -- em Python, você pode comparar objetos usando os operadores `>`, `>=`, `==`, `<=`, `<` e `and`, `or`.
- **Booleano** - um tipo de objeto que só tem dois valores possíveis: `True` ou `False`.
- a **salvar arquivos** -- armazenar código em arquivos para que você possa executar programas maiores.
- **if... elif... else** -- instruções que permitem que você execute o código somente se determinadas condições forem atendidas.
- **comentários** -- linhas que o Python não executa e que permitem que você documente seu código.

Chegamos à última parte do capítulo!

## Suas próprias funções!

> Para leitoras em casa: esta parte do capítulo é abordada no vídeo [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0).

Lembra de funções como `len()`? Boas notícias: agora você vai aprender como escrever suas próprias funções!

Uma função é um sequência de instruções que o Python deve executar. Cada função em Python começa com a palavra reservada `def` seguida de um nome e, opcionalmente, de uma lista de parâmetros. Vamos fazer uma tentativa. Substitua o código salvo no arquivo **python_intro.py** pelo seguinte:

{% filename %}python_intro.py{% endfilename %}

```python
def oi():
    print('Oi!')
    print('Tudo bem?')

oi()
```

Ok, nossa primeira função está pronta!

Reparou que escrevemos o nome da função no começo e no final do código? O Python lê e executa o código de cima para baixo, então para usar a nossa função, devemos chamá-la no final. So in order to use our function, we have to re-write it at the bottom.

Vamos executá-la agora e ver o que acontece:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi there!
    How are you?
    

Observação: se não funcionou, não entre em pânico! A saída vai te ajudar a entender o que aconteceu:

- Se você recebeu uma mensagem `NameError`, provavelmente foi um erro de digitação, então confira se você usou o mesmo nome ao criar a função com `def hi()` e quando a chamou no final com `hi()`.
- Se recebeu uma mensagem `IdentationError`, confira se as duas linhas de `print` têm o mesmo recuo no começo: o Python precisa que o código dentro da função esteja bem alinhado.
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