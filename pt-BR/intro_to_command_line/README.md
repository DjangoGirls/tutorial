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

{% include "/intro_to_command_line/open_instructions.md" %}

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

A parte que vai até e inclui o `$` ou o `>` é chamada de *prompt de linha de comando*, ou *prompt*, de forma breve. Ele está pedindo que você digite algo.

No tutorial, quando quisermos que você digite um comando, incluiremos o `$` ou `>` e, algumas vezes, algum texto adicional à esquerda. Ignore o que está à esquerda e apenas digite o comando que inicia após o prompt.

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

E então pressione a tecla `enter`. Este é o resultado:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

Como você pode ver, o computador acabou de mostrar seu nome de usuário na tela. Legal, né? :)

> Tente escrever cada comando, não copie e cole. Assim você vai se lembrar melhor deles!

## O Básico

Cada sistema operacional tem o seu próprio conjunto de instruções para a linha de comando, então certifique-se de que você está seguindo as instruções do seu sistema operacional. Vamos tentar, certo?

### Pasta atual

Quer saber em que diretório está agora? Digite o seguinte comando e clique `enter`:

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
    

> Note: 'cd' stands for 'change directory'. With PowerShell you can use pwd just like on Linux or Mac OS X.

<!--endsec-->

Você provavelmente vai ver algo parecido em seu computador. A linha de comando geralmente inicia no diretório principal do usuário, também chamado de diretório "home", em Inglês.

* * *

### Aprenda mais sobre um comando

Muitos comandos que você digita no Prompt de comand possuem um painel de ajuda integrada que você pode abrir e ler! Por exemplo, para entender melhor sobre o comando do diretório atual:

<!--sec data-title="Command help: OS X and Linux" data-id="OSX_Linux_man" data-collapse=true ces-->

SO X e Linux tem um comando `man`, que ajuda você nos comandos. Tente `mand pwd` e veja o que ele diz, ou coloque `man` antes de outros comandos para ver seus menus de ajuda. A saída `man` é normalmente paginada. Use a barra de espaço para ir para a próxima página, e `q` para sair do menu de ajuda.

<!--endsec-->

<!--sec data-title="Command Help: Windows" data-id="windows_help" data-collapse=true ces-->

Colocando um sufixo `/?` para a maioria dos comandos, irá imprimir uma página de ajuda. Você pode precisar rolar a janela do seu comando para ver tudo. Tente `cd /?`.

<!--endsec-->

### Listando arquivos e pastas

Então, o que tem no seu computador? Vamos descobrir:

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
    05/08/2020 07:28 PM <DIR>      Applications
    05/08/2020 07:28 PM <DIR>      Desktop
    05/08/2020 07:28 PM <DIR>      Downloads
    05/08/2020 07:28 PM <DIR>      Music
    ...
    

> Note: In PowerShell you can also use 'ls' like on Linux and Mac OS X. <!--endsec-->

* * *

### Mudar a pasta atual

Agora vamos para a pasta Desktop:

<!--sec data-title="Change current directory: OS X" data-id="OSX_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Linux" data-id="Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

Note que o nome do diretório "Desktop" pode estar traduzido para a linguagem da sua conta Linux. Se for o caso, você irá precisar mudar `Desktop` para o nome traduzido; como exemplo, `Área de trabalho` em português.

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

Aqui está!

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

Esse pequeno comando criará uma pasta com o nome `practice` na sua área de trabalho. Você pode verificar se está lá ao olhar na sua Área de trabalho ou executando o comando `ls` ou `dir`! Experimente. :)

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
    05/08/2020 07:28 PM <DIR>      test
    

<!--endsec-->

Boa! :)

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

Pronto! Para ter certeza de que a pasta foi excluída, vamos checar:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Saindo

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

Esses são apenas alguns dos comandos que você pode executar na sua linha de comandos, mas você não irá utilizar outros por hoje.

Se estiver com curiosidade, [ss64.com](http://ss64.com) contém uma referência completa dos comandos de todos os sistemas operacionais.

## Pronta?

Vamos mergulhar no mundo do Python!