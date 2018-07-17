# Modelos do Django

Agora o que queremos criar é algo que armazene todos os posts em nosso blog. Mas para podermos fazer isto temos que falar um pouco sobre coisas chamadas `objects`.

## Objetos

Existe um conceito na programação chamado `programação orientada à objetos`. A ideia é que ao invés de escrever tudo como uma sequência entediante de instruções de programação, a gente pode modelar as coisas e definir como elas interagem umas com as outras.

Então o que é um objeto? É uma coleção de propriedades e ações. Isto pode parecer estranho, mas vamos lhe dar um exemplo.

Se quisermos modelar um gato, criaremos um objeto `Gato` que tem propriedades como `cor`, `idade`, `humor` (como bom, mal ou sonolento ;)), e `dono` (que seria atribuído a um objeto de `Pessoa` – ou talvez, se fosse um gato de rua, essa propriedade poderia ser vazia).

E então o `Gato` tem algumas ações: `ronronar`, `arranhar` ou `alimentar` (no qual vamos dar ao gato alguma `ComidaDeGato`, que poderia ser um objeto separado com propriedades, como `sabor`).

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
    

Então, basicamente, a ideia é descrever coisas reais no código com propriedades(chamadas de `propriedades do objeto`) e ações (chamadas de `métodos`).

Como nós iremos modelar as postagens do blog então? Queremos construir um blog, certo?

Nós precisamos responder as questões: O que é um post de blog? Que propriedades ele deve ter?

Bem, com certeza nosso blog precisa de alguma postagem com o seu conteúdo e um título, certo? Também seria legal saber quem escreveu – então precisamos de um autor. Finalmente, queremos saber quando a postagem foi criada e publicada.

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

Que tipo de coisa pode ser feita com uma postagem? Seria legal ter algum `método` que publique a postagem, não é mesmo?

Então, nós precisaremos de um método `publicar (publish)`.

Como nós já sabemos o que queremos alcançar, vamos começar a modelá-lo no Django!

## Modelo do Django

Sabendo o que um objeto é, nós criaremos um modelo no Django para a postagem do blog.

A model in Django is a special kind of object – it is saved in the `database`. Um banco de dados é uma coleção de dados. O banco de dados é um local em que você vai salvar dados sobre usuários, suas postagens, etc. Usaremos um banco de dados chamado SQLite para armazenar as nossas informações. This is the default Django database adapter – it'll be enough for us right now.

Você pode pensar em um modelo de banco de dados como uma planilha com colunas (campos) e linhas (dados).

### Criando uma aplicação

Para manter tudo arrumado vamos criar um aplicativo separado dentro do nosso projeto. É muito bom ter tudo organizado desde o início. Para criar um aplicativo precisamos executar o seguinte comando no console (a partir do diretório `djangogirls` onde está o arquivo `manage.py`):

{% filename %}Mac OS X and Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

You will notice that a new `blog` directory is created and it contains a number of files now. The directories and files in our project should look like this:

    djangogirls
    ├── blog
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── apps.py
    │   ├── migrations
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── db.sqlite3
    ├── manage.py
    └── mysite
        ├── __init__.py
        ├── settings.py
        ├── urls.py
        └── wsgi.py
    

After creating an application, we also need to tell Django that it should use it. We do that in the file `mysite/settings.py`. We need to find `INSTALLED_APPS` and add a line containing `'blog',` just above `]`. So the final product should look like this:

{% filename %}mysite/settings.py{% endfilename %}

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog',
]
```

### Criando o modelo Post do nosso blog

In the `blog/models.py` file we define all objects called `Models` – this is a place in which we will define our blog post.

Let's open `blog/models.py`, remove everything from it, and write code like this:

{% filename %}blog/models.py{% endfilename %}

```python
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(
            default=timezone.now)
    published_date = models.DateTimeField(
            blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title
```

> Verifique que você usou dois caracteres de sublinhado (`_`) a cada lado de `str`. Esta convenção é utilizada frequentemente em Python e, muitas vezes, chamamos de "dunder" (redução de "double-underscore").

It looks scary, right? But don't worry – we will explain what these lines mean!

All lines starting with `from` or `import` are lines that add some bits from other files. So instead of copying and pasting the same things in every file, we can include some parts with `from ... import ...`.

`class Post(models.Model):` – this line defines our model (it is an `object`).

- `class` é uma palavra-chave especial que indica que estamos definindo um objeto.
- `Post` is the name of our model. We can give it a different name (but we must avoid special characters and whitespace). Always start a class name with an uppercase letter.
- `models.Model` significa que o Post é um modelo de Django, então o Django sabe ele que deve ser salvo no banco de dados.

Now we define the properties we were talking about: `title`, `text`, `created_date`, `published_date` and `author`. To do that we need to define the type of each field (Is it text? A number? A date? A relation to another object, like a User?)

- `models.CharField` – this is how you define text with a limited number of characters.
- `models.TextField` – this is for long text without a limit. Sounds ideal for blog post content, right?
- `models.DateTimeField` – this is a date and time.
- `models.ForeignKey` – this is a link to another model.

We will not explain every bit of code here since it would take too much time. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/2.0/ref/models/fields/#field-types).

What about `def publish(self):`? This is exactly the `publish` method we were talking about before. `def` means that this is a function/method and `publish` is the name of the method. You can change the name of the method if you want. The naming rule is that we use lowercase and underscores instead of spaces. For example, a method that calculates average price could be called `calculate_average_price`.

Methods often `return` something. There is an example of that in the `__str__` method. In this scenario, when we call `__str__()` we will get a text (**string**) with a Post title.

Also notice that both `def publish(self):` and `def __str__(self):` are indented inside our class. Because Python is sensitive to whitespace, we need to indent our methods inside the class. Otherwise, the methods won't belong to the class, and you can get some unexpected behavior.

If something is still not clear about models, feel free to ask your coach! We know it is complicated, especially when you learn what objects and functions are at the same time. But hopefully it looks slightly less magic for you now!

### Criando tabelas para nossos modelos no banco de dados

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
      Rendering model states... DONE
      Applying blog.0001_initial... OK
    

Hurray! Our Post model is now in our database! It would be nice to see it, right? Jump to the next chapter to see what your Post looks like!