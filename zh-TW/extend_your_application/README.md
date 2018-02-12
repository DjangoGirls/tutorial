# 擴展你的應用程式 (Extend your application)

我們已經完成了所有建立我們的網站所需的不同步驟︰我們知道如何編寫模型、url、view和範本，我們也知道如何讓我們的網站變漂亮。

現在來練習！

很明顯，在我們的部落格我們需要的第一件事是一網頁顯示一篇文章，正確吧？

我們已經有 `Post` 模型，所以我們不需要增加任何東西到 `models.py`.

## 建立一個範本連結到一篇文章內容 (Create a template link to a post's detail)

We will start with adding a link inside `blog/templates/blog/post_list.html` file. So far it should look like this: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

{% raw %}我們想要一個從文章清單的文章標題到文章內容頁的連結。 讓我們修改 `<h1><a href="">{{ post.title }}</a></h1>`，如此它連結到文章的內容頁︰{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}現在解釋這神秘的 `{% url 'post_detail' pk=post.pk %}`。 正如你可能猜想的，`{% %}` 符號表示我們正在使用 Django 範本標籤。 這次我們將使用一個能為我們建立 URL的！{% endraw %}

The `post_detail` part means that Django will be expecting a URL in `blog/urls.py` with name=post_detail

And how about `pk=post.pk`? `pk` is short for primary key, which is a unique name for each record in a database. Because we didn't specify a primary key in our `Post` model, Django creates one for us (by default, a number that increases by one for each record, i.e. 1, 2, 3) and adds it as a field named `pk` to each of our posts. We access the primary key by writing `post.pk`, the same way we access other fields (`title`, `author`, etc.) in our `Post` object!

Now when we go to http://127.0.0.1:8000/ we will have an error (as expected, since we do not yet have a URL or a *view* for `post_detail`). It will look like this:

![NoReverseMatch error](images/no_reverse_match2.png)

## 建立一個文章內容頁 URL (Create a URL to a post's detail)

讓我們在 `urls.py` 為我們的 `post_detail` *view* 建立一個 URL!

我們希望顯示我們第一篇文章的內容在這個 **URL**：http://127.0.0.1:8000/post/1/

讓我們在 `blog/urls.py` 檔中增加一個 URL 來指示 Django 到名稱為 `post_detail` 的 *view* ，它將顯示整篇部落格文章。 Add the line `url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),` to the `blog/urls.py` file. 檔案應該像這樣︰

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),
]
```

This part `^post/(?P<pk>\d+)/$` looks scary, but no worries – we will explain it for you:

- it starts with `^` again – "the beginning".
- `post/` just means that after the beginning, the URL should contain the word **post** and a **/**. So far so good.
- `(?P<pk>\d+)` – this part is trickier. 它表示 Django 會接受放在這裡的東西，並將它以變數 `pk` 傳遞給 view 。 (Note that this matches the name we gave the primary key variable back in `blog/templates/blog/post_list.html`!) `\d` also tells us that it can only be a digit, not a letter (so everything between 0 and 9). `+` 表示這裡需要有一個或一個以上的數字。 So something like `http://127.0.0.1:8000/post//` is not valid, but `http://127.0.0.1:8000/post/1234567890/` is perfectly OK!
- `/` – then we need a **/** again.
- `$` – "the end"!

這表是如果你輸入 `http://127.0.0.1:8000/post/5/` 到你的瀏覽器，Django 將會理解你正在尋找一個叫做 `post_detail` 的 *view*，傳遞 `pk` 等於 `5` 的資訊到那個 *view*.

OK, we've added a new URL pattern to `blog/urls.py`! Let's refresh the page: http://127.0.0.1:8000/ Boom! The server has stopped running again. Have a look at the console – as expected, there's yet another error!

![AttributeError](images/attribute_error2.png)

你記得下一步是什麼嗎？當然︰增加一個 view！

## 增加一個文章的內容 view

This time our *view* is given an extra parameter, `pk`. 我們的 *view* 需要接住它，對吧？ 所以，我們將定義我們的函數為 `def post_detail(request, pk):`。 注意，我們需要使用我們在urls (`pk`) 中指定的名稱。 忽略這個變數是不正確，而且將會導致錯誤！

Now, we want to get one and only one blog post. To do this, we can use querysets, like this:

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

But this code has a problem. If there is no `Post` with the given `primary key` (`pk`) we will have a super ugly error!

![DoesNotExist error](images/does_not_exist2.png)

我們不想要這樣！ 但是，當然，Django 會為我們處理這問題︰`get_object_or_404`。 In case there is no `Post` with the given `pk`, it will display much nicer page, the `Page Not Found 404` page.

![Page not found](images/404_2.png)

好消息是你實際上可以建立你自己的 `Page not found` 網頁，並使它如你期望的友善；但現在這不是超級重要的，所以我們將跳過它。

OK, time to add a *view* to our `views.py` file!

In `blog/urls.py` we created a URL rule named `post_detail` that refers to a view called `views.post_detail`. This means that Django will be expecting a view function called `post_detail` inside `blog/views.py`.

We should open `blog/views.py` and add the following code near the other `from` lines:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

And at the end of the file we will add our *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

是的。是時間來更新網頁︰http://127.0.0.1:8000/

![Post list view](images/post_list2.png)

成功了！但當你點選部落格文章標題的連結時，發生了什麼？

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

哦不！另一個錯誤！但我們已經知道如何處理它，對吧？我們需要增加一個範本 (template)！

## Create a template for the post details

我們將在 `blog/templates/blog` 中，建立一個檔案名稱為 `post_detail.html`.

它將看起來像這樣：

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
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

我們再一次擴展 `base.html`。 在 `content` 區段，我們想要顯示一篇文章的發佈日期（假如存在的話）、標題、和內容。 但我們應該討論一些重要的東西，對吧？

{% raw %}`{% if ... %} ... {% endif %}` is a template tag we can use when we want to check something. (Remember `if ... else ..` from **Introduction to Python** chapter?) In this scenario we want to check if a post's `published_date` is not empty.{% endraw %}

OK, we can refresh our page and see if `TemplateDoesNotExist` is gone now.

![Post detail page](images/post_detail2.png)

耶！成功了！

# Deploy time!

It'd be good to see if your website still works on PythonAnywhere, right? Let's try deploying again.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

然後，在 [PythonAnywhere Bash 主控台](https://www.pythonanywhere.com/consoles/)︰

{% filename %}command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

## Updating the static files on the server

Servers like PythonAnywhere like to treat "static files" (like CSS files) differently from Python files, because they can optimise for them to be loaded faster. As a result, whenever we make changes to our CSS files, we need to run an extra command on the server to tell it to update them. The command is called `collectstatic`.

Start by activating your virtualenv if it's not still active from earlier (PythonAnywhere uses a command called `workon` to do this, it's just like the `source myenv/bin/activate` command you use on your own computer):

{% filename %}command-line{% endfilename %}

    $ workon <your-pythonanywhere-username>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

The `manage.py collectstatic` command is a bit like `manage.py migrate`. We make some changes to our code, and then we tell Django to *apply* those changes, either to the server's collection of static files, or to the database.

In any case, we're now ready to hop on over to the [Web tab](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload**.

And that should be it! Congrats :)