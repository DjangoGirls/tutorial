Եթե ​​Chromebook չեք օգտագործում, կարող եք անմիջապես անցնել այս բաժնի վրայով: Եթե ​​դու են, ձեր տեղադրման փորձը մի փոքր այլ կլինի: Դուք կարող եք անտեսել այն տեղադրման հրահանգների մնացած մասը:

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE- ը գործիք է, որը Ձեզ հնարավորություն է տալիս կոդերի խմբագիր եւ հասանելիություն համակարգչային համակարգ ինտերնետում, որտեղ կարող եք տեղադրել, գրել եւ գործարկել ծրագրային ապահովումը: Tutorial- ի տեւողության համար ամպային IDE- ը կգործի որպես ձեր տեղական մեքենա. Դուք դեռեւս հրամաններ կստանաք տերմինալի ինտերֆեյսում, ինչպես ձեր OS X, Ubuntu կամ Windows- ի դասընկերների, բայց ձեր տերմինալը կմիացվի այլ վայրում աշխատող համակարգչին, որ ամպային IDE ստեղծում է ձեզ համար: Ահա Cloud IDE- ի հրահանգները (PaizaCloud Cloud IDE, AWS Cloud9) Դուք կարող եք ընտրել ամպային IDE- ներից մեկը եւ հետեւեք IDE ամպի հրահանգին:

#### PaizaCloud Cloud IDE

1. Գնալ [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Ստեղծել account
3. Սեղմեք *New Server* և ընտրեք Django app
4. Սեղմեք Terminal կոճակը (պատուհանի ձախ կողմում)

Այժմ դուք պետք է տեսնեք ինտերֆեյս կողային վահանակով և ձախ կողմում գտնվում կոճակներ: Կտտացրեք «Տերմինալ» կոճակին ՝ տերմինալի պատուհանը բացելու համար ՝ հետևյալ հաղորդագրությամբ.

{% filename %}Terminal{% endfilename %}

    $
    

PaizaCloud Cloud IDE- ի տերմինը պատրաստ է ձեր հրահանգներին: Կարող եք կրկնել կամ մեծացնել այդ պատուհանը, որպեսզի դա մի փոքր ավելի մեծ լինի:

#### AWS Cloud9

Այժմ Cloud 9-ը պահանջում է, որ դուք գրանցվեք AWS համակարգով և մուտքագրեք կրեդիտ քարտի տվյալները:

1. Տեղադրեք Cloud 9-ը  Chrome վեբ խանութից </ 0></li> 
    
    - Անցեք c9.io էջին և կտտացրեք «Սկսել AWS Cloud9» - ի հետ
    - Գրանցվել AWS հաշվի համար (պահանջվում է վարկային քարտի վերաբերյալ տեղեկություններ, բայց դրանք կարող եք օգտագործել անվճար)
    - AWS կառավարման վահանակում որոնման տողում մուտքագրեք * Cloud9 * և կտտացրեք այն
    - Cloud 9-ի կառավարման վահանակում կտտացրեք * Ստեղծել միջավայր </ 0></li> 
        
        - Անվանեք այն django-girls
        - Պարամետրերը կազմաձևելիս ընտրեք * Ստեղծել նոր օրինակ միջավայրի համար (EC2) * «Շրջակա միջավայրի տեսակը» և * t2.micro * «Գործի տեսակը» համար ասեք «Ազատ մակարդակի իրավասու»:): Նախնական ծախսերի խնայողությունը կարգավորված է, և դուք կարող է պահպանել մյուս կանխադրվածները:
        - Կտտացրեք * Next step *
        - Կտտացրեք * Create environment *</ol> 
        
        Այժմ դուք պետք է տեսնեք միջերես ՝ կողային տողի հետ, մեծ հիմնական պատուհան ՝ որոշներով տեքստը, և ներքևում գտնվող մի փոքրիկ պատուհան, որն ունի նման մի բան.
        
        {% filename %}bash{% endfilename %}
        
            yourusername:~/workspace $
            
        
        Այս ստորին հատվածը ձեր տերմինալն է: Հրահանգներ ուղարկելու համար կարող եք օգտագործել տերմինալը հեռավոր Cloud 9 համակարգչին: Կարող եք չափափոխել այդ պատուհանը մի փոքր դարձնելու համար ավելի մեծ.
        
        ### Virtual Environment
        
        (Virtual environment) Վիրտուալ միջավայրը (որը կոչվում է նաև վիրտուալենվ) նման է մեր անձնական տուփի օգտագործեք օգտակար համակարգչային ծածկագիր այն նախագծի համար, որի վրա մենք աշխատում ենք: We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.
        
        Run:
        
        {% filename %}Cloud 9{% endfilename %}
        
            mkdir djangogirls
            cd djangogirls
            python3 -m venv myvenv
            source myvenv/bin/activate
            pip install django~={{ book.django_version }}
            
        
        (note that on the last line we use a tilde followed by an equal sign: `~=`).
        
        ### GitHub
        
        Make a [GitHub](https://github.com) account.
        
        ### PythonAnywhere
        
        The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.
        
        This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.
        
        Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).