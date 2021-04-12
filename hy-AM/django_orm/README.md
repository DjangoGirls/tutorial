# Django ORM և QuerySets

Այս գլխում դուք կսովորեք, թե ինչպես է Django- ն միանում և պահում տեղեկատվությունը տվյալների բազայում: Եկեք սկսենք:

## Ի՞նչ է QuerySet- ը:

QuerySet- ը, ըստ էության, տվյալ Մոդելի օբյեկտների ցուցակն է: QuerySets- ը թույլ է տալիս կարդալ տվյալների բազան, զտել և փոխել դրանց կարգը:

Օրինակով սովորելը ամենահեշտն է: Փորձենք սա, այնպես չէ՞:

## Django shell

Բացեք ձեր տեղական վահանակը (ոչ PythonAnywhere- ում) և մուտքագրեք այս հրամանը.

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

Արդյունքն այսպիսին պետք է լինի.

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

Դուք այժմ Django- ի ինտերակտիվ վահանակում եք: Դա ճիշտ է Python- ի հուշման նման, բայց ինչ-որ լրացուցիչ Django մոգությամբ: :) Այստեղ կարող եք օգտագործել Python- ի բոլոր հրամանները:

### Բոլոր օբյեկտները

Փորձենք նախ ցուցադրել մեր բոլոր հաղորդագրությունները: Դա կարող եք անել հետևյալ հրահանգով.

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Վայ Սխալ առաջացավ: Այն մեզ ասում է, որ Փոստ չկա: Եվ դա ճիշտ է. Մենք մոռացել ենք ներմուծել այն:

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

Մենք ներմուծում ենք `Post` մոդելը `blog.models`-ից:Փորձենք կրկին ստանալ բլոգի բոլոր գրառումները.

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

Սա ավելի վաղ ստեղծած հաղորդագրությունների ցուցակն է: Մենք ստեղծեցինք այս հաղորդագրությունները Django ադմինիստրատորի ինտերֆեյսի միջոցով: Բայց հիմա մենք ուզում ենք ստեղծել նոր հաղորդագրություններ Python- ի միջոցով, ինչպե՞ս դա անել:

### Ստեղծել օբյեկտ

Ահա, թե ինչպես եք դուք ստեղծում նոր Post օբյեկտ տվյալների բազայում/database.

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Բայց այստեղ մենք ունենք մեկ պակասող բաղադրիչ ՝ `me/ես`: Մենք պետք է որպես հեղինակ փոխանցենք `User/Օգտագործող` մոդելի օրինակ: Ինչպե՞ս դա անել:

Եկեք նախ ներմուծենք Օգտագործողի մոդելը/User model.

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

Ի՞նչ օգտվողներ ունենք մեր տվյալների բազայում/database: Փորձեք այս:

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

This is the superuser we created earlier! Let's get an instance of the user now (adjust this line to use your own username):

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

As you can see, we now `get` a `User` with a `username` that equals 'ola'. Neat!

Now we can finally create our post:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

Hurray! Wanna check if it worked?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

There it is, one more post in the list!

### Add more posts

You can now have a little fun and add more posts to see how it works. Add two or three more and then go ahead to the next part.

### Filter objects

A big part of QuerySets is the ability to filter them. Let's say we want to find all posts that user ola authored. We will use `filter` instead of `all` in `Post.objects.all()`. In parentheses we state what condition(s) a blog post needs to meet to end up in our queryset. In our case, the condition is that `author` should be equal to `me`. The way to write it in Django is `author=me`. Now our piece of code looks like this:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Or maybe we want to see all the posts that contain the word 'title' in the `title` field?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **Note** There are two underscore characters (`_`) between `title` and `contains`. Django's ORM uses this rule to separate field names ("title") and operations or filters ("contains"). If you use only one underscore, you'll get an error like "FieldError: Cannot resolve keyword title_contains".

You can also get a list of all published posts. We do this by filtering all the posts that have `published_date` set in the past:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

Unfortunately, the post we added from the Python console is not published yet. But we can change that! First get an instance of a post we want to publish:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

And then publish it with our `publish` method:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Now try to get list of published posts again (press the up arrow key three times and hit `enter`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
```

### Ordering objects

QuerySets also allow you to order the list of objects. Let's try to order them by `created_date` field:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

We can also reverse the ordering by adding `-` at the beginning:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### Complex queries through method-chaining

As you saw, some methods on `Post.objects` return a QuerySet. The same methods can in turn also be called on a QuerySet, and will then return a new QuerySet. Thus, you can combine their effect by **chaining** them together:

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