# QuerySets e ORM do Django

Neste capítulo você vai aprender como o Django se conecta ao banco de dados e como ele armazena dados. Vamos nessa!

## O que é um QuerySet?

Um QuerySet (conjunto de busca) é, em essência, uma lista de objetos de um dado modelo. QuerySet permite que você leia os dados a partir de uma base de dados, filtre e ordene.

É mais fácil aprender usando exemplos. Vamos lá?

## O Shell do Django

Abra o seu terminal (não o PythonAnywhere) e digite o seguinte comando:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

O resultado deve ser:

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

Agora você está no console interativo do Django. Ele é como o prompt do Python, só que com umas mágicas adicionais ;). Você pode usar todos os comandos do Python aqui também, é claro.

### Todos os objetos

Primeiro, vamos tentar mostrar todas as nossas postagens. Podemos fazer isso com o seguinte comando:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Oops! Um erro apareceu. Ele nos diz que não existe algo chamado Post. É verdade -- nós esquecemos de importá-lo antes!

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

Mas isso é simples: basta importar o modelo `Post` de dentro do `blog.models`. Vamos tentar mostrar todas as postagens novamente:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

É uma lista dos posts que criamos mais cedo! Nós criamos estes posts utilizando a interface do Django admin. No entanto, agora queremos criar novos posts utilizando Python. Como fazemos isso?

### Criando um objeto

É assim que se cria um objeto Post no banco de dados:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Mas aqui temos um ingrediente faltando: `me`. Precisamos passar uma instância do modelo `User` como autor. Como fazemos isso?

Primeiro vamos importar o modelo User:

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

Quais usuários temos no nosso banco de dados? Experimente isso:

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

Este é o superusuário que criamos anteriormente! Vamos pegar uma instância do usuário agora (ajuste esta linha para usar seu próprio nome de usuário):

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

Como você pode ver, agora `obtém` um `Usuário` com um `nome de usuário` que é igual a 'ola'. Arrumado!

Agora finalmente podemos criar nosso post:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

Uhuu! Quer ver se funcionou?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

É isso aí, mais um post na lista!

### Adicionando mais postagens

Agora você pode se divertir um pouco e adicionar algumas postagens para ver como funciona. Adicione mais uns 2 ou 3 posts pelo Python e siga para a próxima parte.

### Filtrando objetos

Um recurso importante dos QuerySets é a possibilidade de filtrá-los. Digamos que queremos encontrar todos as postagens escritas pela usuária ola. Para isto, usamos `filter` ao invés de `all` em `Post.objects.all()`. Entre parênteses, indicamos quais condições precisam ser atendidas por um post para que ele entre no nosso queryset. No nosso caso, a condição é: `author` é igual a `me`. A maneira de escrever isso no Django é: `author=me`. Agora o nosso trecho de código ficará assim:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

E se quisermos ver todos os posts que contenham a palavra 'title' no campo `title`?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **Observação:** Existem dois caracteres de sublinhado (`_`) entre `title` e `contains`. O ORM do Django utiliza esta sintaxe para separar nomes de campo ("title") e operações ou filtros (como "contains"). Se você usar apenas um sublinhado, obterá um erro como "FieldError: Cannot resolve keyword title_contains".

Você também pode obter uma lista de todos os posts publicados. Fazemos isso filtrando todos os posts com uma `published_date` definida no passado:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

Infelizmente, o post que nós criamos pelo console do Python não está publicado ainda. Podemos mudar isso! Primeiro, busque a instância do post que queremos publicar:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

Então vamos publicá-lo com o nosso método `publish`:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Agora, busque novamente a lista de posts publicados (aperte a seta para cima algumas vezes e pressione `enter`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
```

### Ordenando objetos

Um QuerySet também nos permite ordenar a lista de objetos. Vamos tentar ordenar as postagens pelo campo `created_date`:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Também podemos inverter a ordem adicionando `-` no início:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### Consultas Complexas com Encadeamento de Métodos

Como você viu, alguns métodos em `Post.objects` retornam um QuerySet. Esses mesmos métodos podem, por sua vez, ser invocados num QuerySet, o que resultará num novo QuerySet. Dessa forma, você pode combinar seus efeitos **encadeando-los** juntos:

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

Isso é muito poderoso e nos permite criar consultas bastante complexas.

Legal! Você já está pronta para a próxima parte! Para fechar o terminal, digite:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```