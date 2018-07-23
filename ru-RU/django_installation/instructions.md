> Отдельные части этой главы основаны на учебных пособиях Geek Girls Carrots (http://django.carrots.pl/).
> 
> Part of this section is based on the [django-marcador tutorial](http://django-marcador.keimlink.de/) licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. Руководство django-marcador защищено авторским правом Markus Zapke-Gründemann et al.

## Виртуальное окружение

Перед установкой Django мы попросим тебя установить крайне полезный инструмент, который поможет тебе содержать среду разработки в чистоте. Можно пропустить этот шаг, но мы очень советуем этого не делать. Использование лучших рекомендаций с самого начала убережёт от многих проблем в будущем!

Итак, давай создадим **виртуальное окружение** (оно также называется *virtualenv*). Virtualenv будет изолировать зависимости Python/Django для каждого отдельного проекта. Это значит, что изменения одного сайта никогда не затронут другие сайты, которые вы разрабатываете. Удобно, правда?

Все что тебе нужно сделать -- найти директорию, в которой мы создадим `virtualenv`; домашний каталог вполне подойдет. On Windows, it might look like `C:\Users\Name` (where `Name` is the name of your login).

> **NOTE:** On Windows, make sure that this directory does not contain accented or special characters; if your username contains accented characters, use a different directory, for example, `C:\djangogirls`.

Мы будем использовать отдельную директорию `djangogirls` в домашнем каталоге:

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

Мы создадим виртуальное окружение под именем `myvenv`. В общем случаем команда будет выглядеть так:

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

We can create a `virtualenv` on both Linux and OS X by running `python3 -m venv myvenv`. It will look like this:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` -- имя виртуального окружения `virtualenv`. Опять же, только строчные буквы и никаких пробелов. It is also a good idea to keep the name short as you'll be referencing it a lot!

> **ПРИМЕЧАНИЕ:** В некоторых версиях Debian/Ubuntu может появиться следующее сообщение об ошибке:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>        apt install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>     
> 
> In this case, follow the instructions above and install the `python3-venv` package: {% filename %}command-line{% endfilename %}
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
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     

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

Ты поймешь, что `virtualenv` запущено, когда увидишь префикс в командной строке.

При работе с виртуальным окружением, команда `python` будет автоматически обращаться к правильной версии языка, так что тебе не обязательно использовать `python3`.

Отлично, теперь мы будем хранить все важные зависимости в одном месте. Наконец можно установить Django!

## Установка Django

Now that you have your `virtualenv` started, you can install Django.

Before we do that, we should make sure we have the latest version of `pip`, the software that we use to install Django:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python3 -m pip install --upgrade pip
    

### Installing packages with requirements

A requirements file keeps a list of dependencies to be installed using `pip install`:

First create a `requirements.txt` file inside of `djangogirls/` folder:

    djangogirls
    └───requirements.txt
    

In your `djangogirls/requirements.txt` file you should add the following text:

{% filename %}djangogirls/requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

Now, run `pip install -r requirements.txt` to install Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install -r requirements.txt
    Collecting Django~={{ book.django_version }} (from -r requirements.txt (line 1))
      Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.1MB)
    Installing collected packages: Django
    Successfully installed Django-{{ book.django_version }}
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> If you get an error when calling pip on Windows platform, please check if your project pathname contains spaces, accents or special characters (for example, `C:\Users\User Name\djangogirls`). If it does, please consider using another place without spaces, accents or special characters (suggestion: `C:\djangogirls`). Создай новый virtualenv в новой директории, а затем удали старый и повтори команды выше. (Перемещение директории virtualenv не будет работать, потому что virtualenv использует абсолютные пути.)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Командная строка может зависнуть после попытки установить Django. Если это произойдет, вместо команды выше, используй эту:
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

That's it! You're now (finally) ready to create a Django application!