# Въведение в интерфейса на командния ред

> За читателите у дома: тази глава е разгледана във видеото [Вашият нов приятел: Командният ред](https://www.youtube.com/watch?v=jvZLWhkzX-8).

Вълнуващо е, нали ?! Ще напишете първия си ред код само за няколко минути! :)

**Нека ви запознаем с първия ви нов приятел: командният ред!**

Следващите стъпки ще ви покажат как да използвате черния прозорец, който използват всички хакери. В началото може да изглежда малко страшно, но всъщност тази подкана просто чака команди от вас.

> **Забележка** Моля, имайте предвид, че в тази книга използваме взаимозаменяемите термини „директория“ и „папка“, но те са едно и също нещо.

## Какво е командният ред?

Прозорецът, който обикновено се нарича **команден ред** or **интерфеса на командния ред**, е текстово приложение за преглед, обработка и манипулиране на файлове на вашия компютър. Прилича много на Windows Explorer или Finder на Mac, но без графичния интерфейс. Други имена на командния ред са: *cmd*, *CLI*, * prompt *, * console * или * terminal *.

## Отворете интерфейса на командния ред

За да започнем някои експерименти, първо трябва да отворим интерфейса на командния ред.

{% include "/intro_to_command_line/open_instructions.md" %}

## Prompt

Сега трябва да видите бял или черен прозорец, който чака вашите команди.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Ако сте на Mac или Linux, вероятно виждате `$`, ето така:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

На Windows, вероятно виждате `>`, ето така:

{% filename %}command-line{% endfilename %}

    >
    

Погледнете раздела за Linux малко по-горе - ще видите нещо повече от това, когато стигнете до PythonAnywhere по-късно в урока.

<!--endsec-->

Всяка команда ще бъде предварително обозначена с `$` или `>` и един интервал, но не бива да го въвеждате. Вашият компютър ще го направи вместо вас. :)

> Само малка забележка: във вашия случай може да има нещо като `C:\Users\ola>` или `Olas-MacBook-Air:~ ola$` преди знака на подкана и това е 100% ОК.

Частта до и включително `$` или `>` се нарича *командния ред* или *подкана* за кратко. То ви подканва да въведете нещо там.

В ръковдството, когато искаме да въведете команда, ще включим `$` или `>`, а понякога и повече вляво. Игнорирайте лявата част и въведете само командата, която започва след подкана.

## Вашата първа команда (УРА!)

Нека започнем с въвеждането на тази команда:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

И след това натиснете `enter`. Това е нашият резултат:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

Както можете да видите, компютърът току-що отпечата вашето потребителско име. Яко, а? :)

> Опитайте да въведете всяка команда; не копирайте-поставете. Ще запомните повече по този начин!

## Основи

Всяка операционна система има малко по-различен набор от команди за командния ред, така че не забравяйте да следвате инструкциите за вашата операционна система. Нека опитаме това, става ли?

### Текуща директория

Би било хубаво да знаем къде сме сега, нали? Да видим. Въведете тази команда и натиснете `enter`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Забележка: 'pwd' означава 'print working directory' (принтиране работна директория).

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Забележка: 'cd' означава 'change directory' (промяна на директория). С powershell можете да използвате pwd точно както в Linux или Mac OS X.

<!--endsec-->

Вероятно ще видите нещо подобно на вашата машина. След като отворите командния ред, обикновено стартирате в домашната директория на вашия потребител.

* * *

### Научете повече за команда

Много команди, които можете да въведете в командния ред, имат вградена помощ, която можете да показвате и четете! Например, за да научите повече за текущата команда на директория:

<!--sec data-title="Command help: OS X and Linux" data-id="OSX_Linux_man" data-collapse=true ces-->

OS X и Linux имат команда `man`, която ви предоставя помощ за команди. Опитайте `man pwd` и вижте какво пише, или поставете `man` преди други команди, за да видите помощта им. Изходът на `man` обикновено се изписва на страницата. Използвайте интервала, за да преминете към следващата страница, и `q`, за да прекратите прегледа на помощта.

<!--endsec-->

<!--sec data-title="Command Help: Windows" data-id="windows_help" data-collapse=true ces-->

