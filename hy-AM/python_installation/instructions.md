> Ընթերցողների համար տանը. Այս գլուխն ընդգրկված է [ Installing Python & Code Editor ](https://www.youtube.com/watch?v=pVTaqzKZCdA) տեսանյութ:
> 
> Այս բաժինը հիմնված է Geek Girls Carrots- ի ձեռնարկի վրա (https://github.com/ggcarrots/django-carrots)

Django- ն գրված է Python- ում: Մեզ պետք է Python- ը, որպեսզի Django- ում ինչ-որ բան անի: Եկեք սկսենք տեղադրելով այն: Մենք ուզում ենք, որ դուք տեղադրեք Python 3-ի վերջին տարբերակը, այնպես որ, եթե ունեք ավելի վաղ տարբերակ, ապա ձեզ հարկավոր է արդիականացնել այն: Եթե ​​արդեն ունեք {{ book.py_min_version }} կամ ավելի բարձր տարբերակ, ապա լավ կլինի:

Խնդրում ենք տեղադրել սովորական Python– ը հետևյալ կերպ, նույնիսկ այն ժամանակ, երբ ձեր համակարգչում տեղադրված է Anaconda:

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Նախ ստուգեք, արդյոք ձեր համակարգիչը 32-բիթանոց տարբերակ է կամ 64-բիթանոց Windows տարբերակ, Համակարգի տեղեկատվության էջի «Համակարգի տեսակ» տողում: Այս էջին հասնելու համար փորձեք այս մեթոդներից մեկը.

* Միաժամանակ սեղմեք Windows կոճակը և Pause / Break կոճակը
* Բացեք ձեր կառավարման վահանակը Windows ընտրացանկից, ապա անցեք Համակարգ և & amp; Անվտանգություն, ապա ՝ Համակարգ
* Սեղմեք Windows կոճակը, ապա անցեք Settings > System > About (Կարգավորումներ> Համակարգ> Մեր մասին)
* Որոնեք Windows Start ընտրացանկում "System Information" («Համակարգի տեղեկատվություն») բաժնում: Դա անելու համար կտտացրեք Start կոճակին կամ սեղմեք Windows ստեղնը, ապա սկսեք մուտքագրել ` System Information `: Այն մուտքագրելուն պես կսկսի առաջարկություններ անել: Դուք կարող եք ընտրել առաջարկը, երբ այն հայտնվի:

Python- ը Windows- ի համար կարող եք ներբեռնել https://www.python.org/downloads/windows/ կայքից: Կտտացրեք «Վերջին Python 3 թողարկում - Python x.x.x» հղմանը: Եթե ​​ձեր համակարգիչը աշխատում է Windows- ի ** 64-բիթանոց ** տարբերակով, ներբեռնեք ** Windows x86-64 գործարկվող տեղադրիչը **: Հակառակ դեպքում ներբեռնեք ** Windows x86 գործարկվող տեղադրիչը **: Տեղադրիչը ներբեռնելուց հետո դուք պետք է այն գործարկեք (կրկնակի սեղմեք դրա վրա) և հետևեք այնտեղ տրված հրահանգներին:

Մի բան, որին պետք է զգույշ լինել. Տեղադրման ընթացքում դուք կնկատեք "Setup"(«Կարգավորում») նշվող պատուհանը: Համոզվեք, որ նշեք «Ավելացնել Python {{book.py_version}} - ը PATH» - ին կամ «Python ավելացնել ձեր միջավայրի փոփոխականներին» վանդակը և կտտացրեք «Տեղադրել հիմա» -ին, ինչպես ցույց է տրված այստեղ (կարող է մի փոքր այլ տեսք ունենալ, եթե տեղադրեք այլ տարբերակ):

![Don't forget to add Python to the Path](../python_installation/images/python-installation-options.png)

Տեղադրումն ավարտելուց հետո դուք կարող եք տեսնել երկխոսության տուփ հղումով, որին կարող եք հետևել Python- ի կամ ձեր տեղադրած տարբերակի մասին ավելին իմանալու համար: Փակեք կամ չեղարկեք այդ երկխոսությունը. Այս ձեռնարկում դուք ավելին կսովորեք:

Նշում. Եթե օգտագործում եք Windows- ի (7, Vista կամ որևէ հին տարբերակ) ավելի հին տարբերակ, և Python- ի {{ book.py_version }} տեղադրիչը սխալմամբ ձախողվեց, ապա տեղադրեք բոլոր Windows Updates- ը և փորձեք նորից տեղադրել Python- ը: Եթե ​​դեռ սխալ ունեք, փորձեք տեղադրել Python տարբերակը {{ book.py_min_release }} [ Python.org ](https://www.python.org/downloads/windows/) կայքից:

> Django- ին {{ book.django_version }} անհրաժեշտ է Python {{ book.django_version }} կամ ավելի մեծ, որը չի ապահովում Windows XP կամ ավելի վաղ տարբերակներ:

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> ** Նշում ** Նախքան Python- ը OS X- ում տեղադրելը, պետք է համոզվեք, որ ձեր Mac- ի կարգավորումները թույլ են տալիս տեղադրել փաթեթներ, որոնք App Store- ից չեն: Գնացեք համակարգի նախապատվություններ, կտտացրեք "Security & Privacy," , ապա "General" («Ընդհանուր»)ներդիրին: Եթե ​​ձեր «Allow apps downloaded from:» դրված է որպես «Mac App Store,», ապա այն փոխեք «Mac App Store and identified developers.»:

Դուք պետք է գնաք https://www.python.org/downloads/mac-osx/ կայք և ներբեռնեք Python- ի վերջին տեղադրիչը.

* Ներբեռնեք * Mac OS X 64-բիթ / 32-բիթանոց տեղադրիչ * ֆայլը,
* Տեղադրիչը գործարկելու համար կրկնակի կտտացրեք * պիթոն - {{ book.py_release }} - macosx10.9.pkg *:

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

It is very likely that you already have Python installed out of the box. To check if you have it installed (and which version it is), open a console and type the following command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python {{ book.py_release }}
    

If you have a different version of Python installed, at least {{ book.py_min_version }} (e.g. {{ book.py_min_release }}), then you don't have to upgrade. If you don't have Python installed, or if you want a different version, first check what Linux distribution you are using with the following command:

{% filename %}command-line{% endfilename %}

    $ grep '^NAME=' /etc/os-release
    

Afterwards, depending on the result, follow one of the following installation guides below this section.

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Type this command into your console:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Use this command in your console:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

If you're on older Fedora versions you might get an error that the command `dnf` is not found. In that case, you need to use `yum` instead.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Use this command in your console:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Verify the installation was successful by opening a command prompt and running the `python3` command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python {{ book.py_release }}
    

The version shown may be different from {{ book.py_release }} -- it should match the version you installed.

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is {{ book.py_min_version }} or higher. If that doesn't work either, you may open a new command prompt and try again; this happens if you use a command prompt left open from before the Python installation.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.