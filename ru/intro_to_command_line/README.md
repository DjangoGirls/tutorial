# Знакомство с командной строкой

> Для проходящих курс дома: эта глава рассмотрена в видео [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8).

Вот это интересно, да?! Ты напишешь свою первую строку кода всего через несколько минут :)

__Позволь представить нашего первого нового друга: командную строку!__

Следующие шаги покажут, как использовать чёрное окно, которым пользуются все хакеры. В начале оно может показаться немного пугающим, но, на самом деле это просто окно, которое ждет от тебя команды.

> **Примечание** Пожалуйста, обрати внимание, что в этой книге мы используем термины «каталог» и «папка» взаимозаменяемо, эти слова обозначают одно и то же.

## Что такое командная строка?

Окно, которое обычно называют __командной строкой__ или __интерфейсом командной строки (англ. CLI, Command Line Interface)__, является текстовым приложением для просмотра, обработки и манипулирования файлами на твоём компьютере. Как Проводник Windows или Finder на Mac, но без графического интерфейса. Другими названиями для командной строки являются: *cmd*, *CLI*, *prompt*, *консоль* или *терминал*.

## Открываем интерфейс командной строки

Для того, чтобы начать экспериментировать, нам нужно сначала открыть интерфейс командной строки.


<!--sec data-title="Windows" data-id="windows_prompt" data-collapse=true ces-->

Перейди в меню Пуск → Служебные — Windows → Командная строка.

> В старых версиях Windows можешь поискать в меню Пуск → Все программы → Стандартные → Командная строка.

<!--endsec-->


<!--sec data-title="OS X" data-id="OSX_prompt" data-collapse=true ces-->

Приложения → Утилиты → Терминал.

<!--endsec-->

<!--sec data-title="Linux" data-id="linux_prompt" data-collapse=true ces-->

Вероятно, командная строка скрывается по адресу: Приложения → Стандартные → Терминал, но это может зависеть от конкретной системы. Если не сможешь найти — Google поможет :)

<!--endsec-->

## Командная строка

Теперь ты должна увидеть окно белого или чёрного цвета, которое ожидает команд.

<!--sec data-title="OS X и Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->


Если ты используешь Mac или Linux, то, вероятно, увидишь символ `$`:

{% filename %}command-line{% endfilename %}
```
$
```
<!--endsec-->


<!--sec data-title="Windows" data-id="windows_prompt2" data-collapse=true ces-->

В Windows ты увидишь знак `>`:

{% filename %}command-line{% endfilename %}
```
>
```
<!--endsec-->

Каждую команду будет предварять этот знак и один пробел, но тебе не придется их вводить. Компьютер сделает это за нас :)

> Небольшое примечание: в твоем случае до знака командной строки может быть что-то вроде `C:\Users\ola >` или `Olas-MacBook-Air:~ ola$`, и это правильно на 100%. В данном руководстве мы просто будем сокращать запись до разумного минимума.

Всё, что выводится до твоей команды, включая символ `$` или `>`, называется *приглашением командной строки*. Оно приглашает тебя ввести что-нибудь.

В этом руководстве, когда тебе нужно будет ввести какую-либо команду, мы будем предварять её символом `$` или `>`, иногда добавляя что-то слева. Ты можешь пропустить всё, что слева, и просто ввести команду, которая начинается сразу после приглашения командной строки.

## Твоя первая команда (УРА!)

Давай начнем с чего-то простого. Введи следующую команду:

<!--sec data-title="OS X и Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

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

И затем нажми `enter`. Вот наш результат:

{% filename %}command-line{% endfilename %}
```
$ whoami
olasitarska
```

Как видишь, компьютер только что напечатал твоё имя пользователя. Аккуратный, правда? :)

> Попробуй набирать каждую команду самостоятельно, а не копировать и вставлять. Так ты запомнишь больше!

## Основы

В каждой операционной системе набор команд для командной строки немного отличается, поэтому не забывай следовать инструкциям для своей операционной системы. Давай попробуем, готова?

### Текущий каталог

Было бы неплохо узнать, где мы находимся сейчас, верно? Давай посмотрим. Введи следующую команду и нажми `enter`:

<!--sec data-title="OS X и Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->


{% filename %}command-line{% endfilename %}
```
$ pwd
/Users/olasitarska
```

> Примечание: 'pwd' значит 'print working directory' (вывести рабочий каталог).

<!--endsec-->


<!--sec data-title="Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
> cd
C:\Users\olasitarska
```
> Примечание: 'cd' значит 'change directory' (сменить каталог). Если ты используешь powershell, можешь ввести pwd — как на Linux или Mac OS X.

<!--endsec-->

Ты, вероятно, увидишь нечто похожее на своем компьютере. Когда ты открываешь командную строку, то обычно находишься в домашнем каталоге текущего пользователя.

---

### Список файлов и каталогов

Так что же в нем? Было бы здорово узнать. Давай посмотрим:

<!--sec data-title="OS X и Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

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
 Directory of C:\Users\olasitarska
05/08/2014 07:28 PM <DIR>      Applications
05/08/2014 07:28 PM <DIR>      Desktop
05/08/2014 07:28 PM <DIR>      Downloads
05/08/2014 07:28 PM <DIR>      Music
...
```
> Примечание: В powershell ты можешь использовать 'ls', как в Linux и Mac OS X.
<!--endsec-->

