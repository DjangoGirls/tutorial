# QuerySets e ORM do Django

Neste capítulo você vai aprender como Django se conecta ao banco de dados e como ele armazena dados. Vamos nessa!

## O que é um QuerySet?

Um QuerySet (conjunto de pesquisa), no fundo, é uma lista de objetos de um dado modelo. Um QuerySet permite que você leia os dados do banco, filtre e ordene o mesmo.

É mais fácil aprender por exemplos. Vamos tentar?

## O Shell do Django

Abra seu console local (não no PythonAnywhere) e digite esse comando:

{% filename %}command-line{% endfilename %}
```
(myvenv) ~/djangogirls$ python manage.py shell
```

O efeito deve se parecer com isso:

{% filename %}command-line{% endfilename %}
```python
(InteractiveConsole)
>>>
```

Agora você está no console interativo do Django. Ele é como o prompt do Python, só que com umas mágicas Django adicionais :). Você pode usar todos os comandos do Python aqui também, é claro.

### Todos os objetos

Antes, vamos tentar mostrar todas as nossas postagens. Podemos fazer isso com o seguinte comando:

{% filename %}command-line{% endfilename %}
```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Oops! Um erro apareceu. Ele nos diz que não existe algo chamado Post. É verdade -- nós esquecemos de importá-lo primeiro!

{% filename %}command-line{% endfilename %}
```python
>>> from blog.models import Post
```

Isso é simples: importamos o modelo `Post` de dentro do `blog.models`. Vamos tentar mostrar todas as postagens novamente:

{% filename %}command-line{% endfilename %}
```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

É uma lista das postagens que criamos anteriormente! Criamos essas postagens usando a interface de administração do Django. No entanto, agora queremos criar novas postagens utilizando o python, então, como é que fazemos isso?

### Criando um objeto

É assim que você cria um objeto Post no banco de dados:

{% filename %}command-line{% endfilename %}
```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Mas aqui temos um ingrediente que está faltando: `me`. Precisamos passar uma instância do modelo `User` como autor. Como fazer isso?

Primeiro vamos importar o modelo User:

{% filename %}command-line{% endfilename %}
```python
>>> from django.contrib.auth.models import User
```

Quais usuários temos no nosso banco de dados? Experimente isso:

{% filename %}command-line{% endfilename %}
```python
>>> User.objects.all()
<QuerySet [<User: Ana>]>
```

É o superusuário que criamos anteriormente! Vamos obter uma instância de usuário agora:

{% filename %}command-line{% endfilename %}
```python
me = User.objects.get(username='Ana')
```

Como você pode ver, nós agora usamos um `get` para pegar um `User` com um `username` igual a 'Ana'. Claro, você tem que adaptar essa linha ao seu nome de usuário.

Agora finalmente podemos criar nossa primeira postagem:

{% filename %}command-line{% endfilename %}
```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Viva! Quer ver se funcionou?
{% filename %}command-line{% endfilename %}
```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

Ai está, mais uma postagem na lista!

### Adicione mais postagens

Agora você pode se divertir um pouco e adicionar mais postagens para ver como funciona. Adicione mais 2-3 e siga para a próxima parte.

### Filtrar objetos

Os QuerySets são muito usados pela habilidade de filtrar objectos. Digamos que queremos encontrar todos as postagens escritas pela usuária Ana. Nós usaremos o `filter` em vez de `all` em `Post.objects.all()`. Entre parênteses indicamos as condições que precisam ser atendidas por uma postagem de blog para que ela entre em nosso queryset. Em nosso caso, a condição é que  `author` deve ser igual a `me`. A maneira de escrever isso no Django é: `author=me`. Agora o nosso trecho de código parece como este:

{% filename %}command-line{% endfilename %}
```python
>>> Post.objects.filter(author=me)
[<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
```

Ou talvez nós queiramos ver todas as postagens que contenham a palavra 'title' no campo de `title`?

{% filename %}command-line{% endfilename %}
```python
>>> Post.objects.filter(title__contains='title')
[<Post: Sample title>, <Post: 4th title of post>]
```

> **Nota** Existem dois caracteres de sublinhado (`_`) entre o `title` e `contains`. Django ORM usa esta sintaxe para separar nomes de campo ("title") e operações ou filtros ("contains"). Se você usar apenas um sublinhado, você obterá um erro como "FieldError: Cannot resolve keyword title_contains".

Você também pode obter uma lista de todas as postagens publicadas. Fazemos isso filtrando todos os posts com `published_date` definido no passado:

{% filename %}command-line{% endfilename %}
```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
[]
```

Infelizmente, nenhuma de nossas postagens feitas a partir do console do Python estão publicadas ainda. Mas nós podemos mudar isso! Primeiro obtenha uma instância de uma postagem que queremos publicar:

{% filename %}command-line{% endfilename %}
```python
>>> post = Post.objects.get(title="Sample title")
```

E então vamos publicá-la com o nosso método `publish`!

{% filename %}command-line{% endfilename %}
```python
>>> post.publish()
```

Agora, tente obter a lista de postagens publicadas novamente (pressione o botão da seta para cima 3 vezes e tecle `enter`):

{% filename %}command-line{% endfilename %}
```python
>>> Post.objects.filter(published_date__lte=timezone.now())
[<Post: Sample title>]
```

### Ordenando objetos

Um QuerySet também nos permite ordenar a lista de objetos. Vamos tentar ordenar as postagens pelo campo `created_date`:

{% filename %}command-line{% endfilename %}
```python
>>> Post.objects.order_by('created_date')
[<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
```

Você também pode inverter a ordem adicionando um `-` no início:

{% filename %}command-line{% endfilename %}
```python
>>> Post.objects.order_by('-created_date')
[<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]
```

### Encadeando QuerySets

Você pode também combinar QuerySets pelo **encadeamento** deles em sequência:

```
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Isso é realmente poderoso e permite que você escreva pesquisas ("queries") bem complexas.

Legal! Você já está pronta para a próxima parte! Para fechar o terminal digite:

{% filename %}command-line{% endfilename %}
```python
>>> exit()
$
```
