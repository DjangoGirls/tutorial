# Modelos do Django

Queremos criar algo que armazene todos os posts em nosso blog. Mas para fazer isto, temos que falar um pouco sobre `objects`.

## Objetos

Existe um conceito em programação chamado `programação orientada a objetos`. A ideia é que ao invés de escrever tudo como uma sequência entediante de instruções de programação, possamos modelar as coisas e definir como elas interagem umas com as outras.

Então o que é um objeto? É uma coleção de propriedades e ações. Isto pode parecer estranho, mas vamos mostrar um exemplo.

Se quisermos modelar um gato, podemos criar um objeto `Gato` que possui propriedades como `cor`, `idade`, `humor` (como bom, mal ou sonolento ;)), e `dono` (que seria atribuído a um objeto de `Pessoa` – ou talvez, no caso de um gato de rua, essa propriedade seja vazia).

`Gato` também realiza algumas ações: `ronronar`, `arranhar` ou `alimentar`-se (em que podemos dar ao gato alguma `ComidaDeGato`, que poderia ser um objeto separado com propriedades como `sabor`).

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

Como vamos modelar as postagens do blog, então? Queremos construir um blog, certo?

Para isto, precisamos responder as questões: O que é um post de blog? Que propriedades (atributos) ele deve ter?

Bem, com certeza uma postagem precisa de um texto com seu conteúdo e um título, certo? Também seria legal saber quem a escreveu – então precisamos de um autor. Finalmente, queremos saber quando a postagem foi criada e publicada. Para ficar chique, vamos fazer em inglês.

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

Que tipo de ações podem ser feitas com uma postagem? Seria legal ter um `método` que publique a postagem, não é mesmo?

Então, nós precisaremos de um método para publicar (`publish`).

Como já sabemos o que queremos alcançar, podemos começar a modelar em Django!

## Modelos do Django

Sabendo o que um objeto é, criamos um modelo no Django para a postagem do blog.

Um modelo no Django é um tipo especial de objeto -- ele é salvo em um `banco de dados`. Um banco de dados é uma coleção de dados. Ele é um local em que você vai salvar dados sobre usuários, suas postagens, etc. Usaremos um banco de dados chamado SQLite para armazenar as nossas informações. Este é o banco de dados padrão do Django -- e ele será suficiente neste primeiro momento.

Você pode pensar em um modelo de banco de dados como uma planilha com colunas (campos) e linhas (dados).

### Criando uma aplicação

Para manter tudo arrumado, vamos criar uma aplicação separada dentro do nosso projeto. É muito bom ter tudo organizado desde o início. Para criar uma aplicação, precisamos executar o seguinte comando no prompt (a partir do diretório `djangogirls` onde está o arquivo `manage.py`):

{% filename %}Mac OS X and Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

Você vai notar que um novo diretório `blog` foi criado e que ele contém vários arquivos. Algo como a lista abaixo:

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
    
    

Depois de criar uma aplicação, também precisamos dizer ao Django que ele deve usá-la. Fazemos isso no arquivo `mysite/settings.py` -- abra-o no seu editor de código. We need to find `INSTALLED_APPS` and add a line containing `'blog.apps.BlogConfig',` just above `]`. O resultado final ficará assim:

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

### Criando um modelo de postagem para o nosso blog

No arquivo `blog/models.py` definimos todos os objetos chamados `Modelos` -- este é um lugar em que vamos definir nossa postagem do blog.

Vamos abrir `blog/models.py` no editor de código, apagar tudo dele e escrever o seguinte código:

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

> Certifique-se de que usou dois caracteres de sublinhado (`_`) em cada lado de `str`. Esta convenção é utilizada frequentemente em Python e, muitas vezes, a chamamos de "dunder" (vem da expressão em inglês "double-underscore" - sublinhado duplo em português).

Parece assustador, né? Mas não se preocupe, vamos explicar o que essas linhas significam!

Todas as linhas começando com `from` ou `import` são linhas que adicionam pedaços de outros arquivos. Então ao invés de copiar e colar as mesmas coisas em cada arquivo, podemos incluir algumas partes com `from... import ...`.

`class Post(models.Model):` - esta linha define o nosso modelo (é um `objeto`).

- `class` é uma palavra-chave especial que indica que estamos definindo um objeto.
- `Post` é o nome do nosso modelo. Nós podemos dar um nome diferente (mas precisamos evitar caracteres especiais e espaços em branco). Sempre inicie o nome de uma classe com uma letra em maiúsculo.
- `models.Model` significa que o Post é um modelo de Django, então o Django sabe que ele deve ser salvo no banco de dados.

Agora definiremos as propriedades comentadas acima: `title`, `text`, `created_date`, `published_date` e `author`. Para fazer isso, é necessário definir um tipo para cada campo (É um texto? Um número? Uma data? Uma relação com outro objeto, por exemplo, um usuário?)

- `models.CharField` - é assim que definimos um texto com um número limitado de caracteres.
- `models.TextField` - este campo é para textos sem um limite fixo. Parece ideal para o conteúdo de um blog, né?
- `models.DateTimeField` - este é uma data e hora.
- `models.ForeignKey` - este é um link para outro modelo.

Nós não explicaremos cada pedaço de código aqui pois isso levaria muito tempo. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/2.2/ref/models/fields/#field-types).

E `def publish(self):`? Esse é justamente o método `publish` de que falamos anteriormente. `def` significa que se trata de uma função/método e que `publish` é seu nome. Você pode mudar o nome do método, se quiser. A regra para nomes é sempre usar letras minúsculas e no lugar dos espaços em branco, usar o caractere sublinhado (_). Por exemplo, um método que calcula o preço médio poderia se chamar `calculate_average_price` (do inglês, calcular_preco_medio).

Métodos muitas vezes retornam (`return`) algo. Um exemplo disto é o método `__str__`. Neste caso, quando chamarmos `__str__()`, obteremos um texto (**string**) com o título do Post.

Lembre-se também de que tanto `def publish(self):` quanto `def __str__(self):` são endentados para dentro da classe. E porque Python é sensível a espaços em branco, precisamos endentar todos os nossos métodos para dentro da classe. Caso contrário, os métodos não pertencerão à classe e você poderá obter um comportamento inesperado.

Se algo ainda não está claro sobre modelos, sinta-se livre para perguntar para sua monitora! Sabemos que é complicado, especialmente porque você está aprendendo o que são objetos e funções ao mesmo tempo. Mas esperamos que isto se pareça um pouco menos com mágica agora!

### Criando tabelas para nossos modelos no banco de dados

O último passo é adicionar nosso novo modelo ao banco de dados. Primeiramente, precisamos fazer com que o Django entenda que fizemos algumas alterações nos nossos modelos. (Acabamos de criar um modelo de Post!) Vá para o console e digite `python manage.py makemigrations blog`. Deve ficar assim:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py:
    
      - Create model Post
    

**Observação:** Lembre-se de salvar os arquivos que você editar. Caso contrário, o computador executará uma versão antiga que pode gerar mensagens de erro inesperadas.

O Django preparou um arquivo de migração que precisamos aplicar ao nosso banco de dados. Digite `python manage.py migrate blog` e a saída deve ser:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Applying blog.0001_initial... OK
    

Uhuu! Nosso modelo Post já está no banco de dados! Seria legal vê-lo, né? Vá para o próximo capítulo para descobrir como nosso Post se parece!