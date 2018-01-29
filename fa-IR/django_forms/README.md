# فرم در جنگو

آخرین چیزی که ما می خواهیم در وب سایت ما انجام دهیم ایجاد یک راه خوب برای اضافه کردن و ویرایش پست های وبلاگ است. <!> مدیر </ 0> جانگا سرد است، اما سخت است که سفارشی و زیبا انجام دهید. با ` فرم ها </ 0> ما قدرت مطلق بر روی رابط ما داشته باشد - ما می توانیم تقریبا هر چیزی که می توانیم تصور کنیم!</p>

<p>چیز خوبی در مورد شکلگونو این است که ما می توانیم یکی را از ابتدا تعریف کنیم یا مدل فرم </ 0> <code> ایجاد کنیم که نتیجه فرم را به مدل ذخیره می کند.</p>

<p>این دقیقا همان چیزی است که ما می خواهیم انجام دهیم: ما یک فرم را برای مدل <code> پست </ 0> ما ایجاد خواهیم کرد.</p>

<p>مانند هر بخش مهمی از جانگو، فرم ها فایل خود را دارند: <code> شکلها.py </ 0>.</p>

<p>ما باید یک فایل با این نام در <code> وبلاگ </ 0> ایجاد کنید.</p>

<pre><code>وبلاگ
   └── شکلها.py
`</pre> 

خوب، اجازه دهید آن را باز کنیم و کد زیر را تایپ کنیم:

{% filename %}}وبلاگ/شکلها.پی{% endfilename} %}

```python
از فرم های واردات جیانگو

از .مدلها واردات پست

کلاس شکل ارسال(شکلها.نوع شکل):

     کلاس متا:
         مدل = پست
         فیلدها= ('عنوان'، 'متن'،)
```

ما باید ابتدا فرم های جانگو را وارد کنیم (` از فرم های واردات جانگا </ 0>) و، بدیهی است، ما <code> پست </ 0> مدل (<code> از .مدلها واردات پست </ 0>).</p>

<p><code> فرم ارسال</ 0>، همانطور که احتمالا مشکوک است، نام فرم ما است. ما باید به دوگانگو بگوییم که این فرم یک فرم ارسال </ 0> است (بنابراین جانگو برای ما جادویی خواهد کرد) - <code> شکلها.نوع شکل </ 0> مسئول آن است.</p>

<p>بعد، ما <code> کلاس متا </ 0> را داریم، جایی که ما به جنگو می گویم که کدام مدل باید برای ایجاد این فرم (<=> مدل = پست </ 0>) استفاده شود.</p>

<p>در نهایت می توانیم بگوییم که کدام زمینه (ها) باید در فرم ما باشد. در این سناریو ما تنها <code> عنوان </ 0> و <code> متن </ 0> را می خواهیم در معرض قرار دهیم - <code> نویسنده </ 0> باید فردی باشد که در حال حاضر وارد شده است (شما!) و < 0> ایجاد داده </ 0> باید زمانی که یک پست ایجاد کنیم (به عنوان مثال در کد) باید به طور خودکار تنظیم شود، درست است?</p>

<p>و همین! تمام مواردی که اکنون باید انجام دهیم، استفاده از فرم در نمایش <em> </ 0> و نمایش آن در قالب است.</p>

<p>بنابراین یک بار دیگر یک پیوند به صفحه، یک آدرس سایت، یک نمایه و یک الگو ایجاد خواهیم کرد.</p>

<h2>پیوند به یک صفحه با فرم</h2>

<p>وقت آن است که <code> blog / templates / blog / base.html </ 0> باز شود. <code> div </ 0> به نام <code> عنوان صفحه </ 0> لینک اضافه می کنیم:</p>

<p>{% filename %}blog/templates/blog/base.html{% endfilename %}</p>

<pre><code class="html"><a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
`</pre> 

توجه داشته باشید که ما می خواهیم با نمایش جدید ما ` post_new </ 0> تماس بگیریم. کلاس <code> "گلیفیکن گلیفیکن به علاوه" </ 0> توسط تم بوت استرپ ما استفاده می شود و علامت پلاس را برای ما نمایش می دهد.</p>

<p>After adding the line, your HTML file should now look like this:</p>

<p>{% filename %}blog/templates/blog/base.html{% endfilename %}</p>

<pre><code class="html">{% load staticfiles %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <div class="page-header">
            <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>
        <div class="content container">
            <div class="row">
                <div class="col-md-8">
                    {% block content %}
                    {% endblock %}
                </div>
            </div>
        </div>
    </body>
</html>
`</pre> 

After saving and refreshing the page http://127.0.0.1:8000 you will obviously see a familiar `NoReverseMatch` error, right?

## URL

We open `blog/urls.py` and add a line:

{% filename %}blog/urls.py{% endfilename %}

```python
url(r'^post/new/$', views.post_new, name='post_new'),
```

And the final code will look like this:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),
    url(r'^post/new/$', views.post_new, name='post_new'),
]
```

After refreshing the site, we see an `AttributeError`, since we don't have the `post_new` view implemented. Let's add it right now.

## post_new view

Time to open the `blog/views.py` file and add the following lines with the rest of the `from` rows:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

And then our *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

To create a new `Post` form, we need to call `PostForm()` and pass it to the template. We will go back to this *view*, but for now, let's quickly create a template for the form.

## Template

We need to create a file `post_edit.html` in the `blog/templates/blog` directory. To make a form work we need several things:

* We have to display the form. We can do that with (for example) {% raw %}`{{ form.as_p }}`{% endraw %}.
* The line above needs to be wrapped with an HTML form tag: `<form method="POST">...</form>`.
* We need a `Save` button. We do that with an HTML button: `<button type="submit">Save</button>`.
* And finally, just after the opening `<form ...>` tag we need to add {% raw %}`{% csrf_token %}`{% endraw %}. This is very important, since it makes your forms secure! If you forget about this bit, Django will complain when you try to save the form:

![CSFR Forbidden page](images/csrf2.png)

OK, so let's see how the HTML in `post_edit.html` should look:

{% filename %}blog/templates/blog/post_edit.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <h1>New post</h1>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
{% endblock %}
```

