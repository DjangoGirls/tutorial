# Django шаблони

Време е да покажем на екран малко данни! Django има вградени **template tags** за тази цел.

## Какви са тези шаблонни етикети?

Виждате, в HTML не може наистина да пишете Python код, защото търсачките не го разбират. Те знаят само HTML. Знаем, че HTML е статичен, докато Python е по-динамичен.

**Django template tags** ни позволяват да прехвърлим Python нещата към HTML, така че да изграждаме динамични сайтове по-бързо. Супер!

## Показване на шаблон за лист от публикации

В предишната глава дадохме на нашия шаблон лист от публикации с променливата `posts`. Сега ще го покажем на екран с HTML.

За да отпечатаме променливата в шаблоните на Django, използваме къдрави скоби с името на променливата вътре ето така:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Пробвайте това във вашия шаблон `blog/templates/blog/post_list.html`. Отворете го в редактора си и заместете всичко от вторият `<div>` до третият `</div>` с `{{ posts }}`. Запазете файла и опреснете страницата за да видите резултатите:

![Фигура 13.1](images/step1.png)

Както може да видите, всичко което имаме е това:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Това означава, че Django го разбира като лист от обекти. Помните ли от **Въведение в Python** как показваме листове? Да, с for цикли! При Django шаблоните ги правим така:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Пробвайте това във вашия шаблон.

![Фигура 13.2](images/step2.png)

Работи! Но ние искаме публикациите ни да се показват като статичните публикации, които създадохме по-рано в главата **Въведение в HTML**. Можете да смесвате HTML с шаблони. Нашето `body` ще изглежда така:

{% filename %}blog/templates/blog/post_list.html{% endfilename %} 

```html
<div>
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

{% for post in posts %}
    <div>
        <p>published: {{ post.published_date }}</p>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

{% raw %}Всичко, което сложите между `{% for %}` и `{% endfor %}` ще се повтаря за всеки обект в листа. Опреснете страницата си: {% endraw %}

![Фигура 13.3](images/step3.png)

Забелязахте ли, че този път използвахме малко по-различно означение (`{{ post.title }}` или `{{ post.text }}`)? Достъпваме данните във всяко едно поле дефинирано в нашия `Post` модел. Също така `|linebreaksbr` изпраща текста на публикациите през филтър и превръща в абзаци.

## Още едно нещо

Ще е хубаво да видим дали уеб страницата ви работи в Internet, нали? Нека го прехвърлим отново на PythonAnywhere. Ето преглед на стъпките:

* Първо, изпратете кода си към GitHub

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* След това влезте пак в [PythonAnywhere](https://www.pythonanywhere.com/consoles/) акаунта си и отидете на **Bash console** (или стартирайте нова) и напишете командите:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd <your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Не забравяйте да заместите `<your-pythonanywhere-domain>` с вашия актуален PythonAnywhere субдомейн, без скобите.)

* Накрая отидете на ["Web" страница](https://www.pythonanywhere.com/web_app_setup/) и натиснете **Reload** на вашата апликация. (За да достигнете други PythonAnywhere страници от конзолата, използвайте бутона от менюто в горния десен ъгъл.) Вашете обновление трябва да съществува на https://subdomain.pythonanywhere.com -- проверете в търсачката си! Ако публикациите на вашата PythonAnywhere страница не съвпадат с тези, които се появяват на локалния ви сървър, това е нормално. Базата от данни на локалния ви компютър не са синхронизирани с останалите ви файлове на PythonAnywhere.

Поздравления! Сега добавете нова публикация в администрацията на Django (помнете да добавите published_date!) Бъдете сигурни, че сте администрацията на Django на своята страница в pythonanywhere, https://subdomain.pythonanywhere.com/admin. След това презаредете страницата за да видите дали публикациите са налице.

Работи безупречно? Горди сме с теб! Сега отстъпи от компютъра си за малко – заслужи си почивка. :)

![Фигура 13.4](images/donut.png)