# Django շաբլոններ

Որոշ տվյալներ ցուցադրելու ժամանակն է: Դրա համար Django- ն մեզ տալիս է մի քանի օգտակար **template tags/ձևանմուշներ**:

## Ի՞նչ են շաբլոնային պիտակները

Ինչպես տեսնում եք, HTML- ում դուք իսկապես չեք կարող Python կոդ գրել, քանի որ բրաուզերները չեն հասկանում դա: Նրանք գիտեն միայն HTML: Մենք գիտենք, որ HTML- ը բավականին ստատիկ է, մինչդեռ Python- ը շատ ավելի դինամիկ է:

**Django template tags/Django շաբլոնային պիտակները**-ը թույլ են տալիս մեզ Python-ը տեղափոխել HTML- ի մեջ, այնպես որ կարող եք ավելի արագ կառուցել դինամիկ կայքեր: Հիանալի է:

## ցուցադրել հաղորդագրությունների ցուցակի ձևանմուշը 

Նախորդ գլխում մենք մեր ձևանմուշին/template-ին փոխանցեցինք հաղորդագրությունների ցանկը `posts/հաղորդագրությունների ` փոփոխականում: Այժմ այն ​​կներկայացնենք HTML- ով:

Django ձևանմուշի/Django templates մեջ փոփոխական տեղադրելու համար հարկավոր է օգտագործել կրկնակի ձևավոր փակագծեր, որի ներսում փոփոխականի անունն է, ինչպես օրինակում.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Փորձեք սա ձեր ձևանմուշում/template `blog/templates/blog/post_list.html` : Բացեք այն կոդերի խմբագրում և փոխարինեք ամեն ինչ ՝ սկսած երկրորդ –ից`<div>` երրորդ-`</div>` - ով `{{ posts }}`. Պահեք ֆայլը և թարմացրեք էջը ՝ արդյունքները տեսնելու համար. 

![Նկար 13.1](images/step1.png)

Ինչպես տեսնում եք, մենք ստացանք հետևյալ տողը.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Սա ցույց է տալիս, որ Django- ն փոփոխականը հասկանում էր որպես օբյեկտների ցուցակ: Հիշեք Python- ի **Introduction to Python** <0>«Ներածությունից</0>, թե ինչպես կարող ենք ցուցակներ ցուցադրել: Ճիշտ է, for հանգույցով: Django- ի ձևանմուշում դրանք կարող եք օգտագործել այսպես.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Փորձեք սա ձեր ձևանմուշում:

![Նկար 13.2](images/step2.png)

Այն աշխատում է! Բայց մենք ուզում ենք, որ դրանք հայտնվեն որպես ստատիկ գրառումներ, որոնք մենք ստեղծել ենք **Introduction to HTML/ «HTML Ներածություն» ** գլխում: Դուք կարող եք խառնել HTML և ձևանմուշի պիտակները: Մեր `body`-ի տարրը կունենա այսպիսի տեսք.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<header>
    <h1><a href="/">Django Girls Blog</a></h1>
</header>

{% for post in posts %}
    <article>
        <time>published: {{ post.published_date }}</time>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </article>
{% endfor %}
```

{% raw %} Այն ամենը, ինչ դնում եք `{% for %}` - ի և `{% endfor %}` - ի միջև, կկրկնվի ցուցակի յուրաքանչյուր կետի համար: Թարմացրեք էջը ՝ {% endraw %}

![Նկար 13.3](images/step3.png)

Նկատե՞լ եք, որ այս անգամ մենք մի փոքր այլ գրառում ենք օգտագործել (`{{ post.title }}` or `{{ post.text }}`)? Մենք մուտք ենք գործում տվյալների `Post` մոդելում սահմանված յուրաքանչյուր դաշտ: Նաև `|linebreaksbr` -ը տեքստը ֆիլտրում է զտիչի միջոցով ՝ տողերի ընդմիջումները/line-breaks/ պարբերությունների/paragraphs/ վերածելու համար:

## Եվս մեկ բան

Ժամանակն է մեկ անգամ ևս համոզվել, որ մեր կայքը կաշխատի հանրային ինտերնետում, այնպե՞ս չէ: Փորձենք կայքի նոր տարբերակը տեղակայել PythonAnywhere - ում: Ահա քայլերի ամփոփումը...

* Նախ վերբեռնեք ձեր կոդը GitHub- ում

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* Դրանից հետո անցեք [ PythonAnywhere ](https://www.pythonanywhere.com/consoles/), բացեք **Bash console** (կամ սկսեք նորը) և մուտքագրեք հրահանգը.

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd <your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Հիշեք, որ `<your-pythonanywhere-domain>` - ը փոխարինեք ձեր PythonAnywhere օգտվողի անունով, առանց անկյունային փակագծերի:)

* Վերջապես, անցեք ["Web" page/«Վեբ» էջ](https://www.pythonanywhere.com/web_app_setup/) և սեղմեք **Reload/Վերաբեռնում** ձեր վեբ հավելվածում: (Վահանակից PythonAnywhere- ի այլ էջեր հասնելու համար օգտագործեք վերևի աջ անկյունում գտնվող ընտրացանկի կոճակը): Ձեր թարմացումը պետք է հասանելի լինի https://subdomain.pythonanywhere.com- ստուգեք բրաուզերում: Եթե ​​PythonAnywhere կայքում բլոգի գրառումները չեն համընկնում տեղական սերվերում տեղակայված բլոգում հայտնվող գրառումների հետ, դա նորմալ է: Ձեր տեղական համակարգչի և PythonAnywhere- ի տվյալների բազան համապատասխանեցված չէ ձեր մնացած ֆայլերի հետ:

Շնորհավորում ենք։ Այժմ շարունակեք և փորձեք նոր գրառում ավելացնել Django ադմինիստրատորին (չմեռանաք ավելացնել published_date!) Համոզվեք, որ դուք գտնվում եք Django ադմինիստրատորում ձեր pythonanywhere կայքի համար https://subdomain.pythonanywhere.com/admin: Դրանից հետո թարմացրեք ձեր էջը ՝ տեսնելու համար արդյոք գրառումը հայտնվում է այնտեղ:

Զարմանալի՞ է աշխատում: Մենք հպարտ ենք ձեզանով: Մի փոքր հեռացեք համակարգչից. Դուք ընդմիջում եք վաստակել:

![Նկար 13.4](images/donut.png)