Time to refresh! Yay! Your form is displayed!

![New form](images/new_form2.png)

But, wait a minute! When you type something in the `title` and `text` fields and try to save it, what will happen?

Nothing! We are once again on the same page and our text is gone… and no new post is added. So what went wrong?

The answer is: nothing. We need to do a little bit more work in our *view*.

## Saving the form

Open `blog/views.py` once again. Currently all we have in the `post_new` view is the following:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

When we submit the form, we are brought back to the same view, but this time we have some more data in `request`, more specifically in `request.POST` (the naming has nothing to do with a blog "post"; it's to do with the fact that we're "posting" data). Remember how in the HTML file, our `<form>` definition had the variable `method="POST"`? All the fields from the form are now in `request.POST`. You should not rename `POST` to anything else (the only other valid value for `method` is `GET`, but we have no time to explain what the difference is).

So in our *view* we have two separate situations to handle: first, when we access the page for the first time and we want a blank form, and second, when we go back to the *view* with all form data we just typed. So we need to add a condition (we will use `if` for that):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

وقت آن است که نقاط ` [...] </ 0> را پر کنید. اگر <code> method </ 0> <code> POST </ 0> باشد، ما می خواهیم که <code> PostForm </ 0> را با داده از فرم بسازیم، درست است? ما این کار را به صورت زیر انجام خواهیم داد:</p>

<p>{% filename %}blog/views.py{% endfilename %}</p>

<pre><code class="python">form = PostForm(request.POST)
`</pre> 

چیز بعدی این است که بررسی کنید که آیا فرم صحیح است (تمام فیلدهای لازم تنظیم شده و مقادیر نادرست ارائه شده است). ما این کار را با ` form.is_valid () </ 0> انجام می دهیم.</p>

<p>ما بررسی می کنیم که آیا فرم معتبر است و اگر چنین باشد، می توانیم آن را ذخیره کنیم!</p>

<p>{% filename %}blog/views.py{% endfilename %}</p>

<pre><code class="python">اگر form.is_valid ():
     post = form.save (commit = False)
     post.author = request.user
     post.published_date = timezone.now ()
     post.save ()
`</pre> 

