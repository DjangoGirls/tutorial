> Отдельные части этой главы основаны на учебных пособиях Geek Girls Carrots (http://django.carrots.pl/).
> 
> Отдельные части этой главы основаны на [учебном пособии django-marcador](http://django-marcador.keimlink.de/), лицензированном под Creative Commons Attribution-ShareAlike 4.0 International License. Руководство django-marcador защищено авторским правом Markus Zapke-Gründemann et al.

## Виртуальное окружение

Перед установкой Django мы попросим тебя установить крайне полезный инструмент, который поможет тебе содержать среду разработки в чистоте. Можно пропустить этот шаг, но мы очень советуем этого не делать. Использование лучших рекомендаций с самого начала убережёт от многих проблем в будущем!

Итак, давай создадим **виртуальное окружение** (оно также называется *virtualenv*). Virtualenv будет изолировать зависимости Python/Django для каждого отдельного проекта. Это значит, что изменения одного сайта никогда не затронут другие сайты, которые вы разрабатываете. Удобно, правда?

Все что тебе нужно сделать -- найти директорию, в которой мы создадим `virtualenv`; домашний каталог вполне подойдет. Для Windows адрес будет выглядеть так: `C:\Users\Name` (где `Name` твое имя пользователя).

> **ПРИМЕЧАНИЕ:** На Windows убедитесь, что этот каталог не содержит в имени специальные символы; Если ваше имя пользователя содержит кириллические знаки, используйте другой каталог, например `C:\djangogirls`.

Мы будем использовать отдельную директорию `djangogirls` в домашнем каталоге:

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

Мы создадим виртуальное окружение под именем `myvenv`. В общем случае команда будет выглядеть так:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

Чтобы создать новое виртуальное окружение `virtualenv`, вам нужно открыть командную строку и запустить `python -м venv myvenv`. Он будет выглядеть следующим образом:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Где `myvenv` — имя вашего `virtualenv`. Ты можешь выбрать любое имя, использовать можно только прописные буквы, без пробелов и специальных символов. Имя виртуального окружения лучше выбирать покороче — его предстоит набирать не раз!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

Для Linux и OS X достаточно набрать `python3 -m venv myvenv`, чтобы создать `virtualenv`. Это будет выглядеть так:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` -- имя виртуального окружения `virtualenv`. Опять же, только строчные буквы и никаких пробелов. Имя виртуального окружения лучше выбирать покороче — его часто придется набирать!

> **ПРИМЕЧАНИЕ:** В некоторых версиях Debian/Ubuntu может появиться следующее сообщение об ошибке:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>        apt install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>     
> 
> В этом случае, следуй нижеуказанной инструкции и установи пакет `python3-venv`: {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python3-venv
>     
> 
> **ПРИМЕЧАНИЕ:** В некоторых версиях Debian/Ubuntu при инициировании виртуального окруженя выдает следующую ошибку:
> 
> {% filename %}command-line{% endfilename %}
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Чтобы обойти эту проблему используй команду `virtualenv`.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python-virtualenv
>     $ virtualenv --python=python3.6 myvenv
>     
> 
> **ПРИМЕЧАНИЕ:** Если вы получаете такое сообщение:
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> вместо этого запустите:
> 
> {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python3.6-venv
>     

<!--endsec-->

## Работаем с virtualenv

Вышеуказанная команда создаст директорию `myvenv` (или другую, в зависимости от выбранного имени), которая будет содержать виртуальное окружение (по сути -- набор файлов и папок).

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Запусти виртуальное окружение, выполнив:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

> **Примечание:** На Windows 10 вы можете получить сообщение об ошибке в Windows PowerShell, в котором сказано `на этой системы отключено выполнение скриптов`. В этом случае откройте Windows PowerShell с помощью параметра «Запуск от имени администратора». Затем попробуйте ввести следующую команду перед запуском виртуальной среды:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Вы хотите изменить политику исполнения? [Y] Да  [A] Да для всех  [N] Нет  [L] Нет для всех  [S] Приостановить [?] Справка (по умолчанию "N"): А
>     

<!-- (This comment separates the two blockquote blocks, so that GitBook and Crowdin don't merge them into a single block.) -->

> **ПРИМЕЧАНИЕ:** Для пользователей популярного редактора VS Code, в котором есть интегрированный терминал на основе Windows Powershell, если ты хочешь использовать интегрированный терминал, то выполни следующую команду для активации виртуального окружения:
> 
>     $ . myvenv\Scripts\activate.ps1
>     
> 
> Преимущество в том, что тебе не нужно переключаться между окном редактора и командной строкой

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Запусти виртуальное окружение, выполнив:

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

Не забудь поменять `myvenv` на выбранное для `virtualenv` имя!

> **ПРИМЕЧАНИЕ:** иногда команда `source` может быть недоступна. В таком случае, используй следующий метод:
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

Ты поймешь, что `virtualenv` запущен, когда увидишь префикс `(myvenv)` в командной строке.

При работе с виртуальным окружением, команда `python` будет автоматически обращаться к правильной версии языка, так что тебе не обязательно использовать `python3`.

Отлично, теперь мы будем хранить все важные зависимости в одном месте. Наконец можно установить Django!

## Установка Django {#django}

Теперь, когда твой `virtualenv` запущен, ты можешь установить Django.

Но перед этим мы должны убедиться, что у нас установлена последняя версия `pip`, программы, которую мы будем использовать для установки Django:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python -m pip install --upgrade pip
    

### Установка пакетов с требованиями

Файл требований хранит список зависимостей для установки с использованием `pip install`:

Сначала создай файл `requirements.txt` внутри папки `djangogirls /`, используя редактор кода, который ты установила ранее. Ты можешь сделать это, открыв новый файл в редакторе кода и затем сохранив его как `requirements.txt` в папке `djangogirls /`. Ваша папка будет выглядеть следующим образом:

    djangogirls
    ├── myvenv
    │   └── ...
    └───requirements.txt
    

В файл `static/css/requirements.txt` следует добавить следующий код:

{% filename %}djangogirls/requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

Теперь введи `pip install -r requirements.txt` для установки Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install -r requirements.txt
    Collecting Django~={{ book.django_version }} (from -r requirements.txt (line 1))
      Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.1MB)
    Installing collected packages: Django
    Successfully installed Django-{{ book.django_version }}
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> Если ты получаешь сообщение об ошибке при запуске pip в Windows, проверь что путь к директории с проектом не содержит пробелы или специальные символы (например, `C:\Users\User Name\djangogirls`). Если проблема в этом, то, пожалуйста, перенеси свой проект в другое место, адрес которого не будет содержать пробелы и специальные символы (советуем в: `C:\djangogirls`). Создай новый virtualenv в новой директории, а затем удали старый и повтори команды выше. (Перемещение директории virtualenv не будет работать, потому что virtualenv использует абсолютные пути.)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Командная строка может зависнуть после попытки установить Django. Если это произойдет, то вместо команды выше используй эту:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install -r requirements.txt
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> При возникновении ошибки при вызове pip под Ubuntu 12.04, пожалуйста, запусти `python -m pip install -U --force-reinstall pip`, чтобы исправить установку pip в virtualenv.

<!--endsec-->

Вот и оно! Теперь ты (наконец-то) готова создать свое Django приложение!