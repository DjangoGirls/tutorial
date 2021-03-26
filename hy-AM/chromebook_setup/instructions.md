Եթե ​​Chromebook չեք օգտագործում, կարող եք անմիջապես անցնել այս բաժնի վրայով: Եթե ​​այո, ձեր տեղադրման փորձը մի փոքր այլ կլինի: Դուք կարող եք անտեսել այն տեղադրման հրահանգների մնացած հատվածը:

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE- ը գործիք է, որը Ձեզ տալիս է կոդերի խմբագրման և ինտերնետ համակարգչից օգտվելու հնարավորություն, որի վրա կարող ես տեղադրել, գրել և գործարկել ծրագրային ապահովումը: предоставляющий тебе редактор кода и доступ к компьютеру в интернете, на котором ты можешь установить, записать и выполнить программу. Այս դասընթացի շրջանակներում Cloud IDE-ին կօգտագործվի որպես Ձեր *տեղային գործիք *. Դուք աշխատելու եք տերմինալում (ինչպես և ձեր դասընկերները OS X- ում, Ubuntu- ում կամ Windows- ում), բայց ձեր տերմինալը միացված կլինելու այն համակարգչին, որը գտնվում է Նիդեռլանդներում կամ Գերմանիայում, որը cloud IDE- ը ստեղծել է հատուկ Ձեզ համար: Ահա Cloud IDE- ի հրահանգները (PaizaCloud Cloud IDE, AWS Cloud9) Դուք կարող եք ընտրել ամպային IDE- ներից մեկը եւ հետեւեք IDE ամպի հրահանգին:

#### PaizaCloud Cloud IDE 

1. Գնալ [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Ստեղծել account
3. Սեղմեք *New Server* և ընտրեք Django app
4. Սեղմեք Terminal կոճակը (պատուհանի ձախ կողմում)

Այժմ դուք պետք է տեսնեք ինտերֆեյս՝ լուսանցքի նշումով և ձախ կողմում գտնվում կոճակներ: Կտտացրեք «Տերմինալ» կոճակին ՝ տերմինալի պատուհանը բացելու համար ՝ հետևյալ հաղորդագրությամբ.

{% filename %}Terminal{% endfilename %}

    $
    

PaizaCloud Cloud IDE- ի տերմինը պատրաստ է ձեր հրահանգներին: Կարող եք կրկնել կամ մեծացնել այդ պատուհանը, որպեսզի դա մի փոքր ավելի մեծ լինի:

#### AWS Cloud9 

Այժմ Cloud 9-ը պահանջում է, որ դուք գրանցվեք AWS համակարգով և մուտքագրեք կրեդիտ քարտի տվյալները:

1. Ներբեռնեք Cloud 9-ը  Chrome վեբ խանութից </ 0></li> 
    
    - Անցեք [c9.io](https://c9.io)էջին և կտտացրեք *Get started with AWS Cloud9*
    - Գրանցվել AWS հաշվի համար (պահանջվում է կրեդիտ քարտի տվյալները, բայց այն կարող եք օգտագործել անվճար)
    - AWS կառավարման վահանակում որոնման տողում մուտքագրեք * Cloud9 * և կտտացրեք այն
    - Cloud 9-ի կառավարման վահանակում կտտացրեք * Ստեղծել միջավայր </ 0></li> 
        
        - Անվանեք այն django-girls
        - Պարամետրերը կազմելիս ընտրեք *Create a new instance for environment (EC2)* "Environment Type" -ի (շրջակա միջավայրի տեսակի) համար և * t2.micro * "Instance type"-ի (գործի տեսակի) համար: (այն պետք է թուլ տա "Free-tier eligible." (Ազատ օգտագործման իրավունք): Նախնական ծախսերի խնայողությունը կարգավորված է, և դուք կարող է պահպանել մյուս նախադրյալները:
        - Կտտացրեք * Next step *
        - Կտտացրեք * Create environment *</ol> 
        
        Այժմ դուք պետք է տեսնեք ինտերֆեյս ՝ լուսանցքի նշումով, մեծ հիմնական պատուհան ՝ որոշակի տեքստով, իսկ ներքևի հատվածում փոքրիկ պատուհան, որն ունի նմանատիպ տեսք:
        
        {% filename %}bash{% endfilename %}
        
            yourusername:~/workspace $
            
            
        
        Այս ստորին հատվածը ձեր տերմինալն է: Դուք կարող եք օգտագործել տերմինալը հրահանգներ ուղարկելու համար հեռավար Cloud 9 համակարգչին: Կարող եք փոփոխել այդ պատուհանի չափերը այն մի փոքր մեծացնելով:
        
        ### Virtual Environment
        
        (Virtual environment) Վիրտուալ միջավայրը (որը կոչվում է նաև virtualenv) նման է մեր անձնական տուփի. մենք կարող ենք ավելացնել օգտակար համակարգչային ծածկագիր (code) այն նախագծի համար, որի շուրջ մենք աշխատում ենք: Մենք օգտագործում ենք դրանք, որպեսզի պահպանենք տարբեր ծածկագրերի կոդերի մասնիկներ առանձին, այնպես որ դրանք չխառնվեն այլ նախագծերի հետ: 
        
        Run
        
        {% filename %}Cloud 9{% endfilename %}
        
            mkdir djangogirls
            cd djangogirls
            python3 -m venv myvenv
            source myvenv/bin/activate
            pip install django~={{ book.django_version }}
            
        
        (նշենք, որ վերջին տողի վրա մենք օգտագործում ենք տիլդա, որին հաջորդում է հավասար նշանը ՝ ` ~ = `):
        
        ### GitHub
        
        Կատարեք GitHub հաշիվ:
        
        ### PythonAnywhere 
        
        Django Girls ձեռնարկը ներառում է բաժին այն մասին, թե ինչ է Տեղակայումը (Deployment), որը ձեր նոր վեբ հավելվածն աշխատեցնող ծածկագիր ստանալու գործընթացն է, և այն տեղափումը հանրամատչելի տիրույթ՝ (կոչվում է սերվեր-server) որի արդյունքում այլ մարդիկ նույնպես կարող են տեսնել ձեր աշխատանքը:
        
        Այս բաժինը մի փոքր տարօրինակ է, երբ մեզ մոտ Chromebook է, քանի որ մենք արդեն օգտագործում ենք համակարգիչ, որը գտնվում է ինտերնետային տիրույթում (ի տարբերություն, ասենք, նոութբուքի): Այնուամենայնիվ, այն դեռ օգտակար է, քանի որ մենք կարող ենք մեր Cloud 9 -ի աշխատանքային տարածքը համարել որպես «ընթացքի մեջ» գտնվող աշխատանքների տիրույթ, իսկ Python Anywhere-ը ՝ պատրաստի աշխատանքները ցուցադրելու տիրույթ, քանի որ այն ավելի ամբողջական տեսք ունի:
        
        Այսպիսով, գրանցվեք Python Anywhere նոր հաշվի համար ՝ [www.pythonanywhere.com](https://www.pythonanywhere.com).