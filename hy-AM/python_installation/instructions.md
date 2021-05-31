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

![
Մի մոռացեք Python- ին ավելացնել Path- ին](../python_installation/images/python-installation-options.png)

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

Շատ հավանական է, որ Python- ն արդեն տեղադրված է տուփից դուրս: Ստուգելու համար, արդյոք այն տեղադրված է (և որ տարբերակն է), բացեք վահանակ և մուտքագրեք հետևյալ հրահանգը.

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python {{ book.py_release }}
    

Եթե ​​Python- ի այլ տարբերակ ունեք տեղադրված, առնվազն {{ book.py_min_version }} (օրինակ ՝ {{ book.py_min_release }}), ապա ձեզ հարկավոր չէ արդիականացնել: Եթե ​​Python- ը տեղադրված չէ, կամ եթե այլ տարբերակ եք ուզում, նախ ստուգեք, թե Linux- ի ո՞ր բաշխումն եք օգտագործում հետևյալ հրահանգով.

{% filename %}command-line{% endfilename %}

    $ grep '^NAME=' /etc/os-release
    

Դրանից հետո, կախված արդյունքից, հետևեք այս բաժնի ներքևում տեղադրված հետևյալ ուղեցույցներից մեկին:

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Մուտքագրեք այս հրամանը ձեր վահանակի մեջ.

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Օգտագործեք այս հրամանը ձեր վահանակում.

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

Եթե ​​Fedora- ի հին տարբերակներում եք, կարող է սխալվել, որ ` dnf ` հրամանը չի գտնվել: Այդ դեպքում փոխարենը պետք է օգտագործել ` yum `:

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Օգտագործեք այս հրամանը ձեր վահանակում.

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Հաստատեք, որ տեղադրումը հաջող է անցել ՝ հրամանի տող բացելով և գործարկելով ` python3 ` հրամանը.

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python {{ book.py_release }}
    

Shownուցադրված տարբերակը կարող է տարբերվել {{ book.py_release }} - ից `այն պետք է համապատասխանի ձեր տեղադրած տարբերակին:

**NOTE:** Եթե ​​Windows- ում եք և սխալ հաղորդագրություն եք ստանում, որ ` python3 ` չի գտնվել, փորձեք օգտագործել ` python ` (առանց ` 3 `) և ստուգեք եթե այն դեռ կարող է լինել Python- ի {{ book.py_min_version }} կամ ավելի բարձր տարբերակ: Եթե ​​դա նույնպես չի աշխատում, կարող եք բացել նոր հրամանի տող և նորից փորձել: դա տեղի է ունենում, եթե օգտագործում եք Python- ի տեղադրումից առաջ բացված հրամանի տողը:

* * *

Եթե ​​կասկածներ ունեք կամ ինչ-որ բան սխալ է տեղի ունեցել, և գաղափար չունեք հետագա անելիքների մասին, խնդրում ենք ձեր մարզչին հարցրեք: Երբեմն ամեն ինչ հարթ չի ընթանում, և ավելի լավ է օգնություն խնդրել ավելի մեծ փորձ ունեցող մեկից: