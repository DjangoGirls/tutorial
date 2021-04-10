# Django մոդելներ

Մեզ ինչ-որ բան է պետք ՝ մեր բոլոր բլոգային գրառումները պահելու համար, դա հենց այն է ինչ մենք հիմա կստեղծենք: Բայց նախ եկեք խոսենք `objects/օբյեկտներ` կոչվող իրերի մասին:

## Օbjects/Օբյեկտներ

Ծրագրավորման մեջ կա մի հասկացություն, որը կոչվում է օբյեկտիվ կողմնորոշում(կամ օբյեկտի վրա հիմնված ծրագրավորում:): Գաղափարն այն է, որ հրահանգների ձանձրալի հաջորդականության փոխարեն, մենք մոդելավորում ենք իրերը և նկարագրում, թե ինչպես են դրանք փոխազդում միմյանց հետ:

Այսպիսով, ինչ է օբյեկտը: Դա հատկությունների և գործողությունների հավաքածու է: Տարօրինակ է թվում, բայց մենք մի օրինակ կբերենք: 

Եթե ​​մենք ուզում ենք կատու մոդելավորել, ապա կստեղծենք `Cat/ կատու`t օբյեկտ, որն ունի որոշակի հատկություններ, օրինակ ՝ `color/գույն`, `age/տարիք` `mood/տրամադրություն ` ՝ (վատ, լավ, քնկոտ;)), `owner/սեփականատեր` (օրինակ ՝ մեկ այլ առարկա. Անձ կամ, եթե կատուն վայրի է, այս հատկությունը դատարկ կլինի): 

`Cat/Կատու` օբյեկտը կունենա որոշակի գործողությունների շարք. `purr/մլավել`, `scratch/ճանկռել`, կամ `feed/կերակրել` (որտեղ մենք կատուին տալիս ենք մի քանի `CatFood` (կատվի սնունդ), որը կարող է նաև լինել իր սեփական հատկություններով առանձին առարկա օրինակ `taste/համ` ):

    Cat
    --------
    color
    age
    mood
    owner
    purr()
    scratch()
    feed(cat_food)
    

    CatFood
    --------
    taste
    

Այսպիսով, հիմնականում գաղափարը՝ օբյեկտի նկարագրումն է կոդի մեջ՝ հատկություններով (կոչվում են `object properties/օբյեկտի հատկություններ`) և գործողություններով (կոչվում են `methods/մեթոդներ`):

Այսպիսով, ինչպե՞ս ենք մոդելավորելու բլոգի հաղորդագրությունները: Մենք ուզում ենք բլոգ կառուցել, այնպես չէ՞:

Մենք պետք է պատասխանենք այն հարցին. Ի՞նչ է բլոգի գրառումը: Ի՞նչ հատկություններ պետք է այն ունենա:

Դե, հաստատ մեր բլոգային գրառմանը պետք է ինչ-որ տեքստ իր բովանդակությամբ և վերնագիրով, այնպես չէ՞: Լավ կլինի իմանալ նաև, թե ով է այն գրել, այնպես որ հեղինակը մեզ պետք է: Վերջապես, մենք պետք է իմանանք, թե երբ է ստեղծվել գրառումը և երբ է հրապարակվել:

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

Ի՞նչ բաներ կարող եք անել բլոգում գրառման միջոցով: Լավ կլիներ որ գրառումը հրապարակող ինչ-որ մեթոդ լիներ, ճի՞շտ է: 

Այսպիսով, մեզ հարկավոր է `publish/հրապարակման` մեթոդ:

Դե, քանի որ մենք որոշել ենք, թե ինչ ենք ուզում ստանալ, եկեք սկսենք մոդելավորել այն Django- ում:

## Django մոդել

Իմանալով, թե ինչ է օբյեկտը, մենք կարող ենք ստեղծել Django մոդել մեր բլոգի գրառման համար:

Django- ում մոդելը հատուկ տեսակի առարկա է. Այն պահվում է ` տվյալների բազայում/database`.: Տվյալների բազան/database-ը տարբեր տվյալների հավաքածու է: Սա այն վայրն է, որտեղ դուք կպահեք տեղեկատվություն օգտվողների, ձեր բլոգի հաղորդագրությունների և այլնի մասին: Մենք կօգտագործենք SQLite տվյալների բազա ՝ մեր տվյալները պահելու համար: Սա ներքին կարգավորման/default Django տվյալների շտեմարանն է. Այս փուլում նրա հնարավորությունները բավարար են մեր պահանջների համար: 