---

### Смена текущего каталога

Теперь вернёмся в наш каталог рабочего стола:

<!--sec data-title="OS X и Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

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

Проверь, что рабочий каталог действительно изменился:

<!--sec data-title="OS X и Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ pwd
/Users/olasitarska/Desktop
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
> cd
C:\Users\olasitarska\Desktop
```
<!--endsec-->

Вот и он!

> Совет от профи: если ты введешь `cd D` и затем нажмешь `Tab` на клавиатуре, в командной строке будет автоматически набрана остальная часть имени, что позволит быстрее перемещаться по каталогам. Если c «D» начинается название не одной папки, нажми `Tab` дважды, чтобы получить список вариантов.

---

### Создание каталога

Как насчет создания каталога practice на рабочем столе? Ты можешь сделать это таким образом:

<!--sec data-title="OS X и Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ mkdir practice
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_mkdir" data-collapse=true ces-->


{% filename %}command-line{% endfilename %}
```
> mkdir practice
```
<!--endsec-->

Эта маленькая команда создаст папку с именем `practice` на рабочем столе. Ты можешь проверить, появилась ли она, просто взглянув на рабочий стол или введя команду `ls` (для Linux и macOS) или `dir` (если у тебя Windows)! Попробуй :)

> Совет от профи: если ты не хочешь вводить одни и те же команды снова и снова, попробуй нажать на `стрелку вверх` и `стрелку вниз` на клавиатуре для просмотра недавно использованных команд.

---

### Тренируемся!

Небольшая задачка: в недавно созданной папке `practice` создай папку с названием `test`. Используй команды `cd` и `mkdir`.

#### Решение:

<!--sec data-title="OS X и Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ cd practice
$ mkdir test
$ ls
test
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_test_dir" data-collapse=true ces-->


{% filename %}command-line{% endfilename %}
```
> cd practice
> mkdir test
> dir
05/08/2014 07:28 PM <DIR>      test
```
<!--endsec-->

Поздравляем! :)

---

### Чистка

Мы не хотим оставлять беспорядок, поэтому давай удалим всё, что мы создали до этого момента.

Во-первых, мы должны вернуться на рабочий стол:

<!--sec data-title="OS X и Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

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

Используя `..` с командой `cd`, ты можешь сменить текущий каталог на родительский (то есть каталог, содержащий в себе текущий).

Проверь, где ты находишься:

<!--sec data-title="OS X и Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ pwd
/Users/olasitarska/Desktop
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd3" data-collapse=true ces-->


{% filename %}command-line{% endfilename %}
```
> cd
C:\Users\olasitarska\Desktop
```
<!--endsec-->

Пришло время удалить каталог `practice`:

> __Внимание__: удаление файлов с помощью `del`, `rmdir` или `rm` необратимо, это означает, что _удалённые файлы будут потеряны навсегда_! Поэтому будь очень осторожна с этими командами.

<!--sec data-title="Windows Powershell, OS X и Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ rm -r practice
```
<!--endsec-->

<!--sec data-title="Командная строка Windows" data-id="windows_rmdir" data-collapse=true ces-->


{% filename %}command-line{% endfilename %}
```
> rmdir /S practice
practice, Are you sure <Y/N>? Y
```
<!--endsec-->

Готово! Давай проверим, что папка действительно удалена:

<!--sec data-title="OS X и Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

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

### Выход

Вот и все на данный момент! Теперь можно безопасно закрыть командную строку. Давай сделаем это как хакеры, согласна? :)

<!--sec data-title="OS X и Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

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

Круто, да?:)

## Подведём итоги

Вот краткий обзор некоторых полезных команд:

Команда (Windows) | Команда (Mac OS / Linux) | Описание                | Пример
----------------- | ------------------------ | ----------------------- | ---------------------------------------------
exit              | exit                     | Закрыть окно            | **exit**
cd                | cd                       | изменить каталог        | **cd test**
cd                | pwd                      | вывести текущий каталог | **cd** (Windows) или **pwd** (Mac OS / Linux)
dir               | ls                       | список каталогов/файлов | **dir**
copy              | cp                       | копировать файл         | **copy c:\test\test.txt c:\windows\test.txt**
move              | mv                       | переместить файл        | **move c:\test\test.txt c:\windows\test.txt**
mkdir             | mkdir                    | создать новый каталог   | **mkdir testdirectory**
rmdir (или del)   | rm                       | удалить файл            | **del c:\test\test.txt**
rmdir /S          | rm -r                    | удалить каталог         | **rm -r testdirectory**

Это лишь некоторые из команд, которые можно использовать в командной строке, но сегодня тебе больше и не пригодится.

Если тебе интересно, [ss64.com][1] содержит полный справочник команд для всех операционных систем.

 [1]: http://ss64.com

## Готова продолжить?

Давай погрузимся в мир Python!
