# Вступ до інтерфейсу командного рядка

> Для читачів вдома: відеоверсія цього розділу - [Ваш новий друг: командний рядок](https://www.youtube.com/watch?v=jvZLWhkzX-8) (англ.).

Це захоплює, так?! Ви напишете свій перший рядок коду через декілька хвилин :)

**Дозвольте нам представити вам нового друга: командний рядок!**

Наступні кроки покажуть вам, як користуватися чорним вікном, яке є інструментом усіх хакерів. Спочатку це може видаватися трохи жахливим, однак насправді це лише запрошення, що очікує певних команд від вас.

> **Примітка.** Зауважте, що в цій книзі ми використовуємо терміни "директорія", "каталог" та "папка" взаємозамінно, ці слова означають одне й те саме.

## Що таке командний рядок?

Вікно, яке зазвичай називають **командним рядком** або **інтерфейсом командного рядка**, є текстовою програмою для перегляду, редагування та інших операцій з файлами на вашому комп'ютері. Як Провідник на Windows чи Finder на Mac, але без графічного інтерфейсу. Інші назви командного рядка: *cmd*, *CLI*, *prompt*, *console* або *terminal*.

## Відкриваємо інтерфейс командного рядка

Щоб почати експериментувати, нам потрібно спочатку відкрити наш командний рядок.

{% include "/intro_to_command_line/open_instructions.md" %}

## Запрошення

Має з'явитися біле або чорне вікно, що очікує на ваші команди.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Якщо ви працюєте на Mac або на Linux, ви напевно побачите `$`, на зразок:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

На Windows, це знак `>`, ось так:

{% filename %}command-line{% endfilename %}

    >
    

Подивіться на секцію Linux трохи вище - ви побачите щось подібне, коли перейдете до PythonAnywhere пізніше у цьому посібнику.

<!--endsec-->

Кожній команді буде передувати символ `$` або `>` і після нього один пробіл, але ви не мусите набирати їх. Ваш комп'ютер робитиме це для вас сам :)

> Маленьке зауваження: перед знаком командного рядка ви, скоріш за все, побачите щось на зразок `C:\Users\ola>` або `Olas-MacBook-Air:~ ola$`. Це є на 100% правильним.

Весь цей текст включно зі знаком `$` або `>` називається *запрошенням командного рядка* або скорочено *запрошенням*. Він запрошує вас ввести туди щось.

У посібнику, коли нам потрібно, щоб ви набрали щось у командному рядку, ми включатимемо `$` або `>`, а іноді й більше символів зліва. Ігноруйте ліву частину і набирайте лише команду, яка починається після знаку запрошення.

## Ваша перша команда (ЙОЙ!)

Почнемо з чогось простенького. Наберіть команду:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

Далі натисніть `Enter`. Це наш результат:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

Як бачимо, комп'ютер виводить ваше ім'я користувача. Файно, еге ж?:)

> Спробуйте набирати кожну команду, а не копіювати і вставляти. Таким чином, ви більше запам'ятаєте!

## Основи

У кожної операційної системи є трохи відмінні набори команд для командного рядка, отже будьте певними, що виконуєте інструкції саме для вашої операційної системи. Давайте спробуємо?

### Поточна директорія

Було б приємно знати, де ми перебуваємо зараз, чи не так? Давайте подивимося. Введіть цю команду і натисніть `Enter`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Примітка: "pwd" розшифровується як "print working directory" (англ. "надрукувати робочу папку").

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Примітка: "cd" означає "'change directory". Проте у PowerShell ви можете використовувати pwd - так же само, як на Linux або Mac OS X.

<!--endsec-->

Можливо, ви побачите щось таке на вашій машині. Після того, як ви відкрили командний рядок, ви зазвичай починаєте зі своєї домашньої папки.

* * *

### Довідка для команд

Багато команд, які можна вводити у командному рядку, мають вбудовану довідку, яку ви можете відобразити та прочитати! Наприклад, дізнайтесь більше про команду поточної директорії:

<!--sec data-title="Command help: OS X and Linux" data-id="OSX_Linux_man" data-collapse=true ces-->

ОС X та Linux мають команду `man` , що видає вам довідку по іншим командам. Спробуйте `man pwd` і подивіться, що вона видає, або помістіть `man` перед іншими командами, щоб побачити їхню довідку. Результат `man` зазвичай розбито на сторінки. Використовуйте пробіл, щоб перейти на наступну сторінку, і `q` , щоб вийти з перегляду довідки.

<!--endsec-->

