# Introdução à linha de comando

É emocionante, não?! Você vai escrever sua primeira linha de código em poucos minutos! :)

**Deixe-nos apresentá-la a sua primeira nova amiga: a linha de comando!**

As etapas a seguir mostrarão a você como usar a janela preta que todas hackers usam. Pode parecer um pouco assustador no começo, mas, na verdade, é apenas um *prompt* que espera por comandos seus.

## O que é uma linha de comando?

A janela, que normalmente é chamada de **linha de comando** ou **interface de linha de comando**, é um aplicativo baseado em texto para visualização, manipulação e manuseio de arquivos em seu computador (como por exemplo, o Windows Explorer ou o Finder no Mac, mas sem a interface gráfica). Outros nomes para a linha de comando são: *cmd*, *CLI*, *prompt*, *console* ou *terminal*.

## Abra a interface de linha de comando

Para começar alguns experimentos, precisamos abrir a nossa interface de linha de comando primeiro.

### Windows

<!--sec data-title="Windows" data-id="windows_prompt" data-collapse=true ces-->
Vá em Iniciar → Todos os Programas → Acessórios → Prompt de comando.
<!--endsec-->

### Mac OS X

<!--sec data-title="OS X" data-id="OSX_prompt" data-collapse=true ces-->
Applications → Utilities → Terminal.
<!--endsec-->

### Linux

<!--sec data-title="Linux" data-id="linux_prompt" data-collapse=true ces-->
Provavelmente você vai achar em Applications → Accessories → Terminal, mas isso depende do seu sistema operacional. Qualquer coisa é só procurar no Google. :)
<!--endsec-->

## Prompt

Agora você deve estar vendo uma janela branca ou preta que está à espera de seus comandos.

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->
Se você estiver num Mac ou Linux, você provavelmente verá um `$`, como este:
{% filename %}command-line{% endfilename %}
```
$
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_prompt2" data-collapse=true ces-->

No Windows, é um sinal de `>`, como este:

{% filename %}command-line{% endfilename %}
```
>
```
<!--endsec-->


Cada comando será antecedido por este sinal e um espaço, mas você não precisa digitá-lo. Seu computador fará isso por você :)

> Apenas uma pequena nota: no seu caso, talvez exista algo como `C:\Users\seunome>` ou `SeuNome-MacBook Air: ~ seunome$` antes do sinal do prompt e isto estará 100% correto. Neste tutorial nós apenas simplificaremos ele para o mínimo.

A parte que tem o `$` ou o `>` é chamada de prompt de linha de comando, ou para abreviar, prompt. Ele estará esperando você digitar alguma coisa.

## Seu primeiro comando (OBA!!)

Vamos começar com algo simples. Digite o seguinte comando:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->
{% filename %}command-line{% endfilename %}
```
$ whoami
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_whoami" data-collapse=true ces-->
{% filename %}command-line{% endfilename %}
```
> whoami
```
<!--endsec-->

Depois aperte o `Enter`. Essa é a nossa saída:

{% filename %}command-line{% endfilename %}
```
$ whoami
seunome
```

Como você pode ver, o computador acabou de apresentar seu nome de usuária. Elegante, né? :)

> Tente digitar cada comando, não copiar e colar. Você vai se lembrar mais facilmente dessa forma!

## O Básico

Cada sistema operacional tem o seu próprio conjunto de instruções para a linha de comando, então se certifique que você está seguindo as instruções do seu sistema operacional. Vamos tentar, certo?

### Pasta atual

Seria legal saber em que pasta estamos agora, certo? Vamos ver. Digite o seguinte comando e aperte o `enter`:


<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->


{% filename %}command-line{% endfilename %}
```
$ pwd
/Users/seunome
```

> Nota: 'pwd' quer dizer 'print working directory' (exiba o diretório que estamos trabalhando).

<!--endsec-->

Windows:

<!--sec data-title="Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
> cd
C:\Users\seunome
```
> Nota: 'cd' vem de 'change directory' (mude de diretório). Se seu Windows tem powershell, você pode usar pwd como no Linux ou Mac OS X.

<!--endsec-->

Provavelmente você vai ver algo parecido na sua máquina. Geralmente, uma vez que você abre a linha de comando, você já começa na pasta Home.


* * *

### Listando arquivos e pastas

Então o que tem ali? Seria legal descobrir. Vamos ver:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ ls
Applications
Desktop
Downloads
Music
...
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
> dir
 Directory of C:\Users\seunome
05/08/2014 07:28 PM <DIR>      Applications
05/08/2014 07:28 PM <DIR>      Desktop
05/08/2014 07:28 PM <DIR>      Downloads
05/08/2014 07:28 PM <DIR>      Music
...
```
<!--endsec-->

* * *

### Entrar em outra pasta

Talvez a gente queira entrar na nossa pasta Desktop?

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ cd Desktop
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_move_to" data-collapse=true ces-->