Դուք կարող եք տվյալների շտեմարանում մոդելի մասին մտածել որպես աղյուսակ ՝ սյունակներով (դաշտերով/columns (fields) և տողերով (տվյալներով)/rows (data):

### Դիմումների ստեղծում

Ամեն ինչ կոկիկ պահելու համար մենք մեր ծրագրի ներսում կստեղծենք առանձին ծրագիր: Շատ հաճելի է ամեն ինչ կազմակերպել հենց սկզբից: Ծրագիր / Application ստեղծելու համար մենք պետք է հրամանի տողում մուտքագրենք հետևյալ հրահանգը ( `djangogirls` գրացուցակից, որտեղ գտնվում է `manage.py` ֆայլը). 

{% filename %}Mac OS X and Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

Դուք կնկատեք, որ ստեղծվել է նոր `blog` գրացուցակ, որն այժմ պարունակում է մի շարք ֆայլեր: Այսպիսով, մեր նախագծում գրացուցակները և ֆայլերը պետք է ունենան այսպիսի տեսք.

    djangogirls
    ├── blog
    │   ├── admin.py
    │   ├── apps.py
    │   ├── __init__.py
    │   ├── migrations
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── db.sqlite3
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    ├── myvenv
    │   └── ...
    └── requirements.txt
    
    

Դիմումը/application-ը ստեղծվելուց հետո մենք պետք է Django- ին ասենք, որ այն այժմ պետք է օգտագործի այն: Մենք դա անում ենք `mysite/settings.py` ֆայլում - բացեք այն ձեր կոդի խմբագրում/code editor: Մենք պետք է գտնենք `INSTALLED_APPS` և ավելացնենք `'blog.apps.BlogConfig',` պարունակող տող, հենց վերևում `]` : Այսպիսով, վերջնական արդյունքը պետք է ունենա այսպիսի տեսք.

{% filename %}mysite/settings.py{% endfilename %}

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog.apps.BlogConfig',
]
```

### Բլոգի գրառման մոդելի ստեղծում

`blog/models.py` այս ֆայլում մենք բնութագրում ենք `Models/մոդելներ` կոչվող բոլոր օբյեկտները. Սա մի տեղ է, որտեղ մենք կսահմանենք մեր բլոգի գրառումը/blog post-երը:

Բացեք `blog/models.py` այս ֆայլը կոդերի խմբագրում, ջնջեք ամբողջ տեքստը և փոխարենը տեղադրեք հետևյալ կոդը.

{% filename %}blog/models.py{% endfilename %}

```python
from django.conf import settings
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(default=timezone.now)
    published_date = models.DateTimeField(blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title
```

> Համոզվեք, որ `str` մեթոդի յուրաքանչյուր կողմում օգտագործեք երկու տակի գծիկ (`_`) : Այս կոնվենցիան հաճախ օգտագործվում է Python ծրագրավորման մեջ , և երբեմն կոչվում է "dunder" (կարճ ՝ «կրկնակի ընդգծում»/ "double-underscore"): 

Սարսափելի է թվում, ճի՞շտ է: Բայց մի անհանգստացեք. Մենք կբացատրենք, թե ինչ են նշանակում այս տողերը:

Բոլոր տողերը, որոնք `from` կամ `import` են սկսվում, թույլ են տալիս մուտք գործել կոդ այլ ֆայլերից: Այսպիսով, բոլոր ֆայլերի միջև միևնույն կոդը պատճենելու և տեղադրելու փոխարեն, մենք կարող ենք այն հղել ՝ օգտագործելով ... import ...</code>.

`class Post(models.Model):` – this line defines our model (it is an `object`).

- `class` is a special keyword that indicates that we are defining an object.
- `Post` is the name of our model. We can give it a different name (but we must avoid special characters and whitespace). Always start a class name with an uppercase letter.
- `models.Model` means that the Post is a Django Model, so Django knows that it should be saved in the database.

Now we define the properties we were talking about: `title`, `text`, `created_date`, `published_date` and `author`. To do that we need to define the type of each field (Is it text? A number? A date? A relation to another object, like a User?)

- `models.CharField` – this is how you define text with a limited number of characters.
- `models.TextField` – this is for long text without a limit. Sounds ideal for blog post content, right?
- `models.DateTimeField` – this is a date and time.
- `models.ForeignKey` – this is a link to another model.

We will not explain every bit of code here since it would take too much time. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/2.2/ref/models/fields/#field-types).

What about `def publish(self):`? This is exactly the `publish` method we were talking about before. `def` means that this is a function/method and `publish` is the name of the method. You can change the name of the method if you want. The naming rule is that we use lowercase and underscores instead of spaces. For example, a method that calculates average price could be called `calculate_average_price`.

Methods often `return` something. There is an example of that in the `__str__` method. In this scenario, when we call `__str__()` we will get a text (**string**) with a Post title.

Also notice that both `def publish(self):` and `def __str__(self):` are indented inside our class. Because Python is sensitive to whitespace, we need to indent our methods inside the class. Otherwise, the methods won't belong to the class, and you can get some unexpected behavior.

If something is still not clear about models, feel free to ask your coach! We know it is complicated, especially when you learn what objects and functions are at the same time. But hopefully it looks slightly less magic for you now!

### Create tables for models in your database

The last step here is to add our new model to our database. First we have to make Django know that we have some changes in our model. (We have just created it!) Go to your console window and type `python manage.py makemigrations blog`. It will look like this:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py:
    
      - Create model Post
    

**Note:** Remember to save the files you edit. Otherwise, your computer will execute the previous version which might give you unexpected error messages.

Django prepared a migration file for us that we now have to apply to our database. Type `python manage.py migrate blog` and the output should be as follows:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Applying blog.0001_initial... OK
    

Hurray! Our Post model is now in our database! It would be nice to see it, right? Jump to the next chapter to see what your Post looks like!