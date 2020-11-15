{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

# Продължете апликацията си

Вече завършихме всички различни стъпки необходими за създаването на нашия уеб сайт: знаем как да напишем модел, URL, изглед и шаблон. Знаем също и как да направим сайта ни хубав.

Време е за практика!

Първото нешо, което ни е необходимо за блога е очевидно страница, която да показва една публикация, нали така?

Вече разполагаме с `Post` модел, така че няма нужда да правим промени в `models.py`.

## Създайте връзка към шаблона със съдържанието на поста.

Ще започнем като добавим връзка във файла `blog/templates/blog/post_list.html`. Отворете го в редактора си, като до момента трябва да изглежда по този начин: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h2><a href="">{{ post.title }}</a></h2>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

{% raw %} Искаме да имаме връзка от заглавието на поста в листа с публикациите до страницата със съдържанието на поста. Нека променим `<h2><a href="">{{ post.title }}</a></h2>`, така че да се свързва със съдържанието на страницата:{% endraw %}

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}

```html
<h2><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h2>
```

{% raw %} Време е да обясним мистериозния код `{% url 'post_detail' pk=post.pk %}`. Може би забелязахте, че означението `{% %}` означава, че използваме Django шаблонни етикети. Този път ще изполваме такъв, който създава URL за нас! {% endraw %}

`post_detail` частта означава, че Django трябва да очаква URL в `blog/urls.py` с име name=post_detail

А какво за `pk=post.pk`? `pk` идва накратко от primary key, което е уникален идентификатор за всеки един запис в базата данни. Всеки Django модел има поле, което служи за негов първоначален код (primary key), и каквото и друго име да има, то може също да се съотнесе като "pk". Тъй като не уточнихме първоначалната стойност в нашия `Post` модел, Django създава един за нас (по подразбиране, полето "id" , съдържащо номер, който се увеличава при всеки запис, т.е. 1, 2, 3) и го добавя към полето на всеки от нашите постове. Можем да достигнем primary key като напишем `post.pk`, по същия начин достъпваме други полета (`title`, `author`, и т.н.) в нашия `Post` обект!

Сега като отидем на http://127.0.0.1:8000/ ще видим грешка ( както се очаквкаше, тъй като все още нямаме URL или *view* за `post_detail`). Ще изглежда така:

![NoReverseMatch грешка](images/no_reverse_match2.png)

## Създаване на URL към съдържанието на поста

Нека създадем URL в `urls.py` за нашия `post_detail` *view*!

Искаме първия ни пост да бъде показван на този **URL**: http://127.0.0.1:8000/post/1/ 

Сега да направим URL във файла `blog/urls.py`, който да насочва Django към *view* наречен `post_detail`, който ще показва целия блог пост. Отворете файла `blog/urls.py` в редактора си и добавете следния ред `path('post/<int:pk>/', views.post_detail, name='post_detail'),`, така че файлът да изглежда по този начин:

{% filename %}{{ warning_icon }} blog/urls.py{% endfilename %} 

```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
]
```

Тази част `post/<int:pk>/` уточнява URL образеца -- ще ви го обясним:

- `post/` означава, че URL трябва да започва с думата **post** последвана от **/**. Дотук добре.
- `<int:pk>` -- тази част е по-сложна. Означава, че Django очаква стойност цяло число и ще го преведе към изгледа (view) като променлива наречена `pk`.
- `/` – след това ни е необходима **/** преди да завършим URL.

Това означава, че когато напишем в търсачката си `http://127.0.0.1:8000/post/5/`, Django ще разбере, че търсите за *view* наречен `post_detail` и изпраща информацията, че този `pk` съответства на `5` спрямо този *view* (изглед).

И така, добавихме нов URL образец към `blog/urls.py`! Нека презаредим страницата: http://127.0.0.1:8000/ Бум! Сървърът отново спря да работи. Погледнете в конзолата -- както се очакваше, има нова грешка!

![AttributeError](images/attribute_error2.png)

Помните ли каква е следващата стъпка? Добавяне на нов изглед (view)!

## Добавяне на изглед за съдържанието на поста

Този път на нашето *view* даваме допълнителен параметър, `pk`. Нашето *view* трябва да го прихване, нали? Така, ще дефинираме нашата функция като `def post_detail(request, pk):`. Забележете, че този параметър трябва да има точно същото име като на `urls` (`pk`), който уточнихме по-рано. Също така забележете, че пропускането на тази променлива е неправилно и в резултат ще доведе до грешка!

