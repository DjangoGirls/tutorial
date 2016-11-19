# Introdução à linha de comando

É emocionante, não?! Você vai escrever sua primeira linha de código em poucos minutos :)

**Deixe-nos apresentá-lo ao seu primeiro novo amigo: a linha de comando!**

As etapas a seguir mostrarão a você como usar a janela preta que todos os hackers usam. Pode parecer um pouco assustador no começo, mas realmente é apenas um prompt esperando por comandos de você.

## Qual é a linha de comando?

A janela, que normalmente é chamada de **linha de comando** ou **interface de linha de comando**, é um aplicativo baseado em texto para visualização, manipulação e manuseio de arquivos em seu computador (como por exemplo, o Windows Explorer ou o Finder no Mac, mas sem interface gráfica). Outros nomes para a linha de comando são: *cmd*, *CLI*, *prompt*, *console* ou *terminal*.

## Abra a interface de linha de comando

Para começar alguns experimentos, precisamos abrir a nossa interface de linha de comando primeiro.

### Windows

Vá em Iniciar → Todos os Programas → Acessórios → Prompt de comando.

### Mac OS X

Applications → Utilities → Terminal.

### Linux

Provavelmente você vai achar em Applications → Accessories → Terminal, mas isso depende do seu sistema operacional. Qualquer coisa é só procurar no Google :)

## Prompt

Agora você deve ver uma janela branca ou preta que está à espera de seus comandos.

Se você estiver em Mac ou num Linux, você provavelmente verá um `` $, como este:

    $
    

No Windows, é um sinal de `>`, como este:

    >
    

Cada comando será antecedido por este sinal e um espaço, mas você não precisa digitá-lo. Seu computador fará isso por você :)

> Apenas uma pequena nota: no seu caso, talvez há algo como `C:\Users\ola>` ou `Olas-MacBook Air: ~ ola$` antes do sinal do prompt isto estará 100% correto. Neste tutorial nós apenas simplificaremos ele para o mínimo.

## Seu primeiro comando (YAY!)

Vamos começar com algo simples. Digite o seguinte comando:

    $ whoami
    

ou

    > whoami
    

Depois tecla Enter. Essa é nossa saída:

    $ whoami
    olasitarska
    

Como você pode ver, o computador só apresentou seu nome de usuário. Elegante, né?:)

> Tente digitar cada comando, não copiar e colar. Você vai se lembrar mais dessa forma!

## O Básico

Cada sistema operacional tem o seu próprio conjunto de instruções para a linha de comando, então se certifique que você está seguindo as instruções do seu sistema operacional. Vamos tentar, certo?

### Pasta atual

Seria legal saber em que pasta estamos agora, certo? Vamos ver. Digite o seguinte comando seguido de um enter:

    $ pwd
    /Users/olasitarska
    

Se você estiver no Windows:

    > cd
    C:\Users\olasitarska
    

Provavelmente você vai ver algo parecido na sua máquina. Um vez que você abre a linha de comando você já começa na pasta Home.

> Nota: 'pwd' significa 'print working directory'.

* * *

### Listando arquivos e pastas

Então o que tem nele? Seria legal descobrir. Vamos ver:

    $ ls
    Applications
    Desktop
    Downloads
    Music
    ...
    

Windows:

    > dir
     Directory of C:\Users\olasitarska
    05/08/2014 07:28 PM <DIR>      Applications
    05/08/2014 07:28 PM <DIR>      Desktop
    05/08/2014 07:28 PM <DIR>      Downloads
    05/08/2014 07:28 PM <DIR>      Music
    ...
    

* * *

### Entrar em outra pasta

Talvez a gente queira entrar na nossa pasta Desktop?

    $ cd Desktop
    

Windows:

    > cd Desktop
    

Veja se realmente entramos na pasta:

    $ pwd
    /Users/olasitarska/Desktop
    

Windows:

    > cd
    C:\Users\olasitarska\Desktop
    

