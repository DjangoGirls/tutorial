Եթե ​​Chromebook չեք օգտագործում, կարող եք անմիջապես անցնել այս բաժնի վրայով: Եթե ​​այո, ձեր տեղադրման փորձը մի փոքր այլ կլինի: Դուք կարող եք անտեսել այն տեղադրման հրահանգների մնացած հատվածը:

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com)

Cloud IDE- ը գործիք է, որը Ձեզ տալիս է կոդերի խմբագրման և ինտերնետ համակարգչից օգտվելու հնարավորություն, որի վրա կարող ես տեղադրել, գրել և գործարկել ծրագրային ապահովումը: предоставляющий тебе редактор кода и доступ к компьютеру в интернете, на котором ты можешь установить, записать и выполнить программу. Այս դասընթացի շրջանակներում Cloud IDE-ին կօգտագործվի որպես Ձեր *տեղային գործիք *. Դուք աշխատելու եք տերմինալում (ինչպես և ձեր դասընկերները OS X- ում, Ubuntu- ում կամ Windows- ում), բայց ձեր տերմինալը միացված կլինելու այն համակարգչին, որը գտնվում է Նիդեռլանդներում կամ Գերմանիայում, որը cloud IDE- ը ստեղծել է հատուկ Ձեզ համար: Ահա ամպային IDE- ների ցուցումները (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com): Դուք կարող եք ընտրել ամպային IDE- ներից մեկը եւ հետեւեք IDE ամպի հրահանգին:

#### PaizaCloud Cloud IDE 