{% filename %}command-line{% endfilename %}
```
> cd Desktop
```
<!--endsec-->

Veja se realmente entramos na pasta:
<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ pwd
/Users/seunome/Desktop
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
> cd
C:\Users\seunome\Desktop
```
<!--endsec-->    

Aqui está!

> Dica de profissional: se você digitar `cd D` e apertar a tecla `tab` no seu teclado, a linha de comando irá preencher automaticamente o resto do nome para que você possa navegar rapidamente. Se houver mais de uma pasta que comece com "D", aperte a tecla `tab` duas vezes para obter uma lista de opções.

* * *

### Criando uma pasta

Que tal criar um diretório Django Girls na sua área de trabalho? Você pode fazer assim:


<!--sec data-title="OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ mkdir djangogirls
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_mkdir" data-collapse=true ces-->


{% filename %}command-line{% endfilename %}
```
> mkdir djangogirls
```
<!--endsec-->

Este comando vai criar uma pasta com o nome `djangogirls` no nosso desktop. Você pode verificar se ela está lá, só de olhar na sua área de trabalho ou executando um comando `ls` (Mac ou Linux) ou `dir` (Windows)! Experimente. :)

> Dica de profissional: Se você não quiser digitar o mesmo comando várias vezes, tente pressionar `seta para cima` e `seta para baixo` no teclado para percorrer comandos usados recentemente.

* * *

### Exercite-se!

Um pequeno desafio para você: dentro da pasta `djangogirls` que você acabou de criar, crie uma outra pasta chamada `teste`. Use os comandos `cd` e `mkdir`.

#### Solução:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ cd djangogirls
$ mkdir teste
$ ls
teste
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
> cd djangogirls
> mkdir teste
> dir
05/08/2014 07:28 PM <DIR>      teste
```
<!--endsec-->    

Parabéns! :)

* * *

### Limpando

Não queremos deixar uma bagunça, então vamos remover tudo o que fizemos até agora.

Primeiro precisamos voltar para a pasta Desktop:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ cd ..
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_back" data-collapse=true ces-->


{% filename %}command-line{% endfilename %}
```
> cd ..
```
<!--endsec-->

Usando `..` com o comando `cd` nós mudaremos do diretório atual para o diretório pai (que significa o diretório que contém o diretório atual).

Veja onde você está:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ pwd
/Users/seunome/Desktop
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd3" data-collapse=true ces-->


{% filename %}command-line{% endfilename %}
```
> cd
C:\Users\seunome\Desktop
```
<!--endsec-->

Agora é hora de excluir o diretório `djangogirls`.

> **Atenção**: A exclusão de arquivos usando `del`, `rmdir` ou `rm` é irrecuperável, isto significa que *Arquivos excluídos vão embora para sempre*! Então, tenha cuidado com este comando.

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ rm -r djangogirls
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_rmdir" data-collapse=true ces-->


{% filename %}command-line{% endfilename %}
```
> rmdir /S djangogirls
djangogirls, Are you sure <Y/N>? Y
```
<!--endsec-->

Pronto! Para ter certeza que a pasta foi realmente excluída, vamos checar:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ ls
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_dir2" data-collapse=true ces-->


{% filename %}command-line{% endfilename %}
```
> dir
```
<!--endsec-->

### Saindo

Por enquanto é isso! Agora você pode fechar a linha de comando com segurança. Vamos fazer do jeito hacker, certo? :)

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ exit
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_exit" data-collapse=true ces-->


{% filename %}command-line{% endfilename %}
```
> exit
```
<!--endsec-->    

Legal, não é? :)

## Sumário

Aqui vai uma lista de alguns comandos úteis:

| Comando (Windows) | Comando (Mac OS / Linux) | Descrição                     | Exemplo                                           |
| ----------------- | ------------------------ | ----------------------------- | ------------------------------------------------- |
| exit              | exit                     | Fecha a janela                | **exit**                                          |
| cd                | cd                       | Muda a pasta                  | **cd teste**                                       |
| dir               | ls                       | Lista as pastas e os arquivos | **dir**                                           |
| copy              | cp                       | Copia um arquivo              | **copy c:\teste\teste.txt c:\windows\teste.txt** |
| move              | mv                       | Move um arquivo               | **move c:\teste\teste.txt c:\windows\teste.txt** |
| mkdir             | mkdir                    | Cria uma pasta                | **mkdir pastateste**                           |
| del               | rm                       | Deleta uma pasta e/ou arquivo | **del c:\teste\teste.txt**                        |

Estes são apenas alguns dos poucos comandos que você pode executar em sua linha de comando, mas você não vai usar nada além disso hoje.

Se você estiver curiosa, [ss64.com](http://ss64.com) contém uma referência completa de comandos para todos os sistemas operacionais.

## Pronta?

Vamos mergulhar no Python!