اساسا، ما دو چیز در اینجا داریم: فرم را با ` form.save </ 0> ذخیره می کنیم و ما یک نویسنده می نویسیم (از آنجا که هیچ <code> نویسنده </ 0> در <code> PostForm </ 0> و این فیلد مورد نیاز است). <code> commit = False </ 0> بدین معنی است که ما نمی خواهیم مدل <code> پست </ 0> را ذخیره کنیم - ما می خواهیم ابتدا نویسنده را اضافه کنیم. در بیشتر موارد شما از <code> form.save () </ 0> بدون <code> commit = اشتباه</ 0> استفاده می کنید، اما در این مورد، ما باید آن را عرضه کنیم. <code> post.save () </ 0> تغییرات را حفظ (اضافه کردن نویسنده) و یک پست جدید بلاگ ایجاد می شود!</p>

<p>سرانجام، اگر می توانستیم بلافاصله به صفحه پست <code> post_detail </ 0> ما برای پست جدید بلاگ خودمان بپیوندیم، عالی خواهد بود، درست است؟ برای این کار ما نیاز به یک واردات دیگر داریم:</p>

<p>{% filename %}blog/views.py{% endfilename %}</p>

<pre><code class="python">از جنگجو.میانبر واردات تغییر مسیر
`</pre> 

آن را در ابتدای فایل خود اضافه کنید. و اکنون می توان گفت، "به صفحه پست ` post_detail </ 0> برای پست جدید ایجاد شده بروید":</p>

<p>{% filename %}blog/views.py{% endfilename %}}</p>

<pre><code class="python">برگشت تغییر مسیر ('post_detail'، pk = post.pk)
`</pre> 

` post_detail </ 0> نام نمایش است که ما می خواهیم به آن برویم. به یاد داشته باشید که این نمایش <em> </ 0> نیاز به متغیر <code> pk </ 1> دارد? برای انتقال آن به نمایش ها، از <code> pk = post.pk </ 0> استفاده می کنیم، که <code> post </ 0> جدیدترین پست وبلاگ است!</p>

<p>خوب، ما خیلی صحبت کرده ایم، اما احتمالا می خواهیم ببینیم که کل <em> نمایش </ 0> به نظر می رسد، درست است?</p>

<p>{% filename %}blog/views.py{% endfilename %}}</p>

<pre><code class="python">def پست جدید (درخواست):
     اگر request.method == "POST":
         form = PostForm (request.POST)
         اگر form.is_valid ():
             post = form.save (commit = False)
             post.author = request.user
             post.published_date = timezone.now ()
             post.save ()
             return redirect ('post_detail'، pk = post.pk)
     دیگر:
         فرم = PostForm ()
     بازگشت رندر (درخواست، 'blog / post_edit.html'، {'form': form})
`</pre> 

بیایید ببینیم که آیا کار می کند. برو به صفحه http://127.0.0.1:8000/post/new/، اضافه کردن ` عنوان </ 0> و <code> متن </ 0>، ذخیره آن... و voilà! پست جدید وبلاگ اضافه شده است و ما به صفحه <code> post_detail </ 0> هدایت می شوید!</p>

<p>ممکن است متوجه شده باشید که قبل از ذخیره پست، تاریخ انتشار را تنظیم می کنید. بعدها، ما دکمه <em> انتشار </ 0> را در <strong> آموزش دختران جونگو: برنامه های افزودنی </ 1> معرفی می کنیم.</p>

<p>این عالیه!</p>

<blockquote>
  <p>همانطور که اخیرا رابط کاربری مدیر جنگجو را استفاده کردیم، سیستم در حال حاضر فکر می کند ما هنوز وارد سیستم نشده ایم. چند موقعیت وجود دارد که می تواند منجر به خروج از ما شود (بسته شدن مرورگر، راه اندازی مجدد DB و غیره). اگر در هنگام ایجاد یک پست متوجه شدید که خطایی در رابطه با عدم وجود یک کاربر وارد شده شده است، به صفحه مدیریت http://127.0.0.1:8000/admin بروید و دوباره وارد شوید. این مسئله به طور موقت حل خواهد شد. یک ثابت دائمی در انتظار شما در <strong> Homework: اضافه کردن امنیت به وب سایت شما! </ 0> فصل بعد از آموزش اصلی وجود دارد.</p>
</blockquote>

<p><img src="images/post_create_error.png" alt="خطا ورود به سیستم" /></p>

<h2>اعتبار فرم</h2>

<p>در حال حاضر، ما به شما نشان می دهیم که چگونه شکل های جانسون سرد است. یک پست وبلاگ باید زمینه <code> عنوان </ 0> و <code> متن </ 0> داشته باشد. در مدل <code> پست </ 0> ما نگفتیم که این فیلدها (به غیر از <code> published_date </ 0>) مورد نیاز نیستند، بنابراین، دیوانه، به طور پیش فرض، انتظار می رود آنها را تنظیم کند.</p>