1. Գնալ [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Ստեղծել account
3. Սեղմեք *New Server* և ընտրեք Django app
4. Սեղմեք Terminal կոճակը (պատուհանի ձախ կողմում)

Այժմ դուք պետք է տեսնեք ինտերֆեյս՝ լուսանցքի նշումով և ձախ կողմում գտնվող կոճակներ: Կտտացրեք «Տերմինալ» կոճակին ՝ տերմինալի պատուհանը բացելու համար ՝ հետևյալ հաղորդագրությամբ.

{% filename %}Terminal{% endfilename %}

    $
    

PaizaCloud Cloud IDE- ի տերմինը պատրաստ է ձեր հրահանգներին: Կարող եք կրկնել կամ մեծացնել այդ պատուհանը, որպեսզի դա մի փոքր ավելի մեծ լինի:

#### AWS Cloud9 

Այժմ Cloud 9-ը պահանջում է, որ դուք գրանցվեք AWS համակարգով և մուտքագրեք կրեդիտ քարտի տվյալները:

1. Ներբեռնեք Cloud 9-ը [ Chrome վեբ խանութից ](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Անցեք [c9.io](https://c9.io)էջին և կտտացրեք *Get started with AWS Cloud9*
3. Գրանցվել AWS հաշվի համար (պահանջվում է կրեդիտ քարտի տվյալները, բայց այն կարող եք օգտագործել անվճար)
4. AWS կառավարման վահանակում որոնման տողում մուտքագրեք * Cloud9 * և կտտացրեք այն
5. Cloud 9-ի կառավարման վահանակում կտտացրեք * Ստեղծել միջավայր *
6. Անվանեք այն django-girls
7. Պարամետրերը կազմելիս ընտրեք *Create a new instance for environment (EC2)* "Environment Type" -ի (շրջակա միջավայրի տեսակի) համար և * t2.micro * "Instance type"-ի (գործի տեսակի) համար: (այն պետք է թուլ տա "Free-tier eligible." (Ազատ օգտագործման իրավունք): Նախնական ծախսերի խնայողությունը կարգավորված է, և դուք կարող է պահպանել մյուս նախադրյալները:
8. Կտտացրեք * Next step *
9. Կտտացրեք * Create environment *

Այժմ դուք պետք է տեսնեք ինտերֆեյս ՝ լուսանցքի նշումով, մեծ հիմնական պատուհան ՝ որոշակի տեքստով, իսկ ներքևի հատվածում փոքրիկ պատուհան, որն ունի նմանատիպ տեսք:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    
    

Այս ստորին հատվածը ձեր տերմինալն է: Դուք կարող եք օգտագործել տերմինալը հրահանգներ ուղարկելու համար հեռավար Cloud 9 համակարգչին: Կարող եք փոփոխել այդ պատուհանի չափերը այն մի փոքր մեծացնելով:

#### Glitch.com Cloud IDE

1. Գնացեք [ Glitch.com ](https://glitch.com/)
2. Գրանցվեք հաշվի համար (https://glitch.com/signup) կամ օգտագործեք ձեր GitHub հաշիվը, եթե ունեք: (Տե՛ս GitHub- ի ցուցումները ստորև):
3. Սեղմեք * New Project (Նոր նախագիծ )* և ընտրեք * hello-webpage (բարև-կայք) *
4. Սեղմեք «Գործիքներ» ցանկի ցուցակի վրա (պատուհանի ներքևի ձախ կողմում), ապա «Տերմինալ» կոճակին ՝ տերմինալի ներդիրը բացելու համար ՝ այսպիսի հուշմամբ.

{% filename %}Terminal{% endfilename %}

    app@name-of-your-glitch-project:~
    

Glitch.com- ը որպես Cloud IDE օգտագործելիս անհրաժեշտ չէ վիրտուալ միջավայր ստեղծել: Փոխարենը, ձեռքով ստեղծեք հետևյալ ֆայլերը.

{% filename %}glitch.json{% endfilename %}

```json
{
  "install": "pip3 install -r requirements.txt --user",
  "start": "bash start.sh",
  "watch": {
    "throttle": 1000
  }
}
```

{% filename %}requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

{% filename %}.bash_profile{% endfilename %}

```bash
alias python=python3
alias pip=pip3
```

{% filename %}start.sh{% endfilename %}

```bash
chmod 600 .bash_profile
pip3 install -r requirements.txt --user
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver $PORT
```

Այս ֆայլերը ստեղծվելուց հետո անցեք Տերմինալ և կատարեք հետևյալ հրամանները ՝ ձեր առաջին Django նախագիծը ստեղծելու համար.

{% filename %}Terminal{% endfilename %}

    django-admin.py startproject mysite .
    refresh
    

Որպեսզի մանրամասն սխալի հաղորդագրություններ տեսնեք, կարող եք ակտիվացնել Django debug/Django կարգաբերման տեղեկամատյանները ձեր Glitch հավելվածի համար: Պարզապես ավելացրեք հետևյալը `mysite/settings.py` ֆայլի վերջում:

{% filename %}mysite/settings.py{% endfilename %}

```python
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': 'debug.log',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['file'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
}
```

Սա կստեղծի ` debug.log ` ֆայլ, որը մանրամասնում է Django- ի գործողությունները և ցանկացած սխալ հաղորդագրություններ, որոնք կարող են ի հայտ գալ, շատ ավելի հեշտ դարձնելով դրանց շտկումը, եթե ձեր կայքը չի աշխատում:

Glitch նախագծի նախնական վերագործարկումը պետք է ձախողվի: (If you click on the top dropdown button `Show` then click on `In a New Window`, you will receive a `DisallowedHost` error message.) Do not worry about it at this stage, the tutorial will fix this as soon as you update the Django settings of your project in the `mysite/settings.py` file.

### Virtual Environment

(Virtual environment) Վիրտուալ միջավայրը (որը կոչվում է նաև virtualenv) նման է մեր անձնական տուփի. մենք կարող ենք ավելացնել օգտակար համակարգչային ծածկագիր (code) այն նախագծի համար, որի շուրջ մենք աշխատում ենք: Մենք օգտագործում ենք դրանք, որպեսզի պահպանենք տարբեր ծածկագրերի կոդերի մասնիկներ առանձին, այնպես որ դրանք չխառնվեն այլ նախագծերի հետ:

Run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3 -m venv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(նշենք, որ վերջին տողի վրա մենք օգտագործում ենք ալիք, որին հաջորդում է հավասար նշանը ՝ ` ~ = `):

### GitHub

Ստեղծեք GitHub հաշիվ:

### PythonAnywhere 

Django Girls ձեռնարկը ներառում է բաժին այն մասին, թե ինչ է կոչվում Տեղակայում/Deployment-ը որը ձեր նոր վեբ հավելվածն աշխատեցնող ծածկագիր ստանալու գործընթացն է և տեղափոխումն այն հանրությանը հասանելի համակարգիչ (կոչվում է սերվեր/server) և այլն մարդիկ կարող են տեսնել ձեր աշխատանքը:

Այս բաժինը մի փոքր տարօրինակ է, երբ մեզ մոտ Chromebook է, քանի որ մենք արդեն օգտագործում ենք համակարգիչ, որը գտնվում է ինտերնետային տիրույթում (ի տարբերություն, ասենք, նոութբուքի): Այնուամենայնիվ, այն դեռ օգտակար է, քանի որ մենք կարող ենք մեր Cloud 9 -ի աշխատանքային տարածքը համարել որպես «ընթացքի մեջ»/"in progress" գտնվող աշխատանքների տիրույթ, իսկ Python Anywhere-ը ՝ պատրաստի աշխատանքները ցուցադրելու տիրույթ, քանի որ այն ավելի ամբողջական տեսք ունի:

Այսպիսով, գրանցվեք Python Anywhere նոր հաշվի համար ՝ [www.pythonanywhere.com](https://www.pythonanywhere.com).