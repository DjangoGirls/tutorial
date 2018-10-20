# Introdução à linha de comando

> Para as leitoras em casa: este capítulo é coberto no vídeo [Sua nova amiga: a linha de comando](https://www.youtube.com/watch?v=jvZLWhkzX-8).

É emocionante, não?! Em poucos minutos você vai escrever sua primeira linha de código! :)

**Vamos apresentá-la à sua primeira nova amiga: a linha de comando!**

As etapas a seguir mostrarão como usar a janela preta que todos os hackers usam. Pode parecer um pouco assustador no começo, mas é apenas um prompt esperando por comandos.

> **Observação:** Note que ao longo deste tutorial, intercalamos o uso dos termos 'diretório' e 'pasta', mas eles significam a mesma coisa.

## O que é a linha de comando?

A janela, que geralmente é chamada de **linha de comando** ou **interface de linha de comando**, é uma aplicação de texto para ver e manipular arquivos em seu computador. É como o Windows Explorer ou o Finder no Mac, mas sem a interface gráfica. Outros nomes para a linha de comando são: *cmd*, *CLI*, *prompt*, *console* ou *terminal*.

## Abra a interface de linha de comando

Para começar alguns experimentos, precisamos abrir a nossa interface de linha de comando.

<!--sec data-title="Opening: Windows" data-id="windows_prompt" data-collapse=true ces-->

Vá para Menu iniciar → Sistema do Windows → Prompt de comando.

> Em versões antigas do Windows, procure em Menu iniciar → Todos programas → Acessórios → Prompt de comando.

<!--endsec-->

<!--sec data-title="Opening: OS X" data-id="OSX_prompt" data-collapse=true ces-->

Vá para Aplicações → Utilidades → Terminal.

<!--endsec-->

<!--sec data-title="Opening: Linux" data-id="linux_prompt" data-collapse=true ces-->

Provavelmente você vai encontrá-la em Aplicativos → Acessórios → Terminal, mas depende do seu sistema operacional. Qualquer coisa, é só procurar no Google. :)

<!--endsec-->

## Prompt

Agora você deve ver uma janela branca ou preta que está à espera de seus comandos.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Se você está usando Mac ou Linux, você provavelmente verá um `$`, como esse:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

No Windows, você provavelmente verá um `>`, assim:

{% filename %}command-line{% endfilename %}

    >
    

Dê uma olhada na seção Linux logo acima -- você verá algo mais como isso quando você chegar ao PythonAnywhere depois no tutorial.

<!--endsec-->

Cada comando vai ser precedido por um `$` ou `>` e um espaço, mas você não deve digitar isso. Seu computador vai fazer isso por você. :)

> Uma pequena observação: pode ser que apareça algo como `C:\Users\ola>` ou `Olas-MacBook-Air:~ ola$` antes do cursor e isso está 100% correto.

Até a parte que inclui o `$` ou o `>` é chamada de *linha de comando prompt *, ou simplesmente *prompt*. Ele está incentivando você a inserir algo ali.

No tutorial, quando queremos que você digite algo em um comando, vamos incluir `$` ou `>`, e por vezes mais a esquerda. Ignore a parte esquerda e apenas digite no comando, que começa depois do prompt.

## Seu primeiro comando (Uhuu!)

Vamos começar digitando este comando:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

Então aperte `enter`. Esse é o nosso resultado:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

As you can see, the computer has just printed your username. Neat, huh? :)

> Tente escrever cada comando, não copie e cole. Assim você vai se lembrar melhor deles!

## O Básico

Cada sistema operacional tem uma série de comandos um pouco diferentes para a linha de comando, então tenha certeza de seguir as instruções do seu sistema operacional. Vamos tentar?

### Pasta atual

Seria bom saber onde nós estamos agora, certo? Vamos ver. Digite esse comando e aperte `enter`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Observação: 'pwd' significa 'print working directory' (imprima/mostre o diretório de trabalho).

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Observação: 'cd' significa 'change directory' em inglês, o que se traduz para 'mudar de diretório'. Com o powershell, você pode utilizar pwd da mesma forma como no Linux ou Mac OS X.

<!--endsec-->

Você provavelmente verá algo similar na sua máquina. Uma vez que você abre a linha de comando você geralmente começa em sua pasta de usuário local, conhecido como "home".

* * *

### Aprenda mais sobre um comando

Muitos comandos que você digita no Prompt de comand possuem um painel de ajuda integrada que você pode abrir e ler! Por exemplo, para entender melhor sobre o comando do diretório atual:

<!--sec data-title="Command help: OS X and Linux" data-id="OSX_Linux_man" data-collapse=true ces-->

SO X e Linux tem um comando `man`, que ajuda você nos comandos. Tente `mand pwd` e veja o que ele diz, ou coloque `man` antes de outros comandos para ver seus menus de ajuda. A saída `man` é normalmente paginada. Use a barra de espaço para ir para a próxima página, e `q` para sair do menu de ajuda.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_help" data-collapse=true ces-->

