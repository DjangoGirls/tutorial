> Отдельные части этой главы основаны на учебных пособиях Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

> Отдельные части этой главы основаны на [учебном пособии django-marcador](http://django-marcador.keimlink.de/), лицензированном под Creative Commons Attribution-ShareAlike 4.0 International License. Руководство django-marcador защищено авторским правом Markus Zapke-Gründemann et al.

## Виртуальное окружение

Перед установкой Django мы попросим тебя установить крайне полезный инструмент, который поможет тебе содержать среду разработки в чистоте. Можно пропустить этот шаг, но мы очень советуем этого не делать. Использование лучших рекомендаций с самого начала убережёт от многих проблем в будущем!

Итак, давай создадим **виртуальное окружение** (оно также называется *virtualenv*). Virtualenv будет изолировать зависимости Python/Django для каждого отдельного проекта. Это значит, что изменения одного сайта никогда не затронут другие сайты, которые вы разрабатываете. Удобно, правда?

Всё, что тебе нужно сделать — найти директорию, в которой мы создадим `virtualenv`; домашний каталог вполне подойдёт. Для Windows адрес будет выглядеть так: `C:\Users\Name` (где `Name` — твоё имя пользователя).

> __Примечание:__ Если ты работаешь в Windows, удостоверься, что в названии директории нет специальных символов или символов с диакритическими знаками; если в твоём имени пользователя есть такие символы, выбери другую директорию, например, `C:\djangogirls`.

Мы будем использовать отдельную директорию `djangogirls` в домашнем каталоге:

{% filename %}command-line{% endfilename %}
```
$ mkdir djangogirls
$ cd djangogirls
```

Мы создадим виртуальное окружение под именем `myvenv`. В общем случаем команда будет выглядеть так:

{% filename %}command-line{% endfilename %}
```
$ python3 -m venv myvenv
```

<!--sec data-title="Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

Чтобы создать новое `virtualenv`, тебе нужно открыть командную строку и набрать `python -m venv myvenv`. Это будет выглядеть так:

{% filename %}command-line{% endfilename %}
```
C:\Users\Name\djangogirls> python -m venv myvenv
```

Здесь `myvenv` — имя твоего `virtualenv`. Ты можешь выбрать другое имя, но используй можно только прописные буквы, без пробелов и специальных символов. Имя виртуального окружения выбирай покороче — тебе придётся часто его набирать!

<!--endsec-->

<!--sec data-title="Linux и OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

В Linux и OS X достаточно набрать `python3 -m venv myvenv`, чтобы создать `virtualenv`:

{% filename %}command-line{% endfilename %}
```
$ python3 -m venv myvenv
```

`myvenv` — имя виртуального окружения `virtualenv`. Можешь выбрать другое имя, но используй только строчные буквы и никаких пробелов. Имя виртуального окружения лучше выбирать покороче — набирать его предстоит не раз!

> __Примечание:__ В некоторых версиях Debian/Ubuntu может произойти следующая ошибка:

>{% filename %}command-line{% endfilename %}
>```
>The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>    apt-get install python3-venv
>You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>```
>
> В таком случае следуй приведённым инструкциям и установи пакет `python3-venv`:
>{% filename %}command-line{% endfilename %}
>```
>$ sudo apt-get install python3-venv
>```

> __Примечание:__ В некоторых версиях of Debian/Ubuntu при таком способе создания виртуального окружения ты можешь получить такую ошибку:

>{% filename %}command-line{% endfilename %}
>```
>Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>```

> Чтобы обойти её, используй команду `virtualenv`.

>{% filename %}command-line{% endfilename %}
>```
>$ sudo apt-get install python-virtualenv
>$ virtualenv --python=python3.6 myvenv
>```

> __Примечание:__ Если ты получаешь следующую ошибку

>{% filename %}command-line{% endfilename %}
>```
>E: Unable to locate package python3-venv
>```

> то тогда запусти команду:
>
>{% filename %}command-line{% endfilename %}
>```
>sudo apt install python3.6-venv
>```

<!--endsec-->

## Работаем с virtualenv

Указанная выше команда создаст директорию `myvenv` (или другую, в зависимости от выбранного имени), которая будет содержать виртуальное окружение (по сути — набор файлов и папок).

<!--sec data-title="Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Запусти виртуальное окружение, выполнив:

{% filename %}command-line{% endfilename %}
```
C:\Users\Name\djangogirls> myvenv\Scripts\activate
```

> __ПРИМЕЧАНИЕ:__ в Windows 10 при работе в Windows PowerShell ты можешь получить ошибку вида `execution of scripts is disabled on this system`. В этом случае открой ещё другое окно Windows PowerShell, выбрав опцию «Запустить от имени Администратора». Перед использованием виртуального окружения попробуй запустить следующую команду:
>
>{% filename %}command-line{% endfilename %}
>```
>C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>     Execution Policy Change
>     The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>```

<!--endsec-->

<!--sec data-title="Linux и OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Запусти виртуальное окружение, выполнив:

{% filename %}command-line{% endfilename %}
```
$ source myvenv/bin/activate
```

Не забудь поменять `myvenv` на выбранное для `virtualenv` имя!

> __ПРИМЕЧАНИЕ:__ иногда команда `source` может быть недоступна. В таком случае используй следующий метод:
>
>{% filename %}command-line{% endfilename %}
>```
>$ . myvenv/bin/activate
>```

<!--endsec-->

Ты поймёшь, что `virtualenv` запущено, когда увидишь префикс `(myvenv)` в начале приглашения командной строки.

При работе с виртуальным окружением команда `python` будет автоматически обращаться к правильной версии языка, так что тебе не обязательно использовать `python3`.

Отлично, теперь мы будем хранить все важные зависимости в одном месте. Наконец можно установить Django!

## Установка Django

После запуска `virtualenv` ты можешь установить Django.

Перед этим мы должны удостовериться, что у тебя установлена последняя версия `pip` — программы, которую мы используем для установки Django.

{% filename %}command-line{% endfilename %}
```
(myvenv) ~$ pip install --upgrade pip
```

Затем запусти команду `pip install django~=1.11.0` (обрати внимание на тильду со знаком равенства: `~=`), чтобы установить Django.

{% filename %}command-line{% endfilename %}
```
(myvenv) ~$ pip install django~=1.11.0
Collecting django~=1.11.0
  Downloading Django-1.11.3-py2.py3-none-any.whl (6.8MB)
Installing collected packages: django
Successfully installed django-1.11.3
```

<!--sec data-title="Windows" data-id="django_err_windows"
data-collapse=true ces-->

> Если ты получаешь сообщение об ошибке при запуске pip, проверь, что путь к директории с проектом не содержит пробелов или специальных символов (`C:\Users\User Name\djangogirls`). Если проблема в этом, то, пожалуйста, перенеси свой проект в другое место, адрес которого не будет содержать пробелов и специальных символов (предлагаем `C:\djangogirls`). Создай новое виртуальное окружене в новой директории, после этого удали старое и попробуй запустить команду установки Django заново (перемещение виртуального окружения не сработает, поскольку в нём используются абсолютные пути).

<!--endsec-->

<!--sec data-title="Windows 8 и Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> При попытке установки Django твоя командная строка может зависнуть. Если это произошло, вместо приведённой выше команды используй:
>
>{% filename %}command-line{% endfilename %}
>```
>C:\Users\Name\djangogirls> python -m pip install django~=1.11.0
>```

<!--endsec-->

<!--sec data-title="Linux" data-id="django_err_linux"

> При возникновении ошибки при вызове pip под Ubuntu 12.04, пожалуйста, запусти `python -m pip install -U --force-reinstall pip`, чтобы исправить установку pip в virtualenv.

<!--endsec-->

Вот и всё! Теперь ты (наконец-то) готова создать своё Django-приложение!
