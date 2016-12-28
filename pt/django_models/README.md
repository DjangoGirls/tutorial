# Modelos do Django

Agora o que nós queremos criar é algo que armazene todos os posts no nosso blog. Mas para fazer isso precisamos aprender um pouco mais sobre coisas chamadas `objetos`.

## Objetos

Existe um conceito na programação chamado `Programação Orientada à Objetos (POO)`. A ideia é que ao invés de escrever tudo como uma chata sequência de instruções de programação podemos modelar as coisas e definir como elas interagem umas com as outras.

Então o que é um objeto? É uma coleção de propriedades e ações. Isto pode parecer estranho, mas vamos lhe dar um exemplo.

Se queremos modelar um gato nós criaremos um objeto `Gato` que possui algumas propriedades, por exemplo `cor`, `idade`, `humor` (bom, mau, sonolento ;)), `dono` (que é um objeto da classe `Pessoa` ou, caso seja um gato de rua, essa propriedade é vazia).

E então o `Gato` tem algumas ações: `ronronar`, `arranhar` ou `comer` (no qual vamos dar ao gato alguma `ComidaDeGato `, que poderia ser um objeto separado com propriedades, como `sabor`).

    Gato
    --------
    cor
    idade
    humor
    dono
    ronronar()
    arranhar()
    comer(comida_de_gato)
    
    
    ComidaDeGato
    --------
    sabor
    

Então, basicamente, a ideia é descrever coisas reais no código com propriedades(chamadas de `propriedades do objeto`) e ações (chamadas de `métodos`).

Como nós iremos modelar as postagens do blog então? Queremos construir um blog, certo?

Precisamos responder à pergunta: o que é uma postagem de blog? Que propriedades deve ter?

Bem, com certeza nosso blog precisa de alguma postagem com o seu conteúdo e um título, certo? Também seria bom saber quem a escreveu - então precisamos de um autor. Finalmente, queremos saber quando a postagem foi criada e publicada.

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

Que tipo de coisa pode ser feita com uma postagem? Seria legal ter algum `método` que publique a postagem, não é mesmo?

Então precisamos de um método chamado `publicar`.

Como já sabemos o que queremos alcançar, podemos começar a modelagem em Django!

## Modelo do Django

Sabendo o que um objeto é, nós criaremos um modelo no Django para a postagem do blog.

Um modelo no Django é um tipo especial de objeto - ele é salvo em um `banco de dados`. Um banco de dados é uma coleção de dados. O banco de dados é um local em que você vai salvar dados sobre usuários, suas postagens, etc. Usaremos um banco de dados chamado SQLite para armazenar as nossas informações. Este é o adaptador de banco de dados padrão Django -- ele vai ser o suficiente para nós neste momento.

Você pode pensar em um modelo de banco de dados como uma planilha com colunas (campos) e linhas (dados).

### Criando uma aplicação

Para manter tudo arrumado vamos criar um aplicativo separado dentro do nosso projeto. É muito bom ter tudo organizado desde o início. Para criar um aplicativo precisamos executar o seguinte comando no console (a partir do diretório `djangogirls` onde está o arquivo `manage.py`):

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

Você vai notar que um novo diretório `blog` é criado e que ele agora contém um número de arquivos. Nossos diretórios e arquivos no nosso projeto devem se parecer com este:

    djangogirls
    ├── mysite
    |       __init__.py
    |       settings.py
    |       urls.py
    |       wsgi.py
    ├── manage.py
    └── blog
        ├── migrations
        |       __init__.py
        ├── __init__.py
        ├── admin.py
        ├── models.py
        ├── tests.py
        └── views.py
    

Depois de criar um aplicativo também precisamos dizer ao Django que deve usá-lo. Fazemos isso no arquivo `mysite/settings.py`. Precisamos encontrar o `INSTALLED_APPS` e adicionar uma linha com `'blog',` logo acima do `)`. É assim que o produto final deve ficar assim:

```python
INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog',
)
```

### Criando o modelo Post do nosso blog

No arquivo `blog/models.py` definimos todos os objetos chamados `Modelos` - este é um lugar em que vamos definir nossa postagem do blog.

Vamos abrir `blog/models.py`, remova tudo dele e escreva o código como este:

```python
from django.db import models
from django.utils import timezone

class Post(models.Model):
    author = models.ForeignKey('auth.User')
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

> Certifique-se de ter usado dois caracteres (`_`) em cada lado do `str`. Aqueles caracteres são usados freqüentemente em Python e às vezes os chamamos de "dunder" (abreviação de "double-underscore" ou "duplo sublinhado").

É assustador, não? Mas não se preocupe, vamos explicar o que estas linhas significam!

Todas as linhas começando com `from` ou `import` são linhas que adicionam alguns pedaços de outros arquivos. Então ao invés de copiar e colar as mesmas coisas em cada arquivo, podemos incluir algumas partes com `from... import ...`.

`class Post(models.Model):` - esta linha define o nosso modelo (é um `objeto`).

*   `class` é uma palavra-chave especial que indica que estamos definindo um objeto.
*   `Post` é o nome do nosso modelo, podemos lhe dar um nome diferente (mas é preciso evitar os espaços em branco e caracteres especiais). Sempre comece um nome de classe com uma letra maiúscula.
*   `models.Model` significa que o Post é um modelo de Django, então o Django sabe ele que deve ser salvo no banco de dados.

Agora podemos definir as propriedades que discutimos: `titulo`, `texto`, `data_criacao`, `data_publicacao` e `autor`. Para isso precisamos definir um tipo de campo (é um texto? É um número? Uma data? Uma relação com outro objeto, por exemplo, um usuário?).

*   `models.CharField` - assim é como você define um texto com um número limitado de caracteres.
*   `models.TextField` - este é para textos longos sem um limite. Será ideal para um conteúdo de post de blog, certo?
*   `models.DateTimeField` - este é uma data e hora.
*   `models.ForeignKey` - este é um link para outro modelo.

Nós não vamos explicar cada pedaço de código aqui, pois isso levaria muito tempo. Você deve olhar a documentação do DJango se você quiser saber mais sobre campos do Model e como definir coisas além destas descritas acima (https://docs.djangoproject.com/en/1.8/ref/models/fields/#field-types).

Que tal `def publish(self):`? É exatamente o nosso método de `publish` que falávamos antes. `def`, significa que se trata de um função/método. `publish` é o nome do método. Você pode alterar, se quiser. A regra é que usamos letras minúsculas e sublinhados em vez de espaços em branco (ou seja, se você quer ter um método que calcula o preço médio, você poderia chamá-lo `calculate_average_price`).

Métodos muitas vezes `return` algo. Há um exemplo de que, no método `__str__`. Nesse cenário, quando chamamos `__str__()` teremos um texto (**string**), com um título do Post.

Se algo ainda não está claro sobre modelos, sinta-se livre para pedir o seu treinador! Sabemos que é muito complicado, especialmente quando você aprender o que são objetos e funções ao mesmo tempo. Mas espero que ele se parece um pouco menos mágica para você agora!

### Criando tabelas para nossos modelos no banco de dados

O último passo é adicionar nosso novo modelo para nosso banco de dados. Primeiro temos que fazer o Django saber que nós temos algumas mudanças em nosso modelo (só criamos isso), digite `python manage.py makemigrations blog`. Será algo parecido com isto:

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      0001_initial.py:
      - Create model Post
    

Django prepara um arquivo de migração que temos de aplicar agora para nosso banco de dados, tipo `python manage.py migrate blog`, a saída deve ser:

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Applying blog.0001_initial... OK
    

Viva! Nosso modelo de Post está agora em nosso banco de dados, seria um prazer vê-lo, certo? Saltar para o próximo capítulo para ver o aspecto do seu Post!