<!--sec data-title="Command Help: Windows" data-id="windows_help" data-collapse=true ces-->

Додавання суфікса `/?` до більшості команд відобразить сторінку довідки. Можливо, доведеться прокрутити командне вікно, щоб побачити його повністю. Спробуйте `cd /?`.

<!--endsec-->

### Список файлів і папок

Отже, що ж всередині? Було б круто з'ясувати. Давайте подивимось:

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
    

> Примітка: у PowerShell ви можете використовувати 'ls', як у Linux або Mac OS X. <!--endsec-->

* * *

### Змінити поточну директорію

Тепер давайте перейдемо до директорії Робочого столу:

<!--sec data-title="Change current directory: OS X" data-id="OSX_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Linux" data-id="Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

Зверніть увагу, що назва каталогу "Desktop" може бути перекладена на мову вашого облікового запису Linux. У такому випадку вам треба замінити `Desktop` на назву перекладу; наприклад, `Робочий стіл` для української.

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Перевірте, чи дійсно щось змінилось:

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

Так, ось воно!

> ПРОФІ хитрощі: якщо ви наберете `cd D` і потім натиснете `Tab` на клавіатурі, командний рядок автоматично заповнить решту імені, таким чином можна набирати команди швидше. Якщо папок, що починаються з "D", більше однієї, натисніть клавішу `Tab` двічі, щоб отримати список варіантів.

* * *

### Створити директорію 

Як щодо створення каталогу practice на вашому робочому столі? Ви можете зробити це таким чином:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

Ця коротка команда створить папку з іменем `practice` на вашому Робочому столі. Можете перевірити, чи з'явилась вона там, просто глянувши на свій Робочий стіл або запустивши команду `ls` або `dir`! Спробуйте :)

> ПРОФІ хитрощі: Якщо ви не хочете кожного разу набирати одну й ту ж команду, спробуйте натиснути клавіші `Стрілка вгору` та `Стрілка вниз` на своїй клавіатурі, щоб повторити нещодавно використані команди.

* * *

### Вправа!

Невеличке випробування для вас: у щойно створеній директорії `practice` створіть папку `test`. Використайте для цього команди `cd` та `mkdir`.

#### Розв'язок:

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

Вітаємо! :)

* * *

### Прибираємо

Ми не хочемо залишити безлад, тож давайте видалимо усе, що ми створили до цього моменту.

Спочатку нам потрібно повернутися назад до директорії Робочий стіл:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Використання `cd` із `..` змінить вашу поточну директорію на батьківську (тобто папку, що містить вашу поточну папку).

Перевірте, де ми:

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

Тепер час видалити директорію `practice`:

> **Увага**: Видалення файлів за допомогою `del`, `rmdir` або `rm` є безповоротнім, тобто *файли будуть видалені назавжди*! Тож будьте конче обережними з цією командою.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

Виконано! Щоб переконатися, що папку дійсно видалено, давайте перевіримо:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Вихід

Це все наразі! Можна тепер спокійно закрити командний рядок. Давайте зробимо це хакерським методом, добре? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Круто, га? :)

## Зміст

Here is a summary of some useful commands:

| Команда (Windows) | Команда (Mac OS / Linux) | Опис                       | Приклад                                            |
| ----------------- | ------------------------ | -------------------------- | -------------------------------------------------- |
| вихід             | вихід                    | закрити вікно              | **вихід**                                          |
| cd                | cd                       | змінити директорію         | **cd test**                                        |
| cd                | pwd                      | show the current directory | **cd** (Windows) or **pwd** (Mac OS / Linux)       |
| dir               | ls                       | список директорій/файлів   | **dir**                                            |
| copy              | cp                       | скопіювати файл            | **copy c:\test\test.txt c:\windows\test.txt**  |
| move              | mv                       | перемістити файл           | **move c:\test\test.txt c:\windows\test.txt**  |
| mkdir             | mkdir                    | створити нову директорію   | **mkdir testdirectory**                            |
| rmdir (or del)    | rm                       | delete a file              | **del c:\test\test.txt**                         |
| rmdir /S          | rm -r                    | delete a directory         | **rm -r testdirectory**                            |
| [CMD] /?          | man [CMD]                | get help for a command     | **cd /?** (Windows) or **man cd** (Mac OS / Linux) |

These are just a very few of the commands you can run in your command line, but you're not going to use anything more than that today.

If you're curious, [ss64.com](http://ss64.com) contains a complete reference of commands for all operating systems.

## Готові?

Let's dive into Python!