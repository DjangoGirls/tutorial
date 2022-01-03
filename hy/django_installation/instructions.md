> Այս բաժնի մի մասը հիմնված է Geek Girls Carrots- ի (https://github.com/ggcarrots/django-carrots) ձեռնարկների վրա:
> 
> Այս բաժնի մի մասը հիմնված է [django-marcador- ի վրա ձեռնարկ](http://django-marcador.keimlink.de/) լիցենզավորված Creative Commons- ի ներքո Attribution-ShareAlike 4.0 միջազգային լիցենզիա: Django-marcador ձեռնարկի հեղինակային իրավունքի պաշտպանն են Markus Zapke-Gründemann et al.

## Վիրտուալ միջավայր

Նախքան Django- ն տեղադրելը, մենք ձեզ կառաջարկենք տեղադրել չափազանց օգտակար գործիք, որը կօգնի ձեր կոդավորման միջավայրը կոկիկ պահել ձեր համակարգչում: Հնարավոր է բաց թողնել այս քայլը, բայց խորհուրդ է տրվում իրականացնել: Հնարավոր լավագույն կարգավորումից սկսելը ապագայում ձեզ շատ դժվարություններ կփրկի:

Այսպիսով, եկեք ստեղծենք ** վիրտուալ միջավայր/virtual environment** (կոչվում է նաև *virtualenv* ): Virtualenv- ը մեկուսացնելու է ձեր Python / Django- ի տեղադրումը ՝ ըստ նախագծի: Սա նշանակում է, որ որևէ փոփոխություն, որ կատարեք մեկ կայքում, չի ազդի որևէ այլ կայքի վրա, որը դուք նույնպես զարգացնում եք: Կոկիկ է, այնպես չէ՞:

Դուք պետք է ընդամենը գտնեք գրացուցակ, որում ցանկանում եք ստեղծել `virtualenv`; ձեր տան գրացուցակը, օրինակ. Windows- ում այն ​​կարող է նման լինել `C:\Users\Name` (որտեղ ` Name ` - ը ձեր մուտքի անունն է):

> ** ՆՇՈՒՄ. ** Windows- ում համոզվեք, որ այս գրացուցակը չի պարունակում շեշտադրված կամ հատուկ նիշեր. եթե ձեր օգտանունը պարունակում է ընդգծված նիշեր, օգտագործեք այլ գրացուցակ, օրինակ ՝ `C:\djangogirls`:

Այս ձեռնարկի համար մենք կօգտագործենք նոր գրացուցակ ` djangogirls ` ձեր տան գրացուցակից.

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

Մենք պատրաստելու ենք մի վիրտուալ անուն, որը կոչվում է ` myvenv `: Ընդհանուր հրամանը կլինի ձևաչափով/format.

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

Նոր `virtualenv` ստեղծելու համար հարկավոր է բացել հրամանի տողը և գործարկել `python -m venv myvenv`: Դա կունենա այսպիսի տեսք.

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Որտեղ ` myvenv ` - ը ձեր `virtualenv` անունն է: Կարող եք օգտագործել ցանկացած այլ անուն, բայց հավատարիմ մնացեք փոքրատառերին և մի օգտագործեք բացատներ, շեշտադրումներ կամ հատուկ նիշեր: Լավ է նաև, որ անունը կարճ մնա. Դուք դեռ շատ կանդրադառնաք դրան:

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

Մենք կարող ենք ստեղծել ` virtualenv ` ինչպես Linux- ի, այնպես էլ OS X- ի վրա ՝ գործարկելով `python3 -m venv myvenv`: Դա կունենա այսպիսի տեսք.

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

` myvenv ` - ը ձեր `virtualenv` անունն է: Կարող եք օգտագործել ցանկացած այլ անուն, բայց հավատարիմ մնացեք փոքրատառերին և բացատներ մի օգտագործեք: Լավ է նաև, որ անունը կարճ մնա. Դուք դեռ շատ կանդրադառնաք դրան:

> ** ՆՇՈՒՄ. ** Debian / Ubuntu- ի որոշ տարբերակների վրա կարող եք ստանալ հետևյալ սխալը.
> 
> {% filename %}command-line{% endfilename %}
> 
>     Վիրտուալ միջավայրը հաջողությամբ չի ստեղծվել, քանի որ ensurepip- ը հասանելի չէ:  Debian / Ubuntu համակարգերում անհրաժեշտ է տեղադրել python3-venv փաթեթը ՝ օգտագործելով հետևյալ հրամանը:
>        apt install python3-venv
>     Հնարավոր է, որ ձեզ հարկավոր է օգտագործել sudo(սուդո) այդ հրահանգով:
>       Python3-venv փաթեթը տեղադրելուց հետո վերստեղծեք ձեր virtual environment (վիրտուալ միջավայր)-ը:
>     
> 
> Այս դեպքում հետևեք վերը նշված հրահանգներին և տեղադրեք ` python3-venv ` փաթեթը. {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python3-venv
>     
> 
> ** ՆՇՈՒՄ. ** Debian / Ubuntu- ի որոշ տարբերակներում վիրտուալ միջավայր նախաձեռնելիս այն տալիս է հետևյալ սխալը.
> 
> {% filename %}command-line{% endfilename %}
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Այս խնդրը շրջանցելու համար օգտագործեք ` virtualenv ` հրամանը:
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python-virtualenv
>     $ virtualenv --python=python{{ book.py_version }} myvenv
>     
> 
> **Նշում** Եթե նման սխալ եք ստանում
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> փոխարենը բաց թող
> 
> {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python{{ book.py_version }}-venv
>     

<!--endsec-->

## Վիրտուալենվի/virtualenv-ի հետ աշխատանք

Վերոնշյալ հրամանը կստեղծի ` myvenv ` գրացուցակ (կամ մեկ այլ ՝ ձեր ընտրած ցանկացած անուն), որը կպարունակի վիրտուալ միջավայր/ virtual environment (հիմնականում ֆայլերի և պանակների շարք):

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Սկսեք ձեր վիրտուալ միջավայրը/virtual environment-ը `գործարկելով.

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

> ** Նշում. ** Windows 10-ի դեպքում Windows PowerShell- ում կարող է ստացվել սխալի հաղորդագրություն, որում ասվում է, որ `execution of scripts is disabled on this system/սցենարը անջատված է այս համակարգում` Այս դեպքում բացեք մեկ այլ Windows PowerShell «Գործարկեք որպես ադմինիստրատոր»/"Run as Administrator" տարբերակով: Դրանից հետո փորձեք մուտքագրել հետևյալ հրամանը ՝ նախքան ձեր վիրտուալ միջավայրի/virtual environment-ի սկսելը.
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     

<!-- (This comment separates the two blockquote blocks, so that GitBook and Crowdin don't merge them into a single block.) -->

> **Նշում** Հանրաճանաչ խմբագիր VS Code- ի օգտագործողների համար, որոնք գալիս են Windows PowerShell- ի վրա հիմնված ինտեգրված տերմինալ, եթե ցանկանում եք հավատարիմ մնալ ինտեգրված տերմինալին, կարող եք գործարկել հետևյալ հրահանգը ՝ ձեր վիրտուալ միջավայրն ակտիվացնելու համար.
> 
>     $ . myvenv\Scripts\activate.ps1
>     
> 
> Առավելությունն այն է, որ անհրաժեշտ չէ փոխություն անել խմբագրի պատուհանի և հրամանի տողի միջև:

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Սկսեք ձեր վիրտուալ միջավայրը/virtual environment-ը `գործարկելով.

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

Մի մոռացեք ` myvenv ` -ը փոխարինել ձեր ընտրած ` virtualenv ` անունով:

> **Նշում**երբեմն `source/աղբյուրը` կարող է անհասանելի լինել: Այդ դեպքում օգտագործեք հետևյալ մեթոդը.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

Դուք կհասկանաք, որ virtualenv- ն աշխատում է, երբ հրամանի տողում տեսնեք `(myvenv)` նախածանցը:

Վիրտուալ միջավայրի հետ աշխատելիս ` python ` հրամանն ինքնաբերաբար կվերաբերվի լեզվի ճիշտ տարբերակին, այնպես որ ձեզ հարկավոր չէ օգտագործել ` python3 `: 

Հիանալի է, հիմա մենք բոլոր կարեւոր կախվածությունները կպահենք մեկ տեղում: Վերջապես, դուք կարող եք տեղադրել Django- ն:

## Django- ի տեղադրում {#django}

Այժմ, երբ ձեր `virtualenv`-ն աշխատում է, կարող եք տեղադրել Django- ն:

Բայց մինչ այդ մենք պետք է համոզվենք, որ մենք ունենք `pip`- ի վերջին տարբերակը տեղադրված, դա այն ծրագիրն է, որը մենք կօգտագործենք Django- ն տեղադրելու համար.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python -m pip install --upgrade pip
    

### Փաթեթների տեղադրում պահանջներով

Պահանջների ֆայլը/A requirements file պահում է կախվածության ցուցակը որը տեղադրվելու է օգտագործելով `pip install`:

Սկզբից ` djangogirls/ ` թղթապանակի մեջ ստեղծեք ` requirements.txt ` ֆայլ ՝ օգտագործելով ավելի վաղ տեղադրած կոդերի խմբագրիչը: Դուք դա անում եք կոդի խմբագրում/code editor-ում նոր ֆայլ բացելով, այնուհետև պահպանելով այն որպես `requirements.txt/ պահանջներ` `djangogirls/` թղթապանակում: Ձեր թղթապանակն այսպիսի տեսք կունենա.

    djangogirls
    ├── myvenv
    │   └── ...
    └───requirements.txt
    

Հետևյալ կոդը ավելացրեք ձեր `djangogirls/requirements.txt` ֆայլում.

{% filename %}djangogirls/requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

Django- ն տեղադրելու համար այժմ մուտքագրեք `pip install -r requirements.txt`:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install -r requirements.txt
    Collecting Django~={{ book.django_version }} (from -r requirements.txt (line 1))
      Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.1MB)
    Installing collected packages: Django
    Successfully installed Django-{{ book.django_version }}
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> Եթե ​​Windows- ում pip գործարկելիս սխալ եք ստացել, ստուգեք, որ նախագծի գրացուցակը չի պարունակում հեռավորություններ կամ հատուկ նիշեր (օրինակ, `C:\Users\User Name\djangogirls`): Եթե ​​սա է խնդիրը, ապա խնդրում ենք ձեր նախագիծը տեղափոխել մեկ այլ վայր, որի հասցեն չի պարունակի բացատներ և հատուկ նիշեր (խորհուրդ ենք տալիս ՝ `C:\djangogirls`): Նոր գրացուցակում ստեղծեք նոր virtualenv, այնուհետև ջնջեք հինը և կրկնեք վերը նշված հրահանգները: (Virtualenv գրացուցակի տեղափոխումը չի գործի, քանի որ virtualenv- ն օգտագործում է բացարձակ ուղիներ):

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Հրամանի տողը կարող է սառեցնել Django- ն տեղադրելու փորձից հետո: Եթե ​​դա տեղի ունենա, ապա վերը նշված հրամանի փոխարեն օգտագործեք այս մեկը.
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install -r requirements.txt
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> Եթե ​​Ubuntu 12.04-ին pip զանգահարելիս սխալի եք հանդիպում, գործարկեք `python -m pip install -U --force-reinstall pip` ՝ վիրտուալում pip- ի տեղադրումն ամրագրելու համար: 

<!--endsec-->

Վերջ Դուք այժմ (վերջապես) պատրաստ եք ստեղծել Django հավելված: