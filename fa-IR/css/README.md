# CSS - زیبایش کن!

بلاگ ما هنوز خیلی زشت است، نه؟ وقتش است که زیبایش کنیم. برای این کار از CSS استفاده می‌کنیم.

## CSS چیست؟

CSS یا (Cascading Style Sheets) زبان مورد استفاده برای توصیف ظاهر و قالب‌بندی یک وب سایت نوشته شده در زبان نشانه گذاری، (مانند HTML) است. از آن به عنوان آرایش برای صفحه وب مان استفاده می‌کنیم. ؛)

اما ما نمی خواهیم دوباره از ابتدا شروع کنیم، درست است؟ یک بار دیگر، ما از چیزی که برنامه نویسان در اینترنت به صورت رایگان منتشر کرده‌اند استفاده می‌کنیم. همانطور که می‌دانید اختراع دوباره چرخ جالب نیست.

## با بوت‌ استرپ شروع کنیم!

بوت استرپ یکی از محبوب‌ترین چارچوب‌های HTML و CSS برای توسعه وب سایت‌های زیبا است: https://getbootstrap.com/

توسط برنامه نویسانی که در توییتر کار می کردند نوشته شده بود. در حال حاضر توسط داوطلبانی از سراسر جهان توسعه یافته است!

## نصب بوت استرپ

برای نصب بوت استرپ فایل `.html` را در ویرایشگر متن باز کنید و به بخش `<head>` خط‌های زیر را اضافه کنید:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

هیچ فایلی به پروژه شما اضافه نشده است. این کد به فایلی که در اینترنت وجود دارد اشاره می‌کند. بنابراین به پیش بروید وبسایت خود را باز کنید و صفحه را ریفرش کنید. بفرمایید!

![عدد 14.1](images/bootstrap1.png)

ظاهری قشنگ تر از قبل!

## فایل ها ی ثابت در جنگو

در نهایت نگاهی دقیق‌تر به فایل‌هایی بیاندازیم که به آن‌ها فایل ثابت **static files** می‌گوییم. فایل‌های ثابت شامل تمامی فایل‌های CSS و عکس‌ها می‌باشند. محتوای آن‌ها به متن درخواست بستگی ندارد و برای هر کاربر یکسان خواهد بود.

### فایل‌های ثابت در جنگو کجا قرار می‌گیرند

جنگو به هرحال می‌داند که فایل‌های ثابت در اپلیکیشن پیش ساخته "admin" کجا قرار گرفته‌اند. حالا ما لازم داریم تا چند فایل ثابت را به اپلیکیشن `blog` خودمان اضافه کنیم.

ما این کار را با ایجاد یک پوشه به نام `static` در داخل برنامه وبلاگ انجام می‌دهیم:

    djangogirls
    ┤── blog
    │   ┤── migrations
    │   ┤── static
    │   ┘── templates
    ┘── mysite
    

جنگو به طور خودکار هر پوشه‌ای با نام "استاتیک" را در پوشه اپلیکیشن‌های شما پیدا خواهد کرد. پس از آن قادر است از محتوای آن‌ها به عنوان فایل ثابت استفاده کند.

## اولین فایل CSS شما!

اکنون یک فایل CSS ایجاد کنیم تا سلیقه خود را به صفحه وب تان اضافه کنیم. یک دایرکتوری جدید با نام `css` در داخل دایرکتوری `static` بسازید. سپس در داخل این دایرکتوری `css`، یک فایل جدید با نام `blog.css` ایجاد کنید. آماده شد؟

    djangogirls
    ┘─── blog
          ┘─── static
               ┘─── css
                    ┘─── blog.css
    

حالا وقت کمی CSS نوشتن است! فایل `blog/static/css/blog.css` را در ویرایشگر کد خود باز کنید.

ما در اینجا، سفارشی سازی و یادگیری CSS را خیلی عمیق بررسی نخواهیم کرد. اگر بخواهید بیشتر در باره CSS بدانید، یک توصیه برای یک دوره رایگان، در پایین این صفحه وجود دارد.

اما بیایید حداقل کمی به آن بپردازیم. شاید بتوانیم رنگ هدر هایمان را تغییر دهیم؟ برای درک رنگ‌ها، رایانه‌ها از کدهای ویژه استفاده می‌کنند. این کدها با `#` شروع می‌شوند و به ترتیب شامل 6 حرف (A-F) و اعداد (0-9) هستند. به عنان مثال، کد رنگ آبی `#0000FF` است. شما میتوانید در این آدرس کد رنگ بسیاری از رنگ‌ها را پیدا کنید http://www.colorpicker.com:/. شما همچنین ممکن است از [رنگ‌های از پیش تعریف شده](http://www.w3schools.com/colors/colors_names.asp) از جمله `قرمز` و `سبز` استفاده کنید.

