> Для проходящих руководство дома: эта глава рассмотрена в видео [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA).

> Этот подраздел основан на руководстве Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django написан на Python. Нам нужен Python, чтобы сделать что-нибудь в Django. Давай начнем с его установки! Мы хотим, чтобы ты установила Python 3.6, поэтому, если у тебя уже есть более ранняя версия, то её придется обновить.


<!--sec data-title="Windows" data-id="python_windows" data-collapse=true ces-->

Для начала проверь, какая версия Windows у тебя установлена — 32-битная или 64-битная. Для этого нажми Windows + Pause/Break, чтобы открыть окно «Сведения о системе», и посмотри, что написано в строке «Тип системы». Ты можешь загрузить Python для Windows с официального веб-сайта: https://www.python.org/downloads/windows/. Перейди по ссылке «Latest Python 3 Release - Python x.x.x». Если у тебя установлена **64-битная** версия Windows, скачай **Windows x86-64 executable installer**. Если нет — скачай **Windows x86 executable installer**.  После загрузки дистрибутива ты должна запустить его (двойной щелчок) и следовать инструкциям. Важно запомнить путь (каталог), куда ты установила Python. Это понадобится позже!

Обрати внимание на второй экран мастера установки, который называется «Customize» (Настройка): тебе нужно пролистать его вниз и выбрать опцию «Add Python 3.6 to the PATH» (Добавить Python 3.6 к системной переменной PATH), как на рисунке:

![Не забудь добавить Python в системную переменную Path](../python_installation/images/python-installation-options.png)

Чуть дальше тебе понадобится командная строка Windows (о которой мы расскажем отдельно). Пока что, если тебе нужно ввести какую-нибудь команду, перейди в меню Пуск → Служебные — Windows → Командная строка. Или ты можешь зажать кнопку Windows и нажать кнопку «R», чтобы появился диалог «Выполнить». Для запуска командной строки введи «cmd» и нажми enter. (В новых версиях Windows тебе, возможно, придётся воспользоваться поиском — «Командная строка» иногда скрыта).

![Введи "cmd" в окне "Выполнить"](../python_installation/images/windows-plus-r.png)

Примечание: если ты используешь старую версию Windows (7, Vista или ещё более старую версию) и установка Python 3.6.x завершается выводом сообщения об ошибке, ты можешь попробовать:
1. либо установить все доступные обновления Windows и попробовать установить Python 3.6 заново;
2. либо установить [более раннюю версию Python](https://www.python.org/downloads/windows/), например, [3.4.6](https://www.python.org/downloads/release/python-346/).

Если тебе пришлось установить раннюю версию Python, экран установки можешь выглядеть чуть иначе. Не забудь прокрутить окно до строки «Add python.exe to Path», затем нажми кнопку слева от неё и выбери пункт «Will be installed on local hard drive»:

![Добавление Python в переменную Path, ранние версии](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Примечание:** перед установкой Python в OS X тебе нужно проверить, что в настройках твоего Mac разрешено устанавливать пакеты, загруженные не из App Store. Перейди в Системный настройки (в папке «Программы»), нажми «Защита и безопасность» и выбери вкладку «Общие». Если в разделе «Разрешать загрузки из:» выбран вариант «App Store для Mac», смени его на «App Store для Mac и от установленных разработчиков».

Тебе нужно перейти по ссылке https://www.python.org/downloads/release/python-361/ и скачать дистрибутив Python:

  * Скачай файл *Mac OS X 64-bit/32-bit installer*,
  * Сделай двойной щелчок на *python-3.4.3-macosx10.6.pkg* для запуска установщика.

<!--endsec-->

<!--sec data-title="Linux" data-id="python_linux"
data-collapse=true ces-->

Вполне вероятно, что у тебя уже установлен Python. Чтобы проверить это (а также версию языка), открой консоль и введи следующую команду:

{% filename %}command-line{% endfilename %}
```
$ python3 --version
Python 3.6.1
```

Если Python не установлен или ты хочешь использовать другую версию языка, то можешь установить его следующим образом:


<!--endsec-->

<!--sec data-title="Debian или Ubuntu" data-id="python_debian"
data-collapse=true ces-->

Введи эту команду в консоль:

{% filename %}command-line{% endfilename %}
```
$ sudo apt install python3.6
```

<!--endsec-->

<!--sec data-title="Fedora" data-id="python_fedora"
data-collapse=true ces-->

Используй следующую команду в консоли:

{% filename %}command-line{% endfilename %}
```
$ sudo dnf install python3
```

Если у тебя старая версия Fedora, то ты можешь получить ошибку «command dfn is not found». В этом случае используй yum.

<!--endsec-->

<!--sec data-title="openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Используй следующую команду в консоли:

{% filename %}command-line{% endfilename %}
```
$ sudo zypper install python3
```

<!--endsec-->

Убедись, что установка прошла успешно, открыв приложение *Терминал* и запустив команду `python3`:

{% filename %}command-line{% endfilename %}
```
$ python3 --version
Python 3.6.1
```

**ПРИМЕЧАНИЕ:** если ты используешь Windows и получила ошибку с сообщением, что `python3` не найден, попробуй ввести `python` (без `3`) и проверь, будет ли это версия Python 3.6.

----

Если у тебя остались какие-либо сомнения или что-то пошло не так и ты понятия не имеешь, что делать дальше, — спроси своего тренера! Иногда дела идут не совсем гладко, поэтому лучше попросить помощи у кого-то с большим опытом.
