> Part of this section is based on tutorials by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Part of this section is based on the [django-marcador tutorial](http://django-marcador.keimlink.de/) licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. Авторське право на навчальні матеріали django-marcador tutorial належить Markus Zapke-Gründemann та ін.

## Віртуальне середовище

Перед тим як встановлювати Django, ми допоможемо вам встановити надзвичайно корисний інструмент, що допоможе підтримувати середовище розробки на вашому комп'ютері чистим. Цей крок можна пропустити, але дуже рекомендується його виконати. Починати найкращим можливим способом дозволить уникнути багатьох клопотів в майбутньому!

Отже, створимо віртуальне середовище (англ. **virtual environment** або скорочено *virtualenv*). Virtualenv ізолюватиме ваше Python/Django середовище, для кожного проекту. Це означає, що будь-які зміни, внесені на одному сайті не вплинуть на будь-які інші, які ви також розробляєте. Гарно, правда ж?

Все що вам необхідно зробити це знайти місце, де ви хочете створити віртуальне середовище `virtualenv`; наприклад, ваша домашня папка. На Windows це може виглядати як `C:\Users\Name` (де `Name` - ваш логін).

> **NOTE:** On Windows, make sure that this directory does not contain accented or special characters; if your username contains accented characters, use a different directory, for example `C:\djangogirls`.

В рамках цього навчального посібника будемо використовувати нову директорію `djangogirls` з вашої домашньої папки:

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

Створимо віртуальне середовище з ім'ям `myvenv`. Загальна команда буде ось в такому форматі:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

To create a new `virtualenv`, you need to open the command prompt and run `python -m venv myvenv`. It will look like this:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Where `myvenv` is the name of your `virtualenv`. Ви можете використовувати будь-яке ім’я, але старайтесь обмежитись маленькими буквами і не використовуйте пробілів, наголосів або спеціальних символів. It is also good idea to keep the name short – you'll be referencing it a lot!

<!--endsec-->

<!--sec data-title="Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

Створення віртуального середовища `virtualenv` як на Linux так і на OS X просто відбувається із запуском `python3 -m venv myvenv`. Виглядає це так:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` - ім'я вашого віртуального середовища `virtualenv`. Можете використовувати яке завгодно ім'я, але воно має містити лише маленькі літери і не містити пробілів. Тримати ім’я коротким - також гарна ідея, оскільки ви будете часто посилатися на нього!

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
> Щоб обійти цю проблему, використовуйте натомість команду `virtualenv`.
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

## Робота з віртуальним середовищем

Вищезазначена команда створить папку `myvenv` (або інше вибране вами ім'я), що міститиме наше віртуальне середовище (в основному, набір папок і файлів).

<!--sec data-title="Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Запустіть своє віртуальне середовище виконавши:

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

Запустіть своє віртуальне середовище виконавши:

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

Не забудьте замість `myvenv` повинно бути вибране вами ім'я для віртуального середовища!

> **ЗАУВАЖЕННЯ:** іноді використання `source` може бути недоступно. В цьому випадку спробуйте зробити наступне: 
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

You will know that you have `virtualenv` started when you see that the prompt in your console is prefixed with `(myvenv)`.

When working within a virtual environment, `python` will automatically refer to the correct version so you can use `python` instead of `python3`.

Добре, маємо усі необхідні залежності. Можемо зрештою встановити Django!

## Встановлення Django

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

> Якщо виникла помилка під час запуску pip на Ubuntu 12.04, будь ласка, запустіть `python -m pip install -U --force-reinstall pip` щоб коректно перевстановити pip у віртуальному середовищі.

<!--endsec-->

Оце усе! Зараз ви (нарешті) готові створити додаток Django!