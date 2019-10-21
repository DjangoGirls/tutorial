# Mga model ng Django

Ang gusto nating ilikha ngayon ay isang bagay na mag-imbak ng lahat ng ating mga post sa loob nag ating blog. Pero para magawa natin ito dapat nating pag-usapan ang tungkol sa mga bagay na tinatawag na `objects`.

## Mga Object

May isang konsepto sa pag-proprogram na tinatawag na `object-oriented na programming`. Ang ideya ay imbes na isulat ang lahat isip isang napakataas na datig ng mga programming na instruksyon, maari nating i-model ang mga bagay-bagay at bigyang kahulugan kung paano sila makipaghalubilo sa bawat isa.

Kaya ano ang ibig sabihin ng object? Ito ay isang koleksyon ng mga katangian at mga askyon. Medyo kakaiba, pero bibigyan namin kayo ng halimbawa.

Kung gusto mo na i-model ang isang pusa, gagawa tayo ng isang object na `Cat` na may mga katangian tulad ng `kulay`, `edad`, `kalagayan` (gaya ng maganda, pangit, o inaantok ;)), at ang `may-ari`(na maari ding gawing `Person` na object - o pede din na walang laman sa kaso ng mga gala na pusa).

Pagkatapos ang `Cat` ay may mga aksyon: `purr`, `scratch`, o `feed` (kung saan, bibigyan natin ang pusa ng `CatFood` na maari ding gawing hiwalay na object na may katangian na gaya ng `taste`).

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
    

Kaya, ang idea ay ang paglalarawan ng mga tunay na bagay sa ating code na may mga katangian (tinawag na `object properties`) at mga aksyon (tinatawag na mga `method`).

Paano kaya natin i-model ang ating blog post? Gusto nating gumawa ng blog, di ba?

Kailangan nating sagutin ang tano na: Ano ang blog post? Ano ang mga katangian na dapat meron ito?

Sigurado tayo na ang ating blog post ay nangangailangan ng mga tekso sa nilalaman at sa pamagat nito, di ba? Mainam din na malaman natin kung sino ang nagsulat nito - kaya kailangan natin ng may-akda. Sa huli. gusto din nating malaman kung kailan nalikha at nailathala ang post.

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

Ano ang mga klaseng bagay ang maaring magawa sa blog post? Maganda kung makakaroon ng isang `method` na maglalathala ng mga post, di ba?

Kaya, mangangailangan tayo ng `paglathala` na method.

Dahil alam na natin kung ano ang gusto nating matamo, simulan na natin itong i-model sa Django!

## Model ng Django

Alam na natin kung ano ang object, maari na tayong maglikha ng model ng Django para sa ating blog post.

Ang model sa Django ay isang espesyal na uri ng object - nakasave ito sa loob ng `database`. Ang database ay isang koleksyon ng mga datos. Ito ay lugar kung saan mo itatago ang mga impormasyon tungkol sa mga gumagamit, iyong mga blog post, at iba pa. Gagamit tayo ng SQLite na database para itago ang ating mga datos. Ito ay isang default na Django database adapter - ok na sa ating ito sa ngayon.

Maaring mong isipin ang model sa isang database isip isang spreadsheet na may mga tudling (fields) at mga hanay (datos).

### Paglikha ng aplikasyon

Para maging malinis ang lahat, maglikha tayo ng hiwalay na aplikasyon sa loob ng ating proyekto. Maganda na maayos ang lahat sa simula pa lang. Para maglikha ng aplikasyon, kailangan nating patakbuhin ang sumusunod na command sa ating console (mula sa `djangogirls` na directory kung saan nandoon ang ating `manage.py` na file):

{% filename %}Mac OS X and Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

You will notice that a new `blog` directory is created and it contains a number of files now. The directories and files in our project should look like this:

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
    
    

After creating an application, we also need to tell Django that it should use it. We do that in the file `mysite/settings.py` -- open it in your code editor. We need to find `INSTALLED_APPS` and add a line containing `'blog.apps.BlogConfig',` just above `]`. So the final product should look like this:

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

### Paglikha ng model ng blog post

In the `blog/models.py` file we define all objects called `Models` – this is a place in which we will define our blog post.

Let's open `blog/models.py` in the code editor, remove everything from it, and write code like this:

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

> Pakisuriin ulit at tingnan kong gumagamit ka ng dalawang salungguhit (`_`) sa bawat panig ng `str`. Ang kombensiyon na ito ay kadalasang ginagamit sa Python at minsan din naming tinatawag na "dunder" (pinaikling anyo ng "double-underscore").

It looks scary, right? But don't worry – we will explain what these lines mean!

All lines starting with `from` or `import` are lines that add some bits from other files. So instead of copying and pasting the same things in every file, we can include some parts with `from ... import ...`.

`class Post(models.Model):` – this line defines our model (it is an `object`).

- `class` ay isang espesyal na keyword na nagpapakita na tayo ay nagbibigay kahulugan sa isang object.
- Ang `Post` ay ang pangalan ng ating model. Maari natin itong bigyan ng ibang pangalan (pero dapat nating iwasan ang mga espesyal na titik at ang mga whitespace). Parating simulan ang pangalan ng class sa malaking titik.
- Ang ibig sabihin ng `models.Model` ay ang Post ay isang Model ng Django, kaya alam ni Django na ito ay dapat nakasave sa database.

Now we define the properties we were talking about: `title`, `text`, `created_date`, `published_date` and `author`. To do that we need to define the type of each field (Is it text? A number? A date? A relation to another object, like a User?)

- Ang `models.CharField` - ito ang paraan para ating ilarawan ang tekso na may nakatakdang bilang ng mga letra.
- Ang `models.TextField` - ay para sa mga mahabang teksto na walang nakatakdang haba. Ito ay tamang-tama para gawing nilalaman ng blog post, di ba?
- Ang `models.DateTimeField` - ito ay ang petsa at ang oras.
- Ang `models.ForeignKey` - ay pag-uugnay sa isa pang model.

We will not explain every bit of code here since it would take too much time. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/2.2/ref/models/fields/#field-types).

What about `def publish(self):`? This is exactly the `publish` method we were talking about before. `def` means that this is a function/method and `publish` is the name of the method. You can change the name of the method if you want. The naming rule is that we use lowercase and underscores instead of spaces. For example, a method that calculates average price could be called `calculate_average_price`.

Methods often `return` something. There is an example of that in the `__str__` method. In this scenario, when we call `__str__()` we will get a text (**string**) with a Post title.

Also notice that both `def publish(self):` and `def __str__(self):` are indented inside our class. Because Python is sensitive to whitespace, we need to indent our methods inside the class. Otherwise, the methods won't belong to the class, and you can get some unexpected behavior.

If something is still not clear about models, feel free to ask your coach! We know it is complicated, especially when you learn what objects and functions are at the same time. But hopefully it looks slightly less magic for you now!

### Maglikha ng mga table para sa model sa loob ng database

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