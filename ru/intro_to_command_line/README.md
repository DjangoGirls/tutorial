# Знакомство с командной строкой

> Для тех, кто проходит руководство дома: о материале этой главы рассказывает видео [Ваш новый друг — командная строка](https://www.youtube.com/watch?v=jvZLWhkzX-8).

Вот это да! Всего через несколько минут ты напишешь свою первую строку кода! :)

**Позволь представить нашего первого нового друга: командную строку!**

Следующие шаги покажут, как использовать черное окно, которым пользуются все хакеры. Сначала оно может показаться немного пугающим, но, на самом деле, это просто окно, которое ждет от тебя команды.

> **Примечание** Пожалуйста, обрати внимание, что в этом руководстве мы используем термины «каталог» и «папка» взаимозаменяемо: эти слова обозначают одно и то же.

## Что такое командная строка?

Окно, которое обычно называют **командной строкой** или **интерфейсом командной строки (англ. CLI, Command Line Interface)**, является текстовым приложением для просмотра, обработки и манипулирования файлами на вашем компьютере. Она делает то же, что и Проводник в Windows или Finder в Mac OS X, но у неё нет графического интерфейса. Другими названиями для командной строки являются: *cmd*, *CLI*, *prompt*, *консоль* или *терминал*.

## Открываем интерфейс командной строки

Для того, чтобы начать экспериментировать, нам нужно сначала открыть интерфейс командной строки.

{% include "/intro_to_command_line/open_instructions.md" %}

## Командная строка

Теперь ты должна увидеть окно белого или черного цвета, которое ожидает команд.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Если у тебя Mac или Linux, ты, скорее всего, увидишь знак `$` в конце строки:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

Если у тебя Windows, строка скорее всего будет оканчиваться символом `>`, вот так:

{% filename %}command-line{% endfilename %}

    >
    

Можешь заглянуть в инструкцию для пользовательниц Linux чуть выше — нам что-то подобное ещё встретится, когда мы дойдём до PythonAnywhere.

<!--endsec-->

Перед каждой командой будет стоять знак `$` или `>` и пробел. Но тебе не нужно их печатать! Компьютер сделает это за тебя. :)

> Небольшое примечание: перед курсором командной строки может быть написано что-то вроде `C:\Users\ola>` или `Olas-MacBook-Air:~ola$`. Это абсолютно нормально.

То, что написано до знака `$` или `>`, плюс сам знак, всё вместе называется *приглашением командной строки*. Как правило, оно включает адрес папки, в которой ты сейчас находишься. Оно приглашает тебя ввести в окно команду.

Далее в руководстве перед каждой командой, которую тебе нужно будет ввести, мы будем писать символ `$` или `>`. Иногда слева от него мы будем добавлять ещё немного текста. Не обращай внимания на левую часть и просто печатай команду — она начинается после символа приглашения.

## Твоя первая команда (УРА!)

Давай введём следующую команду:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

И затем нажми `Enter`. Вот что получилось:

{% filename %}command-line{% endfilename %}

    $ whoami 
    olasitarska
    

Как видишь, компьютер только что вывел на экран твоё имя пользователя. Классно, а? :)

> Постарайся набирать каждую команду вручную, а не копировать и вставлять. Так ты больше запомнишь!

## Основы

В каждой операционной системе набор команд для командной строки немного отличается, поэтому не забывай следовать инструкциям для своей операционной системы. Давай попробуем, готова?

### Текущий каталог

Было бы неплохо знать, где мы находимся сейчас, верно? Давай посмотрим. Набери эту команду и нажми `Enter`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Примечание: 'pwd' означает 'print working directory' (вывести рабочий каталог).

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Примечание: 'cd' означает 'change directory' (сменить каталог). Если ты пользуешься powershell, можешь ввести pwd — как на Linux или Mac OS X.

<!--endsec-->

Ты, вероятно, увидишь нечто похожее на своем компьютере. Когда ты открываешь командную строку, то обычно находишься в домашнем каталоге текущего пользователя.

* * *

### Как узнать больше о команде

У многих команд для командной строки есть встроенная справка! Например, вот как узнать подробнее о команде, которая показывает, в какой папке ты сейчас находишься:

<!--sec data-title="Command help: OS X and Linux" data-id="OSX_Linux_man" data-collapse=true ces-->

