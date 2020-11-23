> Част от този раздел е базирана на ръководства от Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Част от този раздел е базирана на [django-marcador ръководство](http://django-marcador.keimlink.de/) лицензиранo съгласно Creative Commons Attribution-ShareAlike 4.0 International License. Ръководството django-marcador е защитено с авторско право от Markus Zapke-Gründemann et al.

## Виртуална среда

Преди да инсталираме Django, ще ви накараме да инсталирате изключително полезен инструмент, който да ви помогне да поддържате средата си на кодиране подредена на вашия компютър. Възможно е да пропуснете тази стъпка, но силно се препоръчва. Като започнете с възможно най-добрата настройка, ще ви спести много проблеми в бъдеще!

Така че, нека създадем **виртуална среда** (наричана още *virtualenv*). Virtualenv ще изолира вашата настройка на Python/Django на база проект. Това означава, че всички промени, които правите в един уебсайт, няма да засегнат други, които също разработвате. Яко, нали?

Всичко, което трябва да направите, е да намерите директория, в която искате да създадете `virtualenv`; вашата начална директория, например. В Windows може да изглежда като `C:\Users\Name` (където `Name` е името на вашия логин).

> **ЗАБЕЛЕЖКА:** В Windows се уверете, че тази директория не съдържа акцентирани или специални знаци; ако вашето потребителско име съдържа символи с ударение, използвайте друга директория, например, `C:\djangogirls`.

За това ръководство ще използваме нова директория `djangogirls` от вашата домашна директория:

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

Ще направим virtualenv, наречен `myvenv`. Общата команда ще бъде във формата:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

За да създадеш нов `virtualenv`, трябва да отвориш командния ред и да стартираш `python -m venv myvenv`. Ще изглежда така:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Където `myvenv` е името на вашата `virtualenv`. Можете да използвате всяко друго име, но се придържайте към малки букви и не използвайте интервали, ударения или специални знаци. Също така е добре името да бъде кратко - ще го препращате много!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

Можем да създадем `virtualenv` и в Linux и OS X, като пуснем `python3 -m venv myvenv`. Ще изглежда така:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` е името на вашата `virtualenv`. Можете да използвате всяко друго име, но се придържайте към малки букви и не използвайте интервали. Също така е добре името да бъде кратко, понеже ще го използвате често!

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
>     $ virtualenv --python=python{{ book.py_version }} myvenv
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
>     sudo apt install python{{ book.py_version }}-venv
>     

<!--endsec-->

## Работа с virtualenv

Командата по-горе ще създаде директория с име `myvenv` (или каквото име сте си избрали), която съдържа нашата виртуална среда (по същество куп директории и файлове). 

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Стартирайте виртуалната си среда като напишете:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

> **Забележка:** При Windows 10 можете да получите грешка в прозореца на PowerShell `execution of scripts is disabled on this system`. В този случай трябва да отворите нов прозорец на PowerShell като изберете "Run as Administrator." След това напишете следната команда преди да стартирате виртуалната си среда:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Промяна при политиката на изпълнението
>         Политиката на изпълнението ви предпазва от скриптове на които нямате доверие. При промяна на политиката на изпълнение може да бъдете изложени на опасен риск описан в темата about_Execution_Policies help в http://go.microsoft.com/fwlink/?LinkID=135170. Искате ли да промените политиката на изпълнението? [Y] ДА [A] Да на всичко [N] Не [L] Не на всичко [S] Прекрати [?] Помощ (по подразбиране е "N"): A
>     

<!-- (This comment separates the two blockquote blocks, so that GitBook and Crowdin don't merge them into a single block.) -->

> **Забележка:** За потребителите на популярният редактор VS Code, който идва с интегриран терминал базиран на windows powershell, и ако искате да се придържате към интегрирания терминал, трябва да напишете следната команда за да активирате виртуалната си среда:
> 
>     $ . myvenv\Scripts\activate.ps1
>     
> 
> Предимството е, че не е необходимо да сменяте между прозорците на IDE и командния ред.

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Стартирайте виртуалната си среда като напишете:

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

Помнете, че трябва да заместите `myvenv` с името на вашата избрана `virtualenv`.

> **Забележка:** понякога `source` може да не е на лице. В тези случаи трябва да направите следното: 
> 
> {% filename %}command-line{% endfilename %} 
> 
>     $ . myvenv/bin/activate
>     
>     

<!--endsec-->

Ще разбереш, че `virtualenv` е стартирана като видиш че подканата в конзолата ти започва с `(myvenv)`.

Когато работите от виртуална среда, `python` автоматично ще се насочи към правилната версия, така че може да използвате команда `python` вместо `python3`.

Добре, сега имаме всичкo необходимо на едно място. Най-накрая може да инсталираме Django!

## Инсталиране на Django {#django}

Сега след като имате стартирана `virtualenv` може да инсталирате Django.

Преди да направим това обаче ще проверим дали имаме инсталирана последната версия на `pip`, софтуерът, който използваме да инсталираме Django:

{% filename %}command-line{% endfilename %} 

    (myvenv) ~$ python -m pip install --upgrade pip
    
    

### Инсталиране на пакети с изисквания

Файла съдържа лист от зависимости, които да се инсталират с командата `pip install`:

Първо създайте файл с име `requirements.txt` в папка `djangogirls`, като използвате IDE инсталиран по-рано. Това става като отворите нов файл в редактора и след това го запазите като `requirements.txt` в папка `djangogirls/`. Вашата директория трябва да изглежда така:

    djangogirls
    ├── myvenv
    │   └── ...
    └───requirements.txt
    

Във вашият `djangogirls/requirements.txt` файл трябва да добавите следното:

{% filename %}djangogirls/requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

Сега напишете команда `pip install -r requirements.txt` за да инсталирате Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install -r requirements.txt
    Collecting Django~={{ book.django_version }} (from -r requirements.txt (line 1))
      Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.1MB)
    Installing collected packages: Django
    Successfully installed Django-{{ book.django_version }}
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> Ако се появи грешка когато извикате команда pip на Windows платформа, проверете дали името на пътя на проекта ви съдържа празно място, знак за ударение или други специални знаци. (например , `C:\Users\User Name\djangogirls`). Ако съдържа, моля помислете за друго място без разстояние, знак за ударение или други специални знаци (предложение: `C:\djangogirls`). Създайте нова виртуална среда в новата директория, след това изтрийте старата и опитайте отново командата. (Преместването на папката с виртуална среда няма да работи, тъй като виртуалната среда използва абсолютни пътеки.)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Вашият команден ред може да забие след като се опитате да инсталирате Django. Ако това се случи, използвайте следната команда вместо горната:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install -r requirements.txt
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> Ако получите грешка при извикване на pip при Ubuntu 12.04 напишете следната команда `python -m pip install -U --force-reinstall pip` за да оправите инсталацията на pip във виртуалната среда.

<!--endsec-->

Това е! Сега вече (най-накрая) сте готови да създадете Django апликация!