Сега, искаме да вземем само и единствено една публикация. За да направим това, можем да използваме querysets ето така:

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

Но този код има проблем. Ако нямаме `Post` с даден `primary key` (`pk`) ще имаме много грозна грешка!

![DoesNotExist грешка](images/does_not_exist2.png)

Ние не искаме това! За щастие Django идва с нещо, с което да се справи вместо нас: `get_object_or_404`. В случай, че няма `Post` със зададен `pk`, ще се покаже на екрана много по-добре, `Page Not Found 404` страница. 

![Page not found](images/404_2.png)

Хубавото е, че всъщност и вие можете да си създадете такава страница `Page not found` и да я направите колкото си искате хубава. Но не е чак толкова важно в момента, затова ще го пропуснем.

ОК, време е да добавим *view* към нашия файл `views.py`!

В 0>blog/urls.py</code> създадохме URL правило наречено `post_detail`, което се отнася до изглед с име `views.post_detail`. Това означава, че Django ще очаква изглед функция наречена `post_detail` вътре в `blog/views.py`.

Трябва да отворим `blog/views.py` в редактора и да добавим следния код близо до другите редове `from` :

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404

```

И накрая на файла ще добавим нашия изглед (*view*):

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Да. Време е да презаредим страницата: http://127.0.0.1:8000/

![Post list view (Изглед с лист от постове)](images/post_list2.png)

Работи! Но сега какво става, когато кликнете върху връзката със заглавието на поста?

![TemplateDoesNotExist грешка](images/template_does_not_exist2.png)

Оо, не! Друга грешка! Но вече знаем как да се справим с това, нали? Трябва да добавим нов шаблон!

## Създайте шаблон за съдържанието на поста

Ще създадем файл в `blog/templates/blog` наречен `post_detail.html`, и ще го отворим в редактора.

Впишете следния код:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <div class="post">
        {% if post.published_date %}
            <div class="date">
                {{ post.published_date }}
            </div>
        {% endif %}
        <h2>{{ post.title }}</h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Още веднъж удължаваме `base.html`. В блока `content` искаме да покажем датата на публикуване на поста (ако същестрвува), заглавието и текста. Но трябва да обсъдим други важни работи, нали?

{% raw %}`{% if ... %} ... {% endif %}` е шаблонен етикет, който използваме, когато искаме да проверим нещо. (Помните ли `if ... else ...` от главата ** Въведение в Python**?) В този случай искаме да проверим дали `published_date` (датата на публикване) на поста не е празна.{% endraw %}

ОК, можем да отворим страницата ни наново и ще видим, че `TemplateDoesNotExist` сега го няма.

![Post detail page (Страница със съдържанието на поста)](images/post_detail2.png)

Ихаа! Работи!

# Време за прехвърляне на файловете!

Би било добре да видите дали сайта ви работи на PythonAnywhere нали? Нека опитаме да прехвърлим всичко отново.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Тогава, в [PythonAnywhere Bash конзолата](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Не забравяйте да замените `<your-pythonanywhere-domain>` с вашият актуален PythonAnywhere субдомейн, без скобите.)

## Обновяване на статичните файлове на сървърът:

Сървъри като PythonAnywhere обичат да се отнасят към "статичните файлове" (като CSS файлове) различно от Python файловете, защото те могат да оптимизират зареждането им по-бързо. В резултат, когато правим промени на нашите CSS файлове трябва да напишем допълнителни команди на сървъра за да му кажем да ги обнови. Командата се казва `collectstatic`.

Започнете като активирате виртуалната си среда, ако не е активна от преди това (PythonAnywhere използва команда наречена `workon` да направи това, същото е както когато използваме команда `source myenv/bin/activate` на своя компютър.

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ workon <your-pythonanywhere-domain>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

Командата `manage.py collectstatic` е нещо като `manage.py migrate`. Правим промени на кода си, след това казваме на Django да приложи тези промени или към събраните статизни файлове на сървъра или към базата данни.

Във всеки случай сега сме готови да отидем на ["Web" страницата](https://www.pythonanywhere.com/web_app_setup/) (от бутона на менюто в горния десен ъгъл) и натиснем **Reload**, след това погледнете страницата https://subdomain.pythonanywhere.com за да видите резултата.

Та това е! Поздравления :)