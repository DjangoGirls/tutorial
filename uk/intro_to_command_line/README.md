# Вступ до інтерфейсу командного рядка

> For readers at home: this chapter is covered in the [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) video.

It's exciting, right?! You'll write your first line of code in just a few minutes! :)

**Дозвольте нам представити вас вашому новому другові: командний рядок!**

Наступні кроки покажуть вам як користуватися чорним вікном, яким користуються усі хакери. Спочатку це може видаватися трохи жахливим, однак насправді це лише командна підказка, що очікує певних команд від вас.

> **Note** Please note that throughout this book we use the terms 'directory' and 'folder' interchangeably but they are one and the same thing.

## Що таке командний рядок?

Вікно, яке зазвичай називають **командним рядком** або **інтерфейсом командного рядка**, є текстовою програмою для перегляду, обробки і управління файлами на вашому комп'ютері. It's much like Windows Explorer or Finder on the Mac, but without the graphical interface. Other names for the command line are: *cmd*, *CLI*, *prompt*, *console* or *terminal*.

## Відкриваємо інтерфейс командного рядка

Щоб почати експериментувати, нам потрібно спочатку відкрити наш інтерфейс командного рядка.

<!--sec data-title="Windows" data-id="windows_prompt" data-collapse=true ces-->

Go to Start menu → Windows System → Command Prompt.

> On older versions of Windows, look in Start menu → All Programs → Accessories → Command Prompt.

<!--endsec-->

<!--sec data-title="OS X" data-id="OSX_prompt" data-collapse=true ces-->

Go to Applications → Utilities → Terminal.

<!--endsec-->

<!--sec data-title="Linux" data-id="linux_prompt" data-collapse=true ces-->

It's probably under Applications → Accessories → Terminal, but that may depend on your system. If it's not there, just Google it. :)

<!--endsec-->

## Командний рядок

Має з'явитися біле або чорне вікно, що очікує на ваші команди.

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Якщо ви працюєте на Mac або на Linux, ви напевно побачите `$`, на зразок:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_prompt2" data-collapse=true ces-->

На Windows, це знак `>`:

{% filename %}command-line{% endfilename %}

    >
    

<!--endsec-->

Each command will be prepended by this sign and one space, but you don't have to type it. Your computer will do it for you. :)

> Just a small note: in your case there may be something like `C:\Users\ola>` or `Olas-MacBook-Air:~ ola$` before the prompt sign, and this is 100% OK.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. You can ignore the left part and just type in the command which starts after the prompt.

## Ваша перша команда (ЙОЙ!)

Почнемо з чогось простенького. Наберіть команду:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

А потім натисніть `enter`. Результатом буде:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

As you can see, the computer has just printed your username. Neat, huh? :)

> Try to type each command; do not copy-paste. You'll remember more this way!

## Основи

У кожної операційної системи є трохи відмінні набори команд для командного рядку, отже, будьте певними, що виконуєте інструкції саме для вашої операційної системи. Давайте спробуємо?

### Поточна директорія

Було б приємно знати, де ми перебуваємо зараз, чи не так? Давайте подивимося. Введіть цю команду і натисніть `enter`:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Зауваження: 'pwd' відповідає 'print working directory' (англ. надрукувати робочу папку).

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Note: 'cd' stands for 'change directory'. With powershell you can use pwd just like on Linux or Mac OS X.

<!--endsec-->

Можливо, ви побачите щось схоже на вашій машині. Після того, як ви відкрили командний рядок, ви зазвичай починаєте зі своєї домашньої папки.

* * *

### Список файлів і папок

Отже, що ж всередині? Було б круто з'ясувати. Давайте подивимось:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    Applications
    Desktop
    Downloads
    Music
    ...
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_dir" data-collapse=true ces-->

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

### Змінити поточну директорію

Тепер давайте перейдемо до директорії робочого столу:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Перевірте чи дійсно щось змінилось:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

Ось!

> PRO tip: if you type `cd D` and then hit `tab` on your keyboard, the command line will automatically fill in the rest of the name so you can navigate faster. If there is more than one folder starting with "D", hit the `tab` key twice to get a list of options.

* * *

### Створити директорію 

Як щодо створення каталогу practice на вашому робочому столі? Ви можете зробити це таким чином:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

Ця коротка команда створить папку з іменем `practice` на вашому робочому столі. Може перевірити чи є вона там, просто глянувши на свій Робочий стіл або запустивши команду `ls` або `dir`! Try it. :)

> ПРОФІ хитрощі: Якщо ви не хочете кожного разу набирати одну й ту ж команду, спробуйте натиснути кнопки `стрілка вгору` та `стрілка вниз` на своїй клавіатурі щоб повторити нещодавно використовувані команди.

* * *

### Вправа!

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

#### Розв'язання:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd practice
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd practice
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test
    

<!--endsec-->

Вітаємо! :)

* * *

### Прибираємо

Ми не хочемо залишити безлад, то ж давайте видалимо усе, що ми до цього моменту створили.

Спочатку, нам потрібно повернутися назад до директорії Робочий стіл:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

Перевірте де ми:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

Тепер час видалити директорію `practice`:

> **Attention**: Deleting files using `del`, `rmdir` or `rm` is irrecoverable, meaning *the deleted files will be gone forever*! So be very careful with this command.

<!--sec data-title="Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

Виконано! Щоб переконатися, що папку дійсно видалена, давайте перевіримо:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Вихід

That's it for now! You can safely close the command line now. Let's do it the hacker way, alright? :)

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Cool, huh? :)

## Підсумок

Тут наведено підсумок деяких корисних команд:

| Команда (Windows) | Команда (Mac OS / Linux) | Опис                       | Приклад                                           |
| ----------------- | ------------------------ | -------------------------- | ------------------------------------------------- |
| exit              | exit                     | закрити вікно              | **exit**                                          |
| cd                | cd                       | змінити директорію         | **cd test**                                       |
| cd                | pwd                      | show the current directory | **cd** (Windows) or **pwd** (Mac OS / Linux)      |
| dir               | ls                       | список директорій/файлів   | **dir**                                           |
| copy              | cp                       | скопіювати файл            | **copy c:\test\test.txt c:\windows\test.txt** |
| move              | mv                       | перемістити файл           | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir             | mkdir                    | створити нову директорію   | **mkdir testdirectory**                           |
| rmdir (or del)    | rm                       | delete a file              | **del c:\test\test.txt**                        |
| rmdir /S          | rm -r                    | delete a directory         | **rm -r testdirectory**                           |

Тут наведено лише невелика кількість команд, котрі можна запускати у вашому командному рядку, однак, на даний момент ми не збираємося використовувати щось більше.

Якщо вас цікавить, [ss64.com](http://ss64.com) містить повний список посилань на команди для усіх операційних систем.

## Готові?

Давайте зануримось у Python!