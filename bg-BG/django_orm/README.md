# Django ORM и QuerySets

В тази глава ще научите как Django се свързва с базата данни и съхранява данни в нея. Нека се потопим!

## Какво е QuerySet?

QuerySet е по същество списък на обекти на даден Модел. QuerySets ви позволяват да четете данните от базата данни, да ги филтрирате и да ги подредите..

Най-лесно е да се учи чрез пример. Нека опитаме това, нали?

## Django shell

Отворете вашата локална конзола (не на PythonAnywhere) и въведете тази команда:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

Ефектът трябва да бъде такъв:

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

Вече сте в интерактивната конзола на Django. Това е точно като подкана Python, но с допълнителна магия на Django. :) Тук можете да използвате всички Python команди.

### Всички обекти

Нека се опитаме първо да покажем всички наши публикации. Можете да направите това със следната команда:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Ами сега! Появи се грешка. Това ни казва, че няма Post. Правилно е - забравихме да го внесем първо!

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

Импортираме модела `Post` от `blog.models`. Нека опитаме отново да покажем всички публикации:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

Това е списък на публикациите, които създадохме по-рано! Създадохме тези публикации чрез администраторския интерфейс на Django. Но сега искаме да създаваме нови публикации с помощта на Python, така че как да направим това?

### Създаване на обект

Ето как създавате нов обект Post в базата данни:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Но тук имаме една липсваща съставка: `me`. Трябва да предадем инстанция на модел `User` като автор. Как да направим това?

Нека първо да импортираме модел User:

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

Какви потребители имаме в нашата база данни? Опитайте това:

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

Това е суперпотребителят, който създадохме по-рано! Нека сега вземем потребителя (коригирайте този ред, за да използвате вашето потребителско име):

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

Както можете да видите, сега `get` a `User` с `username`, което се равнява на „ola“. Яко!

Сега най-накрая можем да създадем нашия пост:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

Ура! Искате ли да проверите дали работи?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

Ето го още една публикация в списъка!

### Добавете още публикации

Вече можете да се забавлявате малко и да добавяте още публикации, за да видите как работи. Добавете още две или три и след това преминете към следващата част.

### Филтрирайте обекти

Голяма част от QuerySets е възможността да ги филтрирате. Да речем, че искаме да намерим всички публикации, на които потребителят ola е автор. Ще използваме `filter` вместо `all` в `Post.objects.all()`. В скобите посочваме на кое условие(я) трябва да отговаря блог публикацията, за да се озове в нашия набор от заявки. В нашия случай условието е `author/0> да бъде равен на <code>me`. Начинът да го напишем в Django е `author=me`. Сега нашата част от кода изглежда така:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Или може би искаме да видим всички публикации, които съдържат думата 'title' в полето `title`?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **Забележка** Има два знака за подчертаване (`_`) между `title` и `contains`. ORM на Django използва това правило за разделяне на имена на полета ("title") и операции или филтри ("contains"). Ако използвате само една долна черта, ще получите грешка като "FieldError: Не може да разреши ключовата дума title_contains".

Можете също така да получите списък с всички публикувани публикации. Правим това, като филтрираме всички публикации, които имат `published_date` са зададени в миналото:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

За съжаление, публикацията, която добавихме от конзолата Python, все още не е публикувана. Но можем да променим това! Първо получете екземпляр от публикация, която искаме да публикуваме:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

И след това го публикувате с нашия метод `publish`:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Сега опитайте отново да получите списък с публикувани публикации (натиснете клавиша със стрелка нагоре три пъти и натиснете `enter`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
```

### Подреждане на обекти

QuerySets също ви позволяват да поръчате списъка с обекти. Нека се опитаме да ги поръчаме от полето `created_date`:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Можем също да обърнем подреждането, като добавим `-` в началото:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### Сложни заявки чрез свързване на методи

Както видяхте, някои методи на `Post.objects` връщат QuerySet. The same methods can in turn also be called on a QuerySet, and will then return a new QuerySet. Thus, you can combine their effect by **chaining** them together:

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

This is really powerful and lets you write quite complex queries.

Cool! You're now ready for the next part! To close the shell, type this:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```