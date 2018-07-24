# Modelos do Django

Queremos criar algo que armazene todos os posts em nosso blog. Mas para fazer isto temos que falar um pouco sobre `objects`.

## Objetos

Existe um conceito em programação chamado `programação orientada à objetos`. A ideia é que ao invés de escrever tudo como uma sequência entediante de instruções de programação, a gente pode modelar as coisas e definir como elas interagem umas com as outras.

Então o que é um objeto? É uma coleção de propriedades e ações. Isto pode parecer estranho, mas vamos lhe dar um exemplo.

Se quisermos modelar um gato, podemos criar um objeto `Gato` que possui propriedades como `cor`, `idade`, `humor` (como bom, mal ou sonolento ;)), e `dono` (que seria atribuído a um objeto de `Pessoa` – ou talvez, no caso de um gato de rua, essa propriedade seria vazia).

`Gato` também realiza algumas ações: `ronronar`, `arranhar` ou `alimentar`-se (no qual podemos dar ao gato alguma `ComidaDeGato`, que poderia ser um objeto separado com propriedades, como `sabor`).

    Gato
    --------
    cor
    idade
    temperamento
    dono
    ronronar()
    arranhar()
    alimentar(comida_de_gato)
    

    ComidaDeGato
    ------------
    sabor
    

A ideia básica é descrever coisas reais em código a partir de suas propriedades (chamadas de `atributos`) e ações (chamadas de `métodos`).

Como iremos modelar as postagens do blog então? Queremos construir um blog, certo?

Para isto, precisamos responder as questões: O que é um post de blog? Que propriedades (atributos) ele deve ter?

Bem, com certeza uma postagem precisa de um texto com seu conteúdo e um título, certo? Também seria legal saber quem escreveu – então precisamos de um autor. Finalmente, queremos saber quando a postagem foi criada e publicada. Para ficar chique, vamos fazer em inglês.

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

Um modelo no Django é um tipo especial de objeto -- ele é salvo em um `banco de dados`. Um banco de dados é uma coleção de dados. O banco de dados é um local em que você vai salvar dados sobre usuários, suas postagens, etc. Usaremos um banco de dados chamado SQLite para armazenar as nossas informações. Este é o adaptador de banco de dados padrão Django -- ele vai ser o suficiente para nós neste momento.

Você pode pensar em um modelo de banco de dados como uma planilha com colunas (campos) e linhas (dados).

### Criando uma aplicação

Para manter tudo arrumado vamos criar um aplicativo separado dentro do nosso projeto. É muito bom ter tudo organizado desde o início. Para criar um aplicativo precisamos executar o seguinte comando no console (a partir do diretório `djangogirls` onde está o arquivo `manage.py`):

{% filename %}Mac OS X and Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

Você vai notar que um novo diretório `blog` foi criado e que ele contém um vários arquivos. Algo como a lista abaixo:

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
    

Depois de criar um app, também precisamos dizer ao Django que ele deve usá-lo. Fazemos isso no arquivo `mysite/settings.py`. Precisamos encontrar o `INSTALLED_APPS` e adicionar uma linha com `'blog',` logo acima do `]`. O resultado final ficará assim:

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

No arquivo `blog/models.py` definimos todos os objetos chamados `Modelos` -- este é um lugar em que vamos definir nossa postagem do blog.

Vamos abrir `blog/models.py`, remova tudo dele e escreva o código como este:

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

Parece assustador, certo? Mas não se preocupe, iremos explicar o que essas linhas significam!

Todas as linhas começando com `from` ou `import` são linhas que adicionam alguns pedaços de outros arquivos. Então ao invés de copiar e colar as mesmas coisas em cada arquivo, podemos incluir algumas partes com `from... import ...`.

`class Post(models.Model):` -- esta linha define o nosso modelo (é um `objeto`).

- `class` é uma palavra-chave especial que indica que estamos definindo um objeto.
- `Post` é o nome do nosso modelo. Nós podemos dar um nome diferente (mas precisamos evitar caracteres especiais e espaços em branco). Sempre inicie o nome de uma classe com uma letra em maiúsculo.
- `models.Model` significa que o Post é um modelo de Django, então o Django sabe ele que deve ser salvo no banco de dados.

Agora definimos as propriedades que comentamos acima: `title`, `text`, `created_date`, `published_date` e `author`. Para fazermos isso, nós precisamos definir um tipo para cada campo (É um texto? Um número? Uma data? Uma relação com outro objeto, por exemplo, um usuário?)

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