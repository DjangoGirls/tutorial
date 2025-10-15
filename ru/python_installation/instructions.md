> Для проходящих руководство дома: эта глава рассмотрена в видео [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA).

> Этот подраздел основан на руководстве Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django написан на Python. Нам нужен Python, чтобы сделать что-нибудь в Django. Давай начнем с его установки! Мы хотим, чтобы ты установила самую свежую версию Python 3, поэтому, если у тебя уже есть более ранняя версия, то её придется обновить. Если у тебя уже установлена версия {{ book.py_min_version }} или более высокая, она должна подойти.


<!--sec data-title="Установка Python: Windows" data-id="python_windows" data-collapse=true ces-->

Для начала проверь, какая версия Windows у тебя на компьютере — 32-битная или 64-битная. Это будет указано в строке «Тип системы» на странице «Сведения о системе». Чтобы попасть туда, попробуй один из этих способов:
* Нажми одновременно клавиши Windows и Pause/Break
* Открой панель управления из меню Windows, оттуда перейди в «Система и безопасность», затем в «Система»
* Нажми клавишу Windows, затем перейди по разделам Настройки > Система > О системе

Ты можешь загрузить Python для Windows с официального веб-сайта: https://www.python.org/downloads/windows/. Перейди по ссылке «Latest Python 3 Release - Python x.x.x». Если у тебя установлена **64-битная** версия Windows, скачай **Windows installer (64-bit)**. Если нет — скачай **Windows installer (32-bit)**.  После загрузки дистрибутива ты должна запустить его (двойным щелчком) и следовать инструкциям.

Обрати внимание на экран мастера установки, который называется «Setup» (Настройка): тебе нужно пролистать его вниз и выбрать опцию «Add Python {{ book.py_version }} to the PATH» (Добавить Python {{ book.py_version }} к системной переменной PATH), как на рисунке (это может выглядеть по-разному в зависимости от версии, которую ты устанавливаешь):

![Не забудь добавить Python в системную переменную Path](../python_installation/images/python-installation-options.png)

Когда установка закончится, ты можешь увидеть предложение узнать больше о Python или об установленной тобой версии. Закрой это окно — ты узнаешь намного больше в этом руководстве!

Примечание: если ты используешь старую версию Windows (7, Vista или ещё более старую версию), и установка Python {{ book.py_version }} завершается выводом сообщения об ошибке, ты можешь попробовать:
1. либо установить все доступные обновления Windows и попробовать установить Python {{ book.py_version }} заново;
2. либо установить [более раннюю версию Python](https://www.python.org/downloads/windows/), например, [3.4.6](https://www.python.org/downloads/release/python-346/).

Если тебе пришлось установить раннюю версию Python, экран установки может выглядеть чуть иначе, чем показано выше. Не забудь прокрутить окно до строки «Add python.exe to Path», затем нажми кнопку слева от неё и выбери пункт «Will be installed on local hard drive»:

![Добавление Python в переменную Path, ранние версии](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Установка Python: macOS" data-id="python_OSX"
data-collapse=true ces-->

> **Примечание:** перед установкой Python в macOS тебе нужно проверить, что в настройках твоего Mac разрешено устанавливать пакеты, загруженные не из App Store. Перейди в Системные настройки (в папке «Программы»), нажми «Защита и безопасность» и выбери вкладку «Общие». Если в разделе «Разрешать загрузки из:» выбран вариант «App Store для Mac», смени его на «App Store для Mac и от установленных разработчиков».

Тебе нужно перейти по ссылке https://www.python.org/downloads/ и скачать дистрибутив Python:

  * Скачай файл *macOS installer*,
  * Сделай двойной щелчок на *python-{{ book.py_release }}-macosx11.pkg* для запуска установщика.

<!--endsec-->

<!--sec data-title="Установка Python: Linux" data-id="python_linux"
data-collapse=true ces-->

Вполне вероятно, что у тебя уже установлен Python. Чтобы проверить это (а также версию языка), открой консоль и введи следующую команду:

{% filename %}command-line{% endfilename %}
```
$ python3 --version
Python {{ book.py_release }}
```

Если у тебя установлена другая версия Python, не меньше чем {{ book.py_min_version }} (например, {{ book.py_min_release }}), то нет необходимости обновляться.
Если Python не установлен, или ты хочешь использовать другую версию языка, то можешь установить его следующим образом:


<!--endsec-->

<!--sec data-title="Установка Python: Debian или Ubuntu" data-id="python_debian"
data-collapse=true ces-->

Введи эту команду в консоль:

{% filename %}command-line{% endfilename %}
```
$ sudo apt install python3
```

<!--endsec-->

<!--sec data-title="Установка Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Используй следующую команду в консоли:

{% filename %}command-line{% endfilename %}
```
$ sudo dnf install python3
```

Если у тебя старая версия Fedora, то ты можешь получить ошибку «command `dnf` is not found». В этом случае используй `yum`.

<!--endsec-->

<!--sec data-title="Установка Python: openSUSE" data-id="python_openSUSE"
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
Python {{ book.py_release }}
```
Версия, которую ты увидишь, может быть и не {{ book.py_release }} — там будет такая версия, которую ты установила.

**ПРИМЕЧАНИЕ:** если ты используешь Windows и получила ошибку с сообщением, что `python3` не найден, попробуй ввести `python` (без `3`) и проверь, будет ли это версия Python {{ book.py_min_version }} или выше.

----

Если у тебя остались какие-либо сомнения, или что-то пошло не так, и ты понятия не имеешь, что делать дальше, — спроси своего тренера! Иногда дела идут не совсем гладко, поэтому лучше попросить помощи у кого-то с большим опытом.