В OS X и Linux есть команда `man` — справка о других командах (на английском языке). Набери `man pwd` и посмотри, что пишут о команде pwd. Используй `man` с другими командами, чтобы посмотреть для них справку. Как правило, справки `man` выводятся постранично. Нажми пробел, чтобы перейти на следующую страницу. Чтобы выйти, нажми `q`.

<!--endsec-->

<!--sec data-title="Command Help: Windows" data-id="windows_help" data-collapse=true ces-->

Чтобы вывести справку, почти к любой команде можно добавить `/?`. Чтобы прочитать всю справку, возможно, придётся прокрутить текст вниз. Попробуй набрать `cd /?`.

<!--endsec-->

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
    

> Примечание: в powershell можешь использовать ls — как в Linux или Mac OS X. <!--endsec-->

* * *

### Смена текущего каталога

Теперь вернемся в наш каталог рабочего стола:

<!--sec data-title="Change current directory: OS X" data-id="OSX_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Linux" data-id="Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

Обрати внимание, что название каталога "Desktop" может быть переведено на язык твоей учётной записи в системе Linux. В таком случае набери вместо `Desktop` переводное название: например, `"Рабочий стол"` (в кавычках — они нужны, чтобы командная строка поняла кириллицу).

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

> Совет от профи: если ты введешь `cd D` и затем нажмешь `Tab` на клавиатуре, в командной строке будет автоматически набрана остальная часть имени, что позволит быстрее перемещаться по каталогам. Если c «D» начинается название не одной папки, нажми `Tab` дважды, чтобы получить список вариантов.

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

Эта маленькая команда создаст папку с именем `practice` на рабочем столе. Ты можешь проверить, появилась ли она, просто взглянув на рабочий стол или введя команду `ls` (для Linux и macOS) или `dir` (если у тебя Windows)! Попробуй. :)

> Совет от профи: если ты не хочешь вводить одни и те же команды снова и снова, попробуй нажать на стрелку вверх и стрелку вниз на клавиатуре для просмотра недавно использованных команд.

* * *

### Тренируемся!

Небольшая задачка: в недавно созданной папке `practice` создай папку с названием `test`. Используй команды `cd` и `mkdir`

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

Используя `..` с командой `cd`, ты можешь сменить текущий каталог на родительский (то есть каталог, который содержит в себе текущий).

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

> **Внимание:** удаление файлов с помощью `del`, `rmdir` или `rm` необратимо. Это означает, что *удалённые файлы будут потеряны навсегда!* Поэтому будь очень осторожна с этими командами.

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

Вот и всё на данный момент! Теперь можно безопасно закрыть командную строку. Давай сделаем это как хакеры, согласна? 

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Круто, да? :)

## Подведём итоги

Вот краткий обзор некоторых полезных команд:

| Команда (Windows) | Команда (Mac OS / Linux) | Описание                | Пример                                              |
| ----------------- | ------------------------ | ----------------------- | --------------------------------------------------- |
| выход             | выход                    | Закрыть окно            | **выход**                                           |
| cd                | cd                       | изменить каталог        | **cd test**                                         |
| cd                | pwd                      | вывести текущий каталог | **cd** (Windows) или **pwd** (Mac OS / Linux)       |
| dir               | ls                       | список каталогов/файлов | **dir**                                             |
| copy              | cp                       | копировать файл         | **copy c:\test\test.txt c:\windows\test.txt**   |
| move              | mv                       | переместить файл        | **move c:\test\test.txt c:\windows\test.txt**   |
| mkdir             | mkdir                    | создать новый каталог   | **mkdir testdirectory**                             |
| rmdir (or del)    | rm                       | удалить файл            | **del c:\test\test.txt**                          |
| rmdir /S          | rm -r                    | удалить папку           | **rm -r testdirectory**                             |
| [CMD] /?          | man [CMD]                | справка для команды     | **cd /?** (Windows) или **man cd** (Mac OS / Linux) |

Это лишь некоторые из команд, которые можно использовать в командной строке, но сегодня тебе больше и не пригодится.

Если тебе интересно, [ss64.com](http://ss64.com) содержит полный справочник команд для всех операционных систем.

## Готова продолжить?

Давай погрузимся в мир Python!