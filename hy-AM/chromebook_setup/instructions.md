Եթե ​​Chromebook չեք օգտագործում, կարող եք անմիջապես անցնել այս բաժնի վրայով: Եթե ​​այո, ձեր տեղադրման փորձը մի փոքր այլ կլինի: Դուք կարող եք անտեսել այն տեղադրման հրահանգների մնացած հատվածը:

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com)

Cloud IDE- ը գործիք է, որը Ձեզ տալիս է կոդերի խմբագրման և ինտերնետ համակարգչից օգտվելու հնարավորություն, որի վրա կարող ես տեղադրել, գրել և գործարկել ծրագրային ապահովումը: предоставляющий тебе редактор кода и доступ к компьютеру в интернете, на котором ты можешь установить, записать и выполнить программу. Այս դասընթացի շրջանակներում Cloud IDE-ին կօգտագործվի որպես Ձեր *տեղային գործիք *. Դուք աշխատելու եք տերմինալում (ինչպես և ձեր դասընկերները OS X- ում, Ubuntu- ում կամ Windows- ում), բայց ձեր տերմինալը միացված կլինելու այն համակարգչին, որը գտնվում է Նիդեռլանդներում կամ Գերմանիայում, որը cloud IDE- ը ստեղծել է հատուկ Ձեզ համար: Here are the instructions for cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com). Դուք կարող եք ընտրել ամպային IDE- ներից մեկը եւ հետեւեք IDE ամպի հրահանգին:

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
        
        #### Glitch.com Cloud IDE
        
        1. Go to [Glitch.com](https://glitch.com/)
        2. Sign up for an account (https://glitch.com/signup) or use your GitHub account if you have one. (See GitHub instructions below.)
        3. Click *New Project* and choose *hello-webpage*
        4. Click on the Tools dropdown list (at the bottom left side of the window), then on Terminal button to open terminal tab with a prompt like this:
        
        {% filename %}Terminal{% endfilename %}
        
            app@name-of-your-glitch-project:~
            
        
        When using Glitch.com as your Cloud IDE, you don't have to create a virtual environment. Instead, create the following files manually:
        
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
        
        Once these files are created, go to the Terminal and execute the following commands to create your first Django project:
        
        {% filename %}Terminal{% endfilename %}
        
            django-admin.py startproject mysite .
            refresh
            
        
        In order to see detailed error messages, you can activate Django debug logs for your Glitch application. Simply add the following at the end of the `mysite/settings.py` file.
        
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
        
        This will create a `debug.log` file detailing Django operations and any error messages that might come up, making it much easier to fix if your website does not work.
        
        The initial restarting of the Glitch project should fail. (If you click on the top dropdown button `Show` then click on `In a New Window`, you will receive a `DisallowedHost` error message.) Do not worry about it at this stage, the tutorial will fix this as soon as you update the Django settings of your project in the `mysite/settings.py` file.
        
        ### Virtual Environment
        
        A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.
        
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