# Introdução à interface da linha de comandos

> For readers at home: this chapter is covered in the [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) video.

It's exciting, right?! You'll write your first line of code in just a few minutes! :)

**Vamos apresentar-te à tua primeira nova amiga: a linha de comandos!**

Os passos a seguir vão mostrar-te como usar a janela preta que todos os hackers usam. Pode parecer um pouco assustadora mas na verdade está só à espera que lhe dês comandos.

> **Note** Please note that throughout this book we use the terms 'directory' and 'folder' interchangeably but they are one and the same thing.

## O que é a linha de comandos?

A janela a que chamamos **linha de comandos**, é uma aplicação de texto para ver, controlar e alterar ficheiros no computador. It's much like Windows Explorer or Finder on the Mac, but without the graphical interface. Outros nomes para a linha de comandos são: *cmd*, *CLI*, *consola* ou *terminal*.

## Abre a interface da linha de comandos

Para começar precisamos primeiro de abrir a interface da linha de comandos.

<!--sec data-title="Opening: Windows" data-id="windows_prompt" data-collapse=true ces-->

Go to Start menu → Windows System → Command Prompt.

> On older versions of Windows, look in Start menu → All Programs → Accessories → Command Prompt.

<!--endsec-->

<!--sec data-title="Opening: OS X" data-id="OSX_prompt" data-collapse=true ces-->

Go to Applications → Utilities → Terminal.

<!--endsec-->

<!--sec data-title="Opening: Linux" data-id="linux_prompt" data-collapse=true ces-->

It's probably under Applications → Accessories → Terminal, but that may depend on your system. If it's not there, you can try to Google it. :)

<!--endsec-->

## Linha de Comandos

Deves estar agora a ver uma janela, preta ou branca, à espera que lhe dês comandos.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

If you're on Mac or Linux, you probably see `$`, like this:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

Em Windows, é um `>`:

{% filename %}command-line{% endfilename %}

    >
    

<!--endsec-->

Cada comando vai ter este sinal atrás seguido de um espaço, mas não tens que o escrever. O computador faz isso por ti. :)

> Just a small note: in your case there may be something like `C:\Users\ola>` or `Olas-MacBook-Air:~ ola$` before the prompt sign, and this is 100% OK.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. Ignore the left part and only type in the command, which starts after the prompt.

## O teu primeiro comando (YAY!)

Let's start by typing this command:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

E depois carrega no `enter`. Este é o nosso resultado:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

As you can see, the computer has just printed your username. Neat, huh? :)

> Try to type each command; do not copy-paste. You'll remember more this way!

## Básicos

Cada sistema operativo tem uma lista de comandos ligeiramente diferente dos outros, por isso verifica que estás a seguir as instruções certas para o teu sistema operativo. Vamos tentar isto.

### Directório actual

Era bom sabermos onde estamos, certo? Vamos ver. Escreve este comando e carrega no `enter`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Nota: 'pwd' quer dizer '*print working directory*', 'imprimir directório actual'.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Note: 'cd' stands for 'change directory'. With powershell you can use pwd just like on Linux or Mac OS X.

<!--endsec-->

Provavelmente vais ver algo parecido no teu computador. Quando abres a linha de comandos normalmente começas na pasta base do teu utilizador.

* * *

### Listar ficheiros e directórios

O que está dentro da pasta, então? Vamos descobrir:

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
    

> Note: In powershell you can also use 'ls' like on Linux and Mac OS X. <!--endsec-->

* * *

### Mudar de directório

Agora vamos para o directório Ambiente de Trabalho:

<!--sec data-title="Change current directory: OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd "Ambiente de Trabalho"
    

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd "Ambiente de Trabalho"
    

<!--endsec-->

Verifica que realmente mudaste:

<!--sec data-title="Check if changed: OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Ambiente de Trabalho
    

<!--endsec-->

<!--sec data-title="Check if changed: Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Ambiente de Trabalho
    

<!--endsec-->

Aqui está!

> PRO tip: if you type `cd D` and then hit `tab` on your keyboard, the command line will automatically fill in the rest of the name so you can navigate faster. If there is more than one folder starting with "D", hit the `tab` key twice to get a list of options.

* * *

### Criar directório

Que tal criares um directório para praticares no teu ambiente de trabalho? Podes fazê-lo assim:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir pratica
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir pratica
    

<!--endsec-->

Este comando vai criar uma pasta chamada `pratica` no teu ambiente de trabalho. You can check if it's there by looking on your Desktop or by running a `ls` or `dir` command! Tenta. :)

> Dica PRO: Se não quiseres estar sempre a escrever os mesmos comandos, tenta usar as setas para cima e para baixo no teu teclado para navegar os comandos utilizados recentemente.

* * *

### Exercício!

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

#### Solução:

<!--sec data-title="Exercise solution: OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd pratica
    $ mkdir teste
    $ ls
    teste
    

<!--endsec-->

<!--sec data-title="Exercise solution: Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd pratica
    > mkdir teste
    > dir
    05/08/2014 07:28 PM <DIR>      teste
    

<!--endsec-->

Boa! :)

* * *

### Limpeza

Não queremos deixar uma confusão, por isso vamos remover tudo o que criámos até aqui.

Primeiro, precisamos de voltar ao Ambiente de Trabalho:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

Verifica onde estás:

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

Agora vamos apagar o directório `pratica`:

> **Attention**: Deleting files using `del`, `rmdir` or `rm` is irrecoverable, meaning *the deleted files will be gone forever*! So be very careful with this command.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r pratica
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S pratica
    pratica, Are you sure <Y/N>? Y
    

<!--endsec-->

Feito! Para teres a certeza que apagaste mesmo:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Sair

That's it for now! You can safely close the command line now. Let's do it the hacker way, alright? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Cool, huh? :)

## Índice

Aqui está um sumário de alguns comandos úteis:

| Comando (Windows) | Comando (Mac OS / Linux) | Descrição                    | Exemplo                                           |
| ----------------- | ------------------------ | ---------------------------- | ------------------------------------------------- |
| sair              | sair                     | fechar a janela              | **sair**                                          |
| cd                | cd                       | mudar de directório          | **cd test**                                       |
| cd                | pwd                      | show the current directory   | **cd** (Windows) or **pwd** (Mac OS / Linux)      |
| dir               | ls                       | listar directórios/ficheiros | **dir**                                           |
| copy              | cp                       | copiar ficheiro              | **copy c:\test\test.txt c:\windows\test.txt** |
| move              | mv                       | mover ficheiro               | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir             | mkdir                    | criar um novo directório     | **mkdir testdirectory**                           |
| rmdir (or del)    | rm                       | delete a file                | **del c:\test\test.txt**                        |
| rmdir /S          | rm -r                    | delete a directory           | **rm -r testdirectory**                           |

Estes são apenas alguns dos comandos que podes usar na linha de comandos, mas não vais precisar de mais do que estes hoje.

Se estiveres curiosa, [ss64.com](http://ss64.com) contém uma lista completa de comandos para todos os sistemas operativos.

## Pronta?

Vamos começar a aprender Python!