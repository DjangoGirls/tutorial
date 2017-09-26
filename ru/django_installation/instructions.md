> Part of this section is based on tutorials by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Part of this section is based on the [django-marcador tutorial](http://django-marcador.keimlink.de/) licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. Руководство django-marcador защищено авторским правом Markus Zapke-Gründemann et al.

## Виртуальное окружение

Перед установкой Django мы попросим тебя установить крайне полезный инструмент, который поможет тебе содержать среду разработки в чистоте. Можно пропустить этот шаг, но мы очень советуем этого не делать. Использование лучших рекомендаций с самого начала убережёт от многих проблем в будущем!

Итак, давай создадим **виртуальное окружение** (оно также называется *virtualenv*). Virtualenv будет изолировать зависимости Python/Django для каждого отдельного проекта. Это значит, что изменения одного сайта никогда не затронут другие сайты, которые вы разрабатываете. Удобно, правда?

Все что тебе нужно сделать -- найти директорию, в которой мы создадим `virtualenv`; домашний каталог вполне подойдет. Для Windows адрес будет выглядеть так: `C:\Users\Name` (где `Name` твое имя пользователя).

> **NOTE:** On Windows, make sure that this directory does not contain accented or special characters; if your username contains accented characters, use a different directory, for example `C:\djangogirls`.

Мы будем использовать отдельную директорию `djangogirls` в домашнем каталоге:

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

Мы создадим виртуальное окружение под именем `myvenv`. В общем случаем команда будет выглядеть так:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

To create a new `virtualenv`, you need to open the command prompt and run `python -m venv myvenv`. It will look like this:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Where `myvenv` is the name of your `virtualenv`. Ты можешь выбрать любое имя, использовать можно только прописные буквы, без пробелов и специальных символов. It is also good idea to keep the name short – you'll be referencing it a lot!

<!--endsec-->

<!--sec data-title="Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

Для Linux и OS X достаточно набрать `python3 -m venv myvenv`, чтобы создать `virtualenv`:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` -- имя виртуального окружения `virtualenv`. Опять же, только строчные буквы и никаких пробелов. Имя виртуального окружения лучше выбирать покороче — его набирать его предстоит не раз!

> **NOTE:** On some versions of Debian/Ubuntu you may receive the following error:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>        apt-get install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>     
> 
> In this case, follow the instructions above and install the `python3-venv` package: {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt-get install python3-venv
>     
> 
> **NOTE:** On some versions of Debian/Ubuntu initiating the virtual environment like this currently gives the following error:
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
>     $ sudo apt-get install python-virtualenv
>     $ virtualenv --python=python3.6 myvenv
>     
> 
> **NOTE:** If you get an error like
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> then instead run:
> 
> {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python3.6-venv
>     

<!--endsec-->

## Работаем с virtualenv

Вышеуказанная команда создаст директорию `myvenv` (или другую, в зависимости от выбранного имени), которая будет содержать виртуальное окружение (по сути -- набор файлов и папок).

<!--sec data-title="Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Запусти виртуальное окружение, выполнив:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

> **NOTE:** on Windows 10 you might get an error in the Windows PowerShell that says `execution of scripts is disabled on this system`. In this case, open another Windows PowerShell with the "Run as Administrator" option. Then try typing the following command before starting your virtual environment:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     

<!--endsec-->

<!--sec data-title="Linux and OS X" data-id="virtualenv_linuxosx"
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

You will know that you have `virtualenv` started when you see that the prompt in your console is prefixed with `(myvenv)`.

When working within a virtual environment, `python` will automatically refer to the correct version so you can use `python` instead of `python3`.

Отлично, теперь мы будем хранить все важные зависимости в одном месте. Наконец можно установить Django!

## Установка Django

Now that you have your `virtualenv` started, you can install Django.

Before we do that, we should make sure we have the latest version of `pip`, the software that we use to install Django:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install --upgrade pip
    

Then run `pip install django~=1.11.0` (note that we use a tilde followed by an equal sign: `~=`) to install Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install django~=1.11.0
    Collecting django~=1.11.0
      Downloading Django-1.11.3-py2.py3-none-any.whl (6.8MB)
    Installing collected packages: django
    Successfully installed django-1.11.3
    

<!--sec data-title="Windows" data-id="django_err_windows"
data-collapse=true ces-->

> If you get an error when calling pip on Windows platform, please check if your project pathname contains spaces, accents or special characters (for example, `C:\Users\User Name\djangogirls`). If it does, please consider using another place without spaces, accents or special characters (suggestion: `C:\djangogirls`). Create a new virtualenv in the new directory, then delete the old one and try the above command again. (Moving the virtualenv directory won't work since virtualenv uses absolute paths.)

<!--endsec-->

<!--sec data-title="Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Your command line might freeze after when you try to install Django. If this happens, instead of the above command use:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install django~=1.11.0
>     

<!--endsec-->

<!--sec data-title="Linux" data-id="django_err_linux"
data-collapse=true ces-->

> При возникновении ошибки при вызове pip под Ubuntu 12.04, пожалуйста, запусти `python -m pip install -U --force-reinstall pip`, чтобы исправить установку pip в virtualenv.

<!--endsec-->

Вот и оно! Теперь ты (наконец то) готова создать свое Django приложение!