Colocando um sufixo `/?` para a maioria dos comandos, irá imprimir uma página de ajuda. Você pode precisar rolar a janela do seu comando para ver tudo. Tente `cd /?`.

<!--endsec-->

### Listando arquivos e pastas

So what's in it? It'd be cool to find out. Let's see:

<!--sec data-title="List files and directories: OS X and Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    Applications
    Desktop
    Downloads
    Music
    ...
    

<!--endsec-->

<!--sec data-title="List files and directories: Windows" data-id="windows_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
     Directory of C:\Users\olasitarska
    05/08/2014 07:28 PM <DIR>      Applications
    05/08/2014 07:28 PM <DIR>      Desktop
    05/08/2014 07:28 PM <DIR>      Downloads
    05/08/2014 07:28 PM <DIR>      Music
    ...
    

> Observação: No powershell, você também pode usar 'ls' como no Linux e Mac OS X. <!--endsec-->

* * *

### Mudar a pasta atual

Agora, vamos para nossa pasta Desktop (Área de Trabalho):

<!--sec data-title="Change current directory: OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Verifique se realmente mudamos de pasta:

<!--sec data-title="Check if changed: OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check if changed: Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

Here it is!

> Dica de profissional: se você digitar `cd D` e apertar a tecla `tab` no seu teclado, a linha de comando preencherá automaticamente o resto do nome para que você possa navegar rapidamente. Se houver mais de uma pasta cujo nome comece com "D", aperte a tecla `tab` duas vezes para obter uma lista de opções.

* * *

### Criando Pastas

Que tal criar uma pasta para praticarmos em sua área de trabalho? Você pode fazer assim:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

Esse pequeno comando criará uma pasta com o nome `practice` na sua área de trabalho. Você pode verificar se está la olhando na sua Área de trabalho ou executando o comando `ls` ou `dir`! Try it. :)

> Dica de profissional: Se você não quiser digitar o mesmo comando várias vezes, tente pressionar `seta para cima` e `seta para baixo` no teclado para percorrer comandos usados recentemente.

* * *

### Pratique!

Um pequeno desafio para você: em sua recém criada pasta `practice`, crie uma pasta chamada `test`. (Use os comandos `cd` e `mkdir`.)

#### Solução:

<!--sec data-title="Exercise solution: OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd practice
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Exercise solution: Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd practice
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test
    

<!--endsec-->

Congrats! :)

* * *

### Arrumando

Nós não queremos que você deixe uma bagunça, então vamos remover tudo que fizemos até aqui.

Primeiro, precisamos voltar para a Área de trabalho:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Usando o comando `..` com o `cd` irá mudar sua pasta atual para o diretório pai (ou seja, a pasta que contém sua pasta atual).

Verifique onde você está:

<!--sec data-title="Check location: OS X and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check location: Windows" data-id="windows_cd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

Agora é hora de deletar a pasta `practice`:

> **Atenção**: A exclusão de arquivos usando `del`, `rmdir` ou `rm` é irreversível; ou seja, os *arquivos excluídos são perdidos para sempre*! Então, tenha cuidado com este comando.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

Done! To be sure it's actually deleted, let's check it:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Exit

Isso é tudo por agora! Você pode fechar a janela da sua linha de comando agora sem medo. Vamos fazer isso do jeito hacker, certo? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Massa, né? :)

## Sumário

Aqui vai uma lista com alguns comandos úteis:

| Comando (Windows) | Comando (Mac OS / Linux) | Descrição                     | Exemplo                                            |
| ----------------- | ------------------------ | ----------------------------- | -------------------------------------------------- |
| exit              | exit                     | Fecha a janela                | **exit**                                           |
| cd                | cd                       | Muda a pasta                  | **cd test**                                        |
| cd                | pwd                      | Mostra o diretório atual      | **cd** (Windows) ou **pwd** (Mac OS / Linux)       |
| dir               | ls                       | Lista as pastas e/ou arquivos | **dir**                                            |
| copy              | cp                       | Copia um arquivo              | **copy c:\test\test.txt c:\windows\test.txt**  |
| move              | mv                       | Move um arquivo               | **move c:\test\test.txt c:\windows\test.txt**  |
| mkdir             | mkdir                    | Cria uma pasta                | **mkdir testdirectory**                            |
| rmdir (ou del)    | rm                       | Exclui arquivo                | **del c:\test\test.txt**                         |
| rmdir /S          | rm -r                    | Exclui diretório              | **rm -r testdirectory**                            |
| [CMD] /?          | man [CMD]                | obtém ajuda para um comando   | **cd /?** (Windows) or **man cd** (Mac OS / Linux) |

Essas são apenas alguns poucos comandos que você pode executar em sua linha de comando, mas você não irá usar nada mais que isso hoje.

Se você é curiosa, [ss.com](http://ss64.com) contém uma referência completa de comandos para todos os sistemas operacionais.

## Pronta?

Vamos mergulhar no mundo do Python!