Добавянето на `/?` суфикс към повечето команди ще отпечата помощната страница. Може да се наложи да превъртите прозореца на вашата команда нагоре, за да видите всичко. Опитайте `cd /?`.

<!--endsec-->

### Списък на файлове и директории

И така, какво има в него? Ще е готино да разберем. Да видим:

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
    

> Забележка: В powershell можете също да използвате 'ls' като в Linux и Mac OS X. <!--endsec-->

* * *

### Промяна на текущата директория

Сега, нека да отидем на вашата директория Desktop:

<!--sec data-title="Change current directory: OS X" data-id="OSX_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Linux" data-id="Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

Отбележи, че името на директорията "Desktop" може да се преведе на езика на вашия Linux акаунт. В такъв случай ще трябва да замените ` Desktop ` с преведеното име; например, `Работен плот` за български език.

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Проверете дали наистина е променена:

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

Ето го!

> PRO съвет: ако напишете `cd D` и след това натиснете `tab` на клавиатурата си, командният ред автоматично ще попълни останалото име, за да можете да навигирате по-бързо. Ако има повече от една папка, започваща с „D“, натиснете два пъти клавиша `tab`, за да получите списък с опции.

* * *

### Създаване на директория

Какво ще кажете за създаването на тестова директория на вашия работен плот? Можете да го направите по този начин:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

Тази малка команда ще създаде папка с името `practice` на вашия работен плот. Можете да проверите дали е там, като погледнете на работния си плот или като изпълните команда `ls` или `dir`! Опитайте. :)

> PRO съвет: Ако не искате да въвеждате едни и същи команди отново и отново, опитайте да натиснете `стрелката нагоре` и `стрелка надолу` на клавиатурата си, за да преминете през последните използвани команди.

* * *

### Упражнение!

Малко предизвикателство за вас: в новосъздадената си директория `practice` създайте директория, наречена `test`. (Използвайте командите `cd` и `mkdir`.)

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

Поздравления! :)

* * *

### Почистване

Не искаме да оставим бъркотия, така че нека премахнем всичко, което направихме до този момент.

Първо, трябва да се върнем към Desktop:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Използването на `..` с командата `cd` ще промени текущата ви директория на родителската директория (тоест директорията, която съдържа текущата ви директория).

Проверете къде се намирате:

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

Сега време за изтриване на директорията `practice`:

> **Внимание**: Изтриването на файлове с помощта на `del`, `rmdir` или `rm` е безвъзвратно, което означава, че *изтритите файлове ще изчезнат завинаги*! Затова бъдете много внимателни с тази команда.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

Готово! За да сме сигурни, че е действително изтрита, нека проверим:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Изход

Това е засега! Можете спокойно да затворите командния ред. Да го направим по хакерския начин, съгласни? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Готино, а? :)

## Обобщение

Ето обобщение на някои полезни команди:

| Команда (Windows) | Команда (Mac OS / Linux) | Описание                         | Пример                                              |
| ----------------- | ------------------------ | -------------------------------- | --------------------------------------------------- |
| exit              | exit                     | затваряне на прозореца           | **exit**                                            |
| cd                | cd                       | промяна на директория            | **cd test**                                         |
| cd                | pwd                      | показване на текущата директория | **cd** (Windows) или **pwd** (Mac OS / Linux)       |
| dir               | ls                       | списък директории / файлове      | **dir**                                             |
| copy              | cp                       | копие на файл                    | **copy c:\test\test.txt c:\windows\test.txt**   |
| move              | mv                       | преместване на файл              | **move c:\test\test.txt c:\windows\test.txt**   |
| mkdir             | mkdir                    | създаване на нова директория     | **mkdir testdirectory**                             |
| rmdir (или del)   | rm                       | изтриване на файл                | **del c:\test\test.txt**                          |
| rmdir /S          | rm -r                    | изтриване на директория          | **rm -r testdirectory**                             |
| [CMD] /?          | man [CMD]                | получете помощ за команда        | **cd /?** (Windows) или **man cd** (Mac OS / Linux) |

Това са само малка част от командите, които можете да изпълнявате във вашия команден ред, но днес няма да използвате нищо повече от това.

Ако ви е любопитно, [ss64.com](http://ss64.com) съдържа пълна справка за команди за всички операционни системи.

## Готови?

Нека се потопим в Python!