# قالب‌ها در جنگو

وقت آن است که داده ها را در وبسایت نمایش دهیم. جنگو چندین **template tag** مفید در اختیار ما قرار می دهد.

## template tag چیست؟

میدانیم که در کدهای HTML نمیتوانیم از کد های پایتون استفاده کنیم،به این دلیل که مرورگر نمیتواند کد پایتون را درک کند. مرورگرها فقط HTML را می فهمند. همینطور میدانیم که HTML ایستا است، در حالی که پایتون بسیار پویاتر است.

** template tags در جنگو ** ما را قادر می سازد تا اشیا پایتونی را به HTML انتقال دهیم، بنابراین شما میتوانید با سرعت بیشتری وبسایت های پویا توسعه دهید. چه خوب!

## نمایش دادن قالب لیست پست‌های وبلاگ

در بخش قبلی، ما لیستی از پست ها را در قالب متغیر `posts` به template دادیم. حالا آن را به وسیله HTML نمایش میدهیم.

برای چاپ یک متغیر در template های جنگو، نام متغیر را درون دو جفت آکولاد {{ }} قرار می دهیم. مانند کد زیر :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

این مورد را در قالب `blog/templates/blog/post_list.html` امتحان کنید. آن را در ویرایشگر کد باز کنید، و هر چیزی از دومین `<div>` تا سومین `</div>` را با `{{ posts }}` جایگزین کنید. فایل را ذخیره کنید، و صفحه را برای دیدن نتیجه refresh کنید:

![عدد 13.1](images/step1.png)

همینطوری که مشاهده می کنید، تمام چیزی که به دست آورده ایم این است:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

این به معنای آن است که جنگو {{ posts }} را به عنوان لیستی از اشیا در نظر میگیرد. آیا از بخش **معرفی پایتون** بخاطر دارید که چگونه میتوانیم لیست ها را نمایش دهیم؟ بله، با حلقه for ! در یک template جنگو شما این کار را به صورت زیر انجام خواهید داد:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

این کار را در template خود امتحان کنید.

![عدد 13.2](images/step2.png)

کار میکند! اما ما میخواهیم تا پست ها مانند پست های ایستایی که پیش از این در بخش **معرفی HTML** ساختیم، نمایش داده شود. میتوانید HTML و template tag را با هم استفاده کنید. قسمت `body` به صورت زیر خواهد بود:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div>
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

{% for post in posts %}
    <div>
        <p>published: {{ post.published_date }}</p>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

{% raw %} هر چیزی که بین `{% for %}` و `{% endfor %}` قرار میدهید، برای هر شی در لیست تکرار میشود. صفحه خود را refresh کنید : {% endraw %}

![عدد 13.3](images/step3.png)

آیا توجه کردید که این بار از نشانه گذاری متفاوتی استفاده کردیم؟ (`{{ post.title }}` یا `{{ post.text }}`)؟ ما در حال دسترسی به داده های موجود در هر فیلد تعریف شده در مدل `Post` هستیم. همچنین، `|linebreaksbr` متن پست ها را از فیلتری رد میکند که line-break ها را به پاراگراف تبدیل میکند.

## یک مورد دیگر

خوب است اگر بدانیم وب سایت شما روی اینترنت عمومی نیز به درستی کار میکند یا نه، درست است؟ بیایید تا دوباره انتشار آن را روی PythonAnywhere امتحان کنیم. خلاصه ای از مراحل در زیر آورده شده است…

* ابتدا کد خود را روی گیتهاب push کنید

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* سپس دوباره به [PythonAnywhere](https://www.pythonanywhere.com/consoles/) وارد شوید و به **Bash console** خود بروید ( یا یک کنسول خط فرمان جدید باز کنید)، و دستورات زیر را اجرا کنید:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd <your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(به خاطر داشته باشید `<your-pythonanywhere-domain>` را با زیردامنه PythonAnywhere خود جایگزین کنید، بدون علامت های <>)

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app. (To reach other PythonAnywhere pages from the console, use the menu button in the upper right corner.) Your update should be live on https://subdomain.pythonanywhere.com -- check it out in the browser! If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. The databases on your local computer and Python Anywhere don't sync with the rest of your files.

Congrats! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://subdomain.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![تصویر 13.4](images/donut.png)