Aqui está!

> Dica de profissional: se você digitar `cd D` e apertar a tecla `tab` no seu teclado, a linha de comando irá preencher automaticamente o resto do nome para que você possa navegar rapidamente. Se houver mais de uma pasta que comece com "D", aperte a tecla `tab` duas vezes para obter uma lista de opções.

* * *

### Criando uma pasta

Que tal criar um diretório Django Girls na sua área de trabalho? Você pode fazer assim:

    $ mkdir djangogirls
    

Windows:

    > mkdir djangogirls
    

Este comando vai criar uma pasta com o nome `djangogirls` no nosso desktop. Você pode verificar se ele está lá, só de olhar na sua área de trabalho ou executando um comando `ls` (Mac ou Linux) ou `dir` (Windows)! Experimente :)

> Dica de profissional: Se você não quiser digitar o mesmo comando várias vezes, tente pressionar `seta para cima` e `seta para baixo` no teclado para percorrer comandos usados recentemente.

* * *

### Exercite-se!

Um pequeno desafio para você: na sua mais nova pasta criada `djangogirls` crie uma outra pasta chamada `teste`. Use os comandos `cd` e `mkdir`.

#### Solução:

    $ cd djangogirls
    $ mkdir teste
    $ ls
    teste
    

Windows:

    > cd djangogirls
    > mkdir teste
    > dir
    05/08/2014 07:28 PM <DIR>      teste
    

Parabéns! :)

* * *

### Limpando

Não queremos deixar uma bagunça, então vamos remover tudo o que fizemos até agora.

Primeiro precisamos voltar para a pasta Desktop:

    $ cd ..
    

Windows:

    > cd ..
    

Fazendo `cd` para `..` nós mudaremos do diretório atual para o diretório pai (que significa o diretório que contém o diretório atual).

Veja onde você está:

    $ pwd
    /Users/olasitarska/Desktop
    

Windows:

    > cd
    C:\Users\olasitarska\Desktop
    

Agora é hora de excluir o diretório `djangogirls`.

> **Atenção**: A exclusão de arquivos usando `del`, `rmdir` ou `rm` é irrecuperável, significando *Arquivos excluídos vão embora para sempre*! Então, tenha cuidado com este comando.

    $ rm -r djangogirls
    

Windows:

    > rmdir /S djangogirls
    djangogirls, Tem certeza <S/N>? S
    

Pronto! Para ter certeza que a pasta foi excluída, vamos checar:

    $ ls
    

Windows:

    > dir
    

### Saindo

Por enquanto é isso! Agora você fechar a linha de comando com segurança. Vamos fazer do jeito hacker, certo?:)

    $ exit
    

Windows:

    > exit
    

Legal, né?:)

## Sumário

Aqui vai uma lista de alguns comandos úteis:

| Comando (Windows) | Comando (Mac OS / Linux) | Descrição                     | Exemplo                                           |
| ----------------- | ------------------------ | ----------------------------- | ------------------------------------------------- |
| exit              | exit                     | Fecha a janela                | **exit**                                          |
| cd                | cd                       | Muda a pasta                  | **cd test**                                       |
| dir               | ls                       | Lista as pastas e os arquivos | **dir**                                           |
| copy              | cp                       | Copia um arquivo              | **copy c:\test\test.txt c:\windows\test.txt** |
| move              | mv                       | Move um arquivo               | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir             | mkdir                    | Cria uma pasta                | **mkdir testdirectory**                           |
| del               | rm                       | Deleta uma pasta e/ou arquivo | **del c:\test\test.txt**                        |

Estes são apenas alguns dos poucos comandos que você pode executar em sua linha de comando, mas você não vai usar mais nada do que isto hoje.

Se você estiver curioso, [ss64.com][1] contém uma referência completa de comandos para todos os sistemas operacionais.

 [1]: http://ss64.com

## Pronto?

Vamos mergulhar no Python!
