> Част от този раздел е базиран на уроци от Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Част от този раздел е базиран на [ django-marcador    урок ](http://django-marcador.keimlink.de/) лицензиран съгласно Creative Commons    Attribution-ShareAlike 4.0 международен лиценз. Урокът за джанго-маркадор е защитен с авторско право от Markus Zapke-Gründemann et al.

## Виртуална среда

Преди да инсталираме Django, ще ви накараме да инсталирате изключително полезен инструмент, който да ви помогне да поддържате средата си на кодиране подредена на вашия компютър. Възможно е да пропуснете тази стъпка, но силно се препоръчва. Като започнете с възможно най-добрата настройка, ще ви спести много проблеми в бъдеще!

Така че, нека създадем **виртуална среда** (наричана още *virtualenv*). Virtualenv ще изолира вашата настройка на Python/Django на база проект. Това означава, че всички промени, които правите в един уебсайт, няма да засегнат други, които също разработвате. Яко, нали?

Всичко, което трябва да направите, е да намерите директория, в която искате да създадете `virtualenv`; вашата домашна директория, например. В Windows може да изглежда като `C:\Users\Name` (където `Name` е името на вашия логин).

> **ЗАБЕЛЕЖКА:** В Windows уверете се, че тази директория не съдържа акцентирани или специални знаци; ако вашето потребителско име съдържа символи с ударение, използвайте друга директория, например, `C:\djangogirls`.

За този урок ще използваме нова директория `djangogirls` от вашата домашна директория:

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

Ще направим virtualenv, наречен `myvenv`. Общата команда ще бъде във формата:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

За да създадете нов `virtualenv `, трябва да отворите командния ред и да стартирате `python -m venv myvenv`. Ще изглежда така:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Където `myvenv` е името на вашия `virtualenv`. Можете да използвате всяко друго име, но се придържайте към малки букви и не използвайте интервали, ударения или специални знаци. Също така е добре името да бъде кратко - ще го препращате много!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

Можем да създадем `virtualenv` и в Linux и OS X, като пуснем `python3 -m venv myvenv`. Ще изглежда така:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` е името на вашия `virtualenv`. Можете да използвате всяко друго име, но се придържайте към малки букви и не използвайте интервали. Също така е добре името да бъде кратко, понеже ще го препращате много!

> **ЗАБЕЛЕЖКА:** В някои версии на Debian/Ubuntu може да получите следната грешка:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>        apt install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>     
> 
> В този случай следвайте инструкциите по-горе и инсталирайте пакета `python3-venv`: {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python3-venv
>     
> 
> **ЗАБЕЛЕЖКА:** При някои версии на Debian/Ubuntu инициирането на виртуалната среда като тази в момента дава следната грешка:
> 
> {% filename %}command-line{% endfilename %}
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> За да заобиколите това, използвайте вместо това командата `virtualenv`.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python-virtualenv
>     $ virtualenv --python=python3.6 myvenv
>     
> 
> **ЗАБЕЛЕЖКА:** Ако получите грешка като
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> вместо това стартирайте:
> 
> {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python3.6-venv
>     

<!--endsec-->

## Работа с virtualenv

Командата по-горе ще създаде директория с име `myvenv` (или каквото име сте си избрали), която съдържа нашата виртуална среда (по същество куп директории и файлове). 

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Стартирайте виртуалната си среда като напишете:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

> **Забележка:** При Windows 10 можете да получите грешка в прозореца на PowerShell `execution of scripts is disabled on this system`. В този случай трябва да отворите нов прозорец на PowerShell като изберете "Run as Administrator." След това напишете следната команда преди да стартирате виртуалната си среда: След това напишете следната команда преди да стартирате виртуалната си среда:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Промяна при политиката на изпълнението
>         Политиката на изпълнението ви предпазва от скриптове на които нямате доверие. При промяна на политиката на изпълнение може да бъдете изложени на опасен риск описан в темата about_Execution_Policies help в http://go.microsoft.com/fwlink/?LinkID=135170. Искате ли да промените политиката на изпълнението? [Y] ДА [A] Да на всичко [N] Не [L] Не на всичко [S] Прекрати [?] Помощ (по подразбиране е "N"): A
>     

<!-- (This comment separates the two blockquote blocks, so that GitBook and Crowdin don't merge them into a single block.) -->

> **NOTE:** For users of the popular editor VS Code, which come with an integrated terminal based off windows powershell, if you wish to stick with the integrated terminal, you may run the following command to activate your virtual environment:
> 
>     $ . myvenv\Scripts\activate.ps1
>     
> 
> The advantage is that you don't have to switch between editor windows and command-line windows

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Start your virtual environment by running:

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

Remember to replace `myvenv` with your chosen `virtualenv` name!

> **NOTE:** sometimes `source` might not be available. In those cases try doing this instead:
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

You will know that you have `virtualenv` started when you see that the prompt in your console is prefixed with `(myvenv)`.

When working within a virtual environment, `python` will automatically refer to the correct version so you can use `python` instead of `python3`.

OK, we have all important dependencies in place. We can finally install Django!

## Installing Django {#django}

Now that you have your `virtualenv` started, you can install Django.

Before we do that, we should make sure we have the latest version of `pip`, the software that we use to install Django:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python -m pip install --upgrade pip
    

### Installing packages with requirements

A requirements file keeps a list of dependencies to be installed using `pip install`:

First create a `requirements.txt` file inside of the `djangogirls/` folder, using the code editor that you installed earlier. You do this by opening a new file in the code editor and then saving it as `requirements.txt` in the `djangogirls/` folder. Your directory will look like this:

    djangogirls
    ├── myvenv
    │   └── ...
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

> If you get an error when calling pip on Windows platform, please check if your project pathname contains spaces, accents or special characters (for example, `C:\Users\User Name\djangogirls`). If it does, please consider using another place without spaces, accents or special characters (suggestion: `C:\djangogirls`). Create a new virtualenv in the new directory, then delete the old one and try the above command again. (Moving the virtualenv directory won't work since virtualenv uses absolute paths.)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Your command line might freeze after when you try to install Django. If this happens, instead of the above command use:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install -r requirements.txt
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> If you get an error when calling pip on Ubuntu 12.04 please run `python -m pip install -U --force-reinstall pip` to fix the pip installation in the virtualenv.

<!--endsec-->

That's it! You're now (finally) ready to create a Django application!