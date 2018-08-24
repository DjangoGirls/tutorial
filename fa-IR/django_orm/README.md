# جنگو ORM و QuerySets

در این فصل شما چگونگی اتصال به پایگاه داده و ذخیره اطلاعات در آن را خواهید یادگرفت. وارد عمل شویم!

## QuerySet چیست؟

A QuerySet is, in essence, a list of objects of a given Model. QuerySets allow you to read the data from the database, filter it and order it.

ساده ترین راه برای فراگیری با مثال است. پس شروع می کنیم.آماده اید؟

## پوسته Django

کنسول های لوکال خود را باز کرده ( نه در PythonAnywhere) و این دستور را تایپ کنید:

{% filename %}خط فرمان{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    
    

باید پاسخی مانند زیر دریافت کنید:

{% filename %}خط فرمان{% endfilename %}

```python
(InteractiveConsole)
>>>
```

You're now in Django's interactive console. It's just like the Python prompt, but with some additional Django magic. :) You can use all the Python commands here too.

### تمام اشیاء

در ابتدا تمامی پست ها را نمایش می دهیم. با دستور زیر می توان این کار را انجام داد:

{% filename %}خط فرمان{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Oops! An error showed up. It tells us that there is no Post. It's correct – we forgot to import it first!

{% filename %}خط فرمان{% endfilename %}

```python
>>> from blog.models import Post
```

We import the model `Post` from `blog.models`. Let's try displaying all posts again:

{% filename %}خط فرمان{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

This is a list of the posts we created earlier! We created these posts using the Django admin interface. But now we want to create new posts using Python, so how do we do that?

### ایجاد شیء

به صورت زیر می توان یک شیء پست جدید در پایگاه داده ایجاد کرد:

{% filename %}خط فرمان{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

But we have one missing ingredient here: `me`. We need to pass an instance of `User` model as an author. How do we do that?

بیایید اول مدل User را وارد کنیم:

{% filename %}خط فرمان{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

مشاهده کاربران در پایگاه داده :

{% filename %}خط فرمان{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

This is the superuser we created earlier! Let's get an instance of the user now (adjust this line to use your own username):

{% filename %}خط فرمان{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

As you can see, we now `get` a `User` with a `username` that equals 'ola'. Neat!

الان ما میتونیم پست خود را ایجا کنیم:

{% filename %}خط فرمان{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

با هم امتحان می کنیم.

{% filename %}خط فرمان{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

اینگونه یک پست دیگر در لیست خواهیم داشت!

### اضافه کردن پست های بیشتر

You can now have a little fun and add more posts to see how it works. Add two or three more and then go ahead to the next part.

### فیلتر کردن اشیاء

A big part of QuerySets is the ability to filter them. Let's say we want to find all posts that user ola authored. ما در اینجا به جای `all` از `filter` در تمامی `Post.objects.all()` استفاده می کنیم. In parentheses we state what condition(s) a blog post needs to meet to end up in our queryset. In our case, the condition is that `author` should be equal to `me`. The way to write it in Django is `author=me`. الان یک کد به صورت زیر داریم:

{% filename %}خط فرمان{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Or maybe we want to see all the posts that contain the word 'title' in the `title` field?

{% filename %}خط فرمان{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> دقت کنید که ۲تا کارکتر underscore ( ــ ) در میان `title` و `contains` وجود دارد. Django's ORM uses this rule to separate field names ("title") and operations or filters ("contains"). If you use only one underscore, you'll get an error like "FieldError: Cannot resolve keyword title_contains".

You can also get a list of all published posts. We do this by filtering all the posts that have `published_date` set in the past:

{% filename %}خط فرمان{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

Unfortunately, the post we added from the Python console is not published yet. But we can change that! First get an instance of a post we want to publish:

{% filename %}خط فرمان{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

و حالا با متد `publish` آن را منتشر می کنیم:

{% filename %}خط فرمان{% endfilename %}

```python
>>> post.publish()
```

Now try to get list of published posts again (press the up arrow key three times and hit `enter`):

{% filename %}خط فرمان{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
```

### سفارش اشیاء (Ordering objects)

QuerySets همچنین به شما اجازه میدهد لیستی از اشیاء را سفارش دهید.آنها را در قسمت `created_date` سفارش دهید:

{% filename %}خط فرمان{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

همچنین با اضافه کردن `-` در ابتدای دستور میتوانیم معکوس سفارش را ببینیم:

{% filename %}خط فرمان{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### زنجیرهای QuerySets

شما همچنین می توانید QuerySets ها را با **chaining** با یکدیگر ترکیب کنید:

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

این واقعا قدرتمند است و به شما اجازه کوءری های(queries) پیچیده را می دهد.

موفق شدیم! شما الان برای قسمت بعدی آماده هستید. برای بستن پوسته (shell) دستور زیر را تایپ کنید:

{% filename %}خط فرمان{% endfilename %}

```python
>>> exit()
```