در فایل ` blog/static/css/blog.css ` کد زیر را اضافه کنید:

% filename %}blog/static/css/blog.css{% endfilename %}}

```css
h1 a, h2 a {color: #C25100; }

```

`h1 a` انتخابگر یا selector در یک فایل CSS است. This means we're applying our styles to any `a` element inside of an `h1` element; the `h2 a` selector does the same thing for `h2` elements. بنابراین وقتی ما چیزی شبیه `<h1><a href=""> لینک </a></h1>` داریم، سبک `اچ 1 آ`اعمال خواهد شد. In this case, we're telling it to change its color to `#C25100`, which is a dark orange. Or you can put your own color here, but make sure it has good contrast against a white background!

در یک فایل CSS، سبک ها را برای عناصر در فایل HTML تعیین می کنیم. اولین روش شناسایی عناصر با نام عنصر است. شما ممکن است به عنوان برچسب از بخش HTML بخاطر داشته باشید. چیزهایی مانند ` a </ 0>، <code> h1 </ 0>، و <code> چهارچوب </ 0> همه نمونه هایی از نام عناصر هستند.
ما همچنین عناصر را با ویژگی <code> کلاس </ 0> یا صفت <code> آیدی </ 0> شناسایی می کنیم. کلاس و شناسه نام شما را به عنصر خودتان می دهد. کلاس ها گروه های عناصر را تعریف می کنند و شناسه ها به عناصر خاص اشاره می کنند. برای مثال، می توانید برچسب زیر را با استفاده از نام تگ <code> آ </ 0>، کلاس <code> لینک خارجی </ 0> یا آیدی <code>پیوند به صفحه ویکی </ 0> شناسایی کنید:</p>

<pre><code class="html"><a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
`</pre> 

شما می توانید بیشتر در مورد اینها بخوانید[CSS Selectors at w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

We also need to tell our HTML template that we added some CSS. Open the `blog/templates/blog/post_list.html` file in the code editor and add this line at the very beginning of it:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

ما فقط فایلهای استاتیک را در اینجا بارگیری میکنیم :) بین برچسب `<head>` و ` </ 2> </ 1>، پس از پیوند به فایل های CSS بوت استرپ، این خط را اضافه کنید:</p>

<p>{% filename %}blog/templates/blog/post_list.html{% endfilename %}</p>

<pre><code class="html"><link rel="stylesheet" href="{% static 'css/blog.css' %}">
`</pre> 

مرورگر فایل ها را به ترتیب داده می کند، بنابراین ما باید مطمئن شویم که این در جای مناسب است. در غیر این صورت کد در فایل شما ممکن است توسط کد در فایل های بوت استرپ لغو شود. ما فقط به قالب ما که در آن فایل CSS شما واقع شده است صحبت کردیم.

اکنون فایل شما باید مانند این باشد:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
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
    </body>
</html>
```

باشه، فایل را ذخیره کرده و سایت را تازه سازی کنید!

![عدد 14.2](images/color2.png)

کارت خوب بود! شاید ما نیز می خواهیم وب کم ما را کمی هوا و حاشیه سمت چپ را افزایش دهیم؟ بیایید این را امتحان کنیم!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
چهارچوب{
    چسباندن به سمت چپ 15px;
}
```

اضافه کردن آن به CSS خود، ذخیره فایل و ببینید که چگونه کار می کند!

![عدد 14.3](images/margin2.png)

شاید ما بتوانیم فونت را در هدر ما سفارشی کنیم؟ این را وارد کنید `<head>` در ` وبلاگ / قالب / وبلاگ / لیست پست</ 1> فایل:</p>

<p>{% filename %}blog/templates/blog/post_list.html{% endfilename %}</p>

<pre><code class="html"><link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
`</pre> 

همانطور که قبلا، سفارش و محل قبل از پیوند را بررسی کنید ` blog / static / css / blog.css </ 0>این خط یک فونت را به نام وارد می کند <em> خرچنگ </ 1> از فونت های گوگل https://www.google.com/fonts)).</p>

<p>پیدا کنید <code> h1 a </ 0>اعلام بلوک (این کد بین تجدیدکارو <code> {</ 0> و <code>} </ 0>)در این فایل CSS <code> blog / static / css / blog.css </ 0>.  حالا خط <code> خانواده فونت را اضافه کنید: 'لفظی'؛ </ 0> بین تجدید کار و تازه کردن صفحه:</p>

<p>{% filename %}blog/static/css/blog.css{% endfilename %}</p>

<pre><code class="css">h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
`</pre> 

![عدد 14.3](images/font.png)

عالی!

همانطور که در بالا ذکر شد CSS دارای مفهوم کلاس است. این به شما اجازه می دهد تا بخشی از کد HTML را نامگذاری کنید و تنها به این قسمت سبک بدهید، بدون اینکه به سایر قسمت ها آسیب برساند. این می تواند فوق العاده مفید باشد! شاید شما دو divs دارید که کاری متفاوت انجام می دهند (مانند هدر و پست شما). یک کلاس می تواند به شما کمک کند آنها را متفاوت نگاه کنید.

برو جلو و نام بخش هایی از کد HTML را بنویسید. ` عنوان صفحه </ 0> را به <code> div </ 0> اضافه کنید که شامل هدر شما است، مانند این:</p>

<p>% filename %}blog/templates/blog/post_list.html{% endfilename %}}</p>

<pre><code class="html"><div class="page-header">
    <h1><a href="/">وبلاگ دختران جنگجو</a></h1>
</div>
`</pre> 

و اکنون کلاس ` پست </ 0> را به <code> div </ 0> اضافه کنید که حاوی یک پست وبلاگ است.</p>

<p>% filename %}blog/templates/blog/post_list.html{% endfilename %}}</p>

<pre><code class="html"><div class="post">
    <p>published: {{ post.published_date }}</p>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
`</pre> 

ما اکنون بلوک های اعلامیه را به انتخاب کننده های مختلف اضافه خواهیم کرد. انتخابگرها شروع با `. </ 0> مربوط به کلاس ها. بسیاری از آموزش های عالی و توضیحات درباره CSS در وب وجود دارد که می تواند به شما در درک کد زیر کمک کند. For now, copy and paste it into your <code>blog/static/css/blog.css` file:

% filename %}blog/static/css/blog.css{% endfilename %}}

```css
.page-header {
    background-color: #C25100;
    margin-top: 0;
    padding: 20px 20px 20px 40px;
}

.page-header h1, .page-header h1 a, .page-header h1 a:visited, .page-header h1 a:active {
    color: #ffffff;
    font-size: 36pt;
    text-decoration: none;
}

.content {
    margin-left: 40px;
}

h1, h2, h3, h4 {
    font-family: 'Lobster', cursive;
}

.date {
    color: #828282;
}

.save {
    float: right;
}

.post-form textarea, .post-form input {
    width: 100%;
}

.top-menu, .top-menu:hover, .top-menu:visited {
    color: #ffffff;
    float: right;
    font-size: 26pt;
    margin-right: 20px;
}

.post {
    margin-bottom: 70px;
}

.post h2 a, .post h2 a:visited {
    color: #000000;
}
```

سپس کد HTML را که نمایش پست ها با اعلان کلاس ها را نشان می دهد احاطه کرده است. جایگزین این:

% filename %}blog/templates/blog/post_list.html{% endfilename %}}

```html
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

در ` وبلاگ / قالب / وبلاگ / post_list.html </ 0> با این:</p>

<p>% filename %}blog/templates/blog/post_list.html{% endfilename %}}</p>

<pre><code class="html"><div class="content container">
    <div class="row">
        <div class="col-md-8">
            {% for post in posts %}
                <div class="post">
                    <div class="date">
                        <p>published: {{ post.published_date }}</p>
                    </div>
                    <h2><a href="">{{ post.title }}</a></h2>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
`</pre> 

این فایل ها را ذخیره و وبسایت خود را تازه سازی کنید.

![عدد 14.4](images/final.png)

ووهو! به نظر عالی، درست است؟ به کدی که ما فقط کشیده ایم، نگاه کنید تا مکان هایی را پیدا کنید که کلاس ها را در HTML اضافه کردیم و آنها را در CSS استفاده کردیم. اگر می خواهید تاریخ را فیروزه ای تغییر دهید کجا می توانید تغییر دهید؟

نگران نباشید کمی با این CSS کار کنید و سعی کنید برخی از چیزها را تغییر دهید. بازی با CSS می تواند به شما کمک کند که چیزهای مختلفی را بدانید. اگر چیزی را شکستن، نگران نباشید - همیشه می توانید آن را لغو کنید!

ما واقعا توصیه می کنیم این یک کادو کدHTML & دوره آموزشی CSS </ 0>. این می تواند به شما کمک کند همه چیز درباره ساختن وب سایت های شما با CSS زیبا تر یاد بگیرند.

آماده برای فصل بعدی! :)