<p>سعی کنید فرم را بدون <code> عنوان </ 0> و <code> متن </ 0> ذخیره کنید. حدس بزن چه اتفاقی خواهد افتاد!</p>

<p><img src="images/form_validation2.png" alt="اعتبار فرم" /></p>

<p>جنگجو معتقد است که تمام زمینه های موجود در فرم ما صحیح هستند. آیا این عالی نیست?</p>

<h2>ويرايش فرم</h2>

<p>حالا ما می دانیم که چگونه یک فرم جدید اضافه کنیم. اما اگر بخواهیم یک موجود را ویرایش کنیم، چه? این بسیار شبیه آنچه ما انجام دادیم. بگذارید برخی از چیزهای مهم را سریع بسازیم. (اگر چیزی را درک نکنید، باید از مربی خود بپرسید یا در فصل های قبلی نگاه کنید، زیرا ما قبلا همه این مراحل را پوشش دادیم.)</p>

<p>Open <code>blog/templates/blog/post_detail.html` and add the line

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

so that the template will look like this:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <div class="post">
        {% if post.published_date %}
            <div class="date">
                {{ post.published_date }}
            </div>
        {% endif %}
        <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

In `blog/urls.py` we add this line:

{% filename %}blog/urls.py{% endfilename %}

```python
    url(r'^post/(?P<pk>\d+)/edit/$', views.post_edit, name='post_edit'),
```

We will reuse the template `blog/templates/blog/post_edit.html`, so the last missing thing is a *view*.

Let's open `blog/views.py` and add this at the very end of the file:

{% filename %}blog/views.py{% endfilename %}

```python
def post_edit(request, pk):
    post = get_object_or_404(Post, pk=pk)
    if request.method == "POST":
        form = PostForm(request.POST, instance=post)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm(instance=post)
    return render(request, 'blog/post_edit.html', {'form': form})
```

This looks almost exactly the same as our `post_new` view, right? But not entirely. For one, we pass an extra `pk` parameter from urls. Next, we get the `Post` model we want to edit with `get_object_or_404(Post, pk=pk)` and then, when we create a form, we pass this post as an `instance`, both when we save the form…

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

…and when we've just opened a form with this post to edit:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

OK, let's test if it works! Let's go to the `post_detail` page. There should be an edit button in the top-right corner:

![Edit button](images/edit_button2.png)

When you click it you will see the form with our blog post:

![Edit form](images/edit_form2.png)

Feel free to change the title or the text and save the changes!

Congratulations! Your application is getting more and more complete!

If you need more information about Django forms, you should read the documentation: https://docs.djangoproject.com/en/1.11/topics/forms/

## Security

Being able to create new posts just by clicking a link is awesome! But right now, anyone who visits your site will be able to make a new blog post, and that's probably not something you want. Let's make it so the button shows up for you but not for anyone else.

In `blog/templates/blog/base.html`, find our `page-header` `div` and the anchor tag you put in there earlier. It should look like this:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

We're going to add another `{% if %}` tag to this, which will make the link show up only for users who are logged into the admin. Right now, that's just you! Change the `<a>` tag to look like this:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

This `{% if %}` will cause the link to be sent to the browser only if the user requesting the page is logged in. This doesn't protect the creation of new posts completely, but it's a good first step. We'll cover more security in the extension lessons.

Remember the edit icon we just added to our detail page? We also want to add the same change there, so other people won't be able to edit existing posts.

Open `blog/templates/blog/post_detail.html` and find this line:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

Change it to this:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

از آنجا که احتمالا وارد سیستم شوید، اگر صفحه را تازه سازی کنید، هیچ چیز دیگری را نمی بینید. هرچند صفحه را در یک مرورگر دیگر یا یک پنجره ناشناس (با نام «محرمانه» در ویندوز لبه) بارگذاری کنید، و خواهید دید که پیوند نمایش داده نمیشود و نماد نیز نمایش داده نمیشود!

## یک چیز دیگر: استقرار زمان!

بیایید ببینیم آیا این همه در هرکجا پایتون کار می کند. زمان برای راه اندازی دیگر!

* ابتدا کد جدید خود را مرتب کنید و آن را به گیت هاب فشار دهید:

% filename %}}خط فرمان% endfilename %}}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* Then, in a [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/):

{% filename %}command-line{% endfilename %}

    $ cd my-first-blog
    $ git pull
    [...]
    

* Finally, hop on over to the [Web tab](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload**.

And that should be it! Congrats :)