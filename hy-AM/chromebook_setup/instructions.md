Եթե ​​Chromebook չեք օգտագործում, կարող եք անմիջապես անցնել այս բաժնի վրայով: Եթե ​​դու են, ձեր տեղադրման փորձը մի փոքր այլ կլինի: Դուք կարող եք անտեսել այն տեղադրման հրահանգների մնացած մասը:

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE- ը գործիք է, որը Ձեզ հնարավորություն է տալիս կոդերի խմբագիր եւ հասանելիություն համակարգչային համակարգ ինտերնետում, որտեղ կարող եք տեղադրել, գրել եւ գործարկել ծրագրային ապահովումը: Tutorial- ի տեւողության համար ամպային IDE- ը կգործի որպես ձեր տեղական մեքենա. Դուք դեռեւս հրամաններ կստանաք տերմինալի ինտերֆեյսում, ինչպես ձեր OS X, Ubuntu կամ Windows- ի դասընկերների, բայց ձեր տերմինալը կմիացվի այլ վայրում աշխատող համակարգչին, որ ամպային IDE ստեղծում է ձեզ համար: Ահա Cloud IDE- ի հրահանգները (PaizaCloud Cloud IDE, AWS Cloud9) Դուք կարող եք ընտրել ամպային IDE- ներից մեկը եւ հետեւեք IDE ամպի հրահանգին:

#### PaizaCloud Cloud IDE

1. Գնալ [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Ստեղծել հաշիվ
3. Սեղմեք *New Server* և ընտրեք Django app
4. Սեղմեք Terminal կոճակը (պատուհանի ձախ կողմում)

Այժմ դուք պետք է տեսնեք միջերես, որի կողային սյունն է, ձախ կողմում գտնվող կոճակները: Կտտացրեք «Տերմինալ» կոճակին ՝ տերմինալի պատուհանը բացելու համար ՝ հետևյալ հաղորդագրությամբ.

{% filename %}Terminal{% endfilename %}

    $
    

PaizaCloud Cloud IDE- ի տերմինը պատրաստ է ձեր հրահանգներին: Կարող եք կրկնել կամ մեծացնել այդ պատուհանը, որպեսզի դա մի փոքր ավելի մեծ լինի:

#### AWS Cloud9

Ներկայումս Cloud 9-ը պահանջում է, որ դուք գրանցվեք AWS համակարգով և մուտքագրեք վարկային քարտ տեղեկատվություն

1. Տեղադրեք Cloud 9-ը  Chrome վեբ խանութից </ 0></li> 
    
    - Անցեք c9.io էջին և կտտացրեք «Սկսել AWS Cloud9» - ի հետ
    - Գրանցվել AWS հաշվի համար (պահանջվում է վարկային քարտի վերաբերյալ տեղեկություններ, բայց դրանք կարող եք օգտագործել անվճար)
    - AWS կառավարման վահանակում որոնման տողում մուտքագրեք * Cloud9 * և կտտացրեք այն
    - In the Cloud 9 dashboard, click *Create environment*
    - Name it *django-girls*
    - While configuring settings, select *Create a new instance for environment (EC2)* for "Environment Type" and the *t2.micro* "Instance type" (it should say "Free-tier eligible."). The default cost-saving setting is fine and you can keep the other defaults.
    - Click *Next step*
    - Click *Create environment*</ol> 
    
    Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:
    
    {% filename %}bash{% endfilename %}
    
        yourusername:~/workspace $
        
    
    This bottom area is your terminal. You can use the terminal to send instructions to the remote Cloud 9 computer. You can resize that window to make it a bit bigger.
    
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