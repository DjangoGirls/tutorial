# Знакомство с командной строкой

> For readers at home: this chapter is covered in the [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) video.

It's exciting, right?! You'll write your first line of code in just a few minutes! :)

**Позволь представить нашего первого нового друга: командную строку!**

Следующие шаги покажут как использовать черное окно, которым пользуются все хакеры. В начале оно может показаться немного пугающим, но, на самом деле это просто окно, которое ждет от тебя команды.

> **Note** Please note that throughout this book we use the terms 'directory' and 'folder' interchangeably but they are one and the same thing.

## Что такое командная строка?

Окно, которое обычно называют **командной строкой** или **интерфейсом командной строки (англ. CLI, Command Line Interface)**, является текстовым приложением для просмотра, обработки и манипулирования файлами на вашем компьютере. It's much like Windows Explorer or Finder on the Mac, but without the graphical interface. Другими названиями для командной строки являются: *cmd*, *CLI*, *prompt*, *консоль* или *терминал*.

## Открываем интерфейс командной строки

Для того, чтобы начать экспериментировать, нам нужно сначала открыть интерфейс командной строки.

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

## Командная строка

Теперь ты должна увидеть окно белого или черного цвета, которое ожидает команд.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

If you're on Mac or Linux, you probably see `$`, like this:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

В Windows ты увидишь знак `>`:

{% filename %}command-line{% endfilename %}

    >
    

<!--endsec-->

Каждую команду будет предварять этот знак и один пробел, но тебе не придется их вводить. Компьютер сделает это за нас. :)

> Just a small note: in your case there may be something like `C:\Users\ola>` or `Olas-MacBook-Air:~ ola$` before the prompt sign, and this is 100% OK.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. Ignore the left part and only type in the command, which starts after the prompt.

## Твоя первая команда (УРА!)

Let's start by typing this command:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

И затем нажми `enter`. Вот наш результат:

{% filename %}command-line{% endfilename %}

    $ whoami 
    olasitarska
    

As you can see, the computer has just printed your username. Neat, huh? :)

> Try to type each command; do not copy-paste. You'll remember more this way!

## Основы

В каждой операционной системе набор команд для командной строки немного отличается, поэтому не забывай следовать инструкциям для своей операционной системы. Давай попробуем, готова?

### Текущий каталог

Было бы приятно знать, где мы находимся сейчас, верно? Давай посмотрим. Введи следующую команду и нажми `enter`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Примечание: «pwd» означает «вернуть рабочий каталог» 'print working directory'.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Note: 'cd' stands for 'change directory'. With powershell you can use pwd just like on Linux or Mac OS X.

<!--endsec-->

Ты, вероятно, увидишь нечто похожее на своем компьютере. Когда ты открываешь командную строку, то обычно находишься в домашнем каталоге текущего пользователя.

* * *

### Список файлов и каталогов

Так что же в нем? Было бы здорово узнать. Давайте посмотрим:

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
    05/08/2014 07:28 PM <DIR> Applications
    05/08/2014 07:28 PM <DIR> Desktop
    05/08/2014 07:28 PM <DIR> Downloads
    05/08/2014 07:28 PM <DIR> Music
    ...
    

> Note: In powershell you can also use 'ls' like on Linux and Mac OS X. <!--endsec-->

* * *

### Смена текущего каталога

Теперь вернемся в наш каталог рабочего стола:

<!--sec data-title="Change current directory: OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Проверь, что рабочий каталог действительно изменился:

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

Вот и он!

> PRO tip: if you type `cd D` and then hit `tab` on your keyboard, the command line will automatically fill in the rest of the name so you can navigate faster. If there is more than one folder starting with "D", hit the `tab` key twice to get a list of options.

* * *

### Создание каталога

Как насчет создания каталога practice на рабочем столе? Вы можете сделать это таким образом:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

Эта маленькая команда создаст папку с именем `practice` на рабочем столе. You can check if it's there by looking on your Desktop or by running a `ls` or `dir` command! Попробуй. :)

> ПРО совет: Если ты не хочешь вводить одни и те же команды снова и снова, попробуйте нажать на `стрелку вверх` и `стрелку вниз` на клавиатуре, чтобы просмотреть недавно использованные команды.

* * *

### Тренируемся!

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

#### Решение:

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

Поздравляем! :)

* * *

### Чистка

Мы не хотим оставлять беспорядок, поэтому давай удалим все, что мы создали до этого момента.

Во-первых, мы должны вернуться на рабочий стол:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd..
    

<!--endsec-->

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

Проверь, где ты находишься:

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

Пришло время удалить каталог `practice`:

> **Attention**: Deleting files using `del`, `rmdir` or `rm` is irrecoverable, meaning *the deleted files will be gone forever*! So be very careful with this command.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

Готово! Давай проверим, что папка действительно удалена:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Выход

That's it for now! You can safely close the command line now. Let's do it the hacker way, alright? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Круто, да? :)

## Содержание

Вот краткий обзор некоторых полезных команд:

| Команда (Windows) | Команда (Mac OS / Linux) | Описание                   | Пример                                            |
| ----------------- | ------------------------ | -------------------------- | ------------------------------------------------- |
| выход             | выход                    | Закрыть окно               | **выход**                                         |
| cd                | cd                       | изменить каталог           | **cd test**                                       |
| cd                | pwd                      | show the current directory | **cd** (Windows) or **pwd** (Mac OS / Linux)      |
| dir               | ls                       | список каталогов/файлов    | **dir**                                           |
| copy              | cp                       | копировать файл            | **copy c:\test\test.txt c:\windows\test.txt** |
| move              | mv                       | переместить файл           | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir             | mkdir                    | создать новый каталог      | **mkdir testdirectory**                           |
| rmdir (or del)    | rm                       | delete a file              | **del c:\test\test.txt**                        |
| rmdir /S          | rm -r                    | delete a directory         | **rm -r testdirectory**                           |

Это лишь некоторые из команд, которые можно использовать в командной строке, но сегодня тебе больше и не пригодится.

Если тебе интересно, [ss64.com](http://ss64.com) содержит полный справочник команд для всех операционных систем.

## Готова?

Давай погрузимся в мир Python!