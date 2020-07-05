# CSS - زیبایش کن!

بلاگ ما هنوز خیلی زشت است، نه؟ وقتش است که زیبایش کنیم. برای این کار از CSS استفاده می‌کنیم.

## CSS چیست؟

CSS یا (Cascading Style Sheets) زبان مورد استفاده برای توصیف ظاهر و قالب‌بندی یک وب سایت نوشته شده در زبان نشانه گذاری، (مانند HTML) است. از آن به عنوان آرایش برای صفحه وب خود استفاده می‌کنیم. ؛)

اما ما نمی‌خواهیم دوباره از ابتدا شروع کنیم، درست است؟ یک بار دیگر، ما از چیزی که برنامه‌نویسان در اینترنت به صورت رایگان منتشر کرده‌اند استفاده می‌کنیم. همانطور که می‌دانید اختراع دوباره چرخ جالب نیست.

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

این کار هیچ فایلی به پروژه شما اضافه نمی‌کند. این کد به فایلی که در اینترنت وجود دارد اشاره می‌کند. بنابراین به پیش بروید وبسایت خود را باز کنید و صفحه را ریفرش کنید. بفرمایید!

![تصویر 14.1](images/bootstrap1.png)

ظاهری قشنگ‌تر از قبل!

## فایل‌های ایستا در جنگو

در نهایت نگاهی دقیق‌تر به فایل‌هایی بیاندازیم که به آن‌ها فایل ایستا یا ثابت **static files** می‌گوییم. فایل‌های ایستا شامل تمامی فایل‌های CSS و عکس‌ها می‌باشند. محتوای آن‌ها به متن درخواست بستگی ندارد و برای هر کاربر یکسان خواهد بود.

### فایل‌های ایستا کجای جنگو قرار میگیرند

جنگو به هرحال می‌داند که فایل‌های ثابت در اپلیکیشن پیش ساخته "admin" کجا قرار گرفته‌اند. حالا ما لازم داریم تا چند فایل ثابت را به اپلیکیشن `blog` خودمان اضافه کنیم.

ما این کار را با ایجاد یک پوشه به نام `static` در داخل برنامه وبلاگ انجام می‌دهیم:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

جنگو به طور خودکار هر پوشه‌ای با نام "static" را در پوشه اپلیکیشن‌های شما پیدا خواهد کرد. پس از آن قادر است از محتوای آن‌ها به عنوان فایل ایستا استفاده کند.

## اولین فایل CSS شما!

اکنون یک فایل CSS ایجاد کنیم تا سلیقه خود را به صفحه وب تان اضافه کنیم. یک پوشه جدید با نام `css` در داخل پوشه `static` بسازید. سپس در داخل این پوشه `css`، یک فایل جدید با نام `blog.css` ایجاد کنید. آماده شد؟

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

حالا وقت کمی CSS نوشتن است! فایل `blog/static/css/blog.css` را در ویرایشگر کد خود باز کنید.

ما در اینجا، سفارشی سازی و یادگیری CSS را خیلی عمیق بررسی نخواهیم کرد. اگر بخواهید بیشتر در باره CSS بدانید، یک توصیه برای یک دوره رایگان، در پایین این صفحه وجود دارد.

اما بیایید حداقل کمی به آن بپردازیم. شاید بتوانیم رنگ header هایمان را تغییر دهیم؟ برای درک رنگ‌ها، رایانه‌ها از کدهای ویژه استفاده می‌کنند. این کدها با `#` شروع می‌شوند و به ترتیب شامل 6 حرف (A-F) و اعداد (0-9) هستند. به عنان مثال، کد رنگ آبی `FF0000#` است. شما می‌توانید در آدرس http://www.colorpicker.com:/ کد رنگ بسیاری از رنگ‌ها را پیدا کنید. شما همچنین ممکن است از [رنگ‌های از پیش تعریف شده](http://www.w3schools.com/colors/colors_names.asp) از جمله `قرمز` و `سبز` استفاده کنید.

در فایل ` blog/static/css/blog.css ` کد زیر را اضافه کنید:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #FF8833;
}

```

`h1 a` انتخابگر یا selector در یک فایل CSS است. به این معنی که ما درحال تنظیم کردن فرمت هر عنصر `a` هستیم که در داخل یک بخش `h1` باشد. `h2 a` نیز دقیقا مانند همین کار را در بخش `h2` انجام می‌دهد. بنابراین وقتی ما چیزی شبیه یک `<h1><a href="">link</a></h1>` داریم، فرمت `h1 a` اعمال خواهد شد. در این مورد، ما می‌خواهیم رنگ آن را به `#C25100` تغییر دهیم که رنگ نارنجی تیره است. یا اینکه می‌توانید رنگ مورد علاقه خودتان را بگذارید فقط مطمئن باشید با رنگ سفید زمینه، کنتراست کافی داشته باشد!

در یک فایل CSS،ما فرمت‌ بخش‌های مختلف یک فایل HTML را مشخص می‌کنیم. اولین روش شناسایی هر عنصر یا element، نام عنصر است. ممکن است این عناصر را به عنوان تگ tag از بخش HTML بخاطر داشته باشید. عناصری مانند ` a `، ` h1 `، و `body` همه نمونه‌هایی از نام یک عنصر هستند. ما همچنین عناصر را با ویژگی‌هایی مانند `class` یا `id` نیز شناسایی می‌کنیم. class و id نام‌هایی هستند که شما خودتان به عناصر مختلف نسبت می‌دهید. class ها، گروه‌های عناصر را تعریف می‌کنند و id ها به یک عنصر خاص اشاره می‌کنند. برای مثال، می‌توانید عنصر زیر را با استفاده از نام تگ، یعنی ` a`، نام کلاس ` external_link ` یا به کمک آیدی `link_to_wiki_page ` شناسایی کنید:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

شما می‌توانید در این موارد بیشتر بخوانید [CSS Selectors at w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

ما همچنین باید به قالب HTML خودمان بگوییم که یک فایل CSS اضافه کرده‌ایم. فایل `blog/templates/blog/post_list.html` را در ویرایشگر کد باز کنید و خط زیر را به ابتدای آن اضافه کنید:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

ما فقط فایل‌های ثابت یا static را در اینجا بارگیری می‌کنیم. :) بین برچسب `<head>` و `</head>`، پس از پیوند به فایل‌های بوت استرپ، این خط را اضافه کنید:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

مرورگر فایل‌ها را به ترتیب می‌خواند، بنابراین ما باید مطمئن شویم که این خط در جای مناسب قرار گرفته است. در غیر این صورت کد در فایل شما ممکن است توسط کد در فایل‌های بوت استرپ لغو شود. ما فقط به قالب HTML مان می‌گوییم که فایل CSS کجا قرار دارد.

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

خب، حالا فایل را ذخیره کنید و صفحه را دوباره بارگذاری کنید!

![تصویر 14.2](images/color2.png)

کارت خوب بود! شاید بخواهیم کمی حاشیه سمت چپ صفحه وب مان را افزایش دهیم؟ بیایید این را امتحان کنیم!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body { padding-left: 15px; }
```

این کد را به فایل CSS خود اضافه کنید، و ببینید چگونه کار می‌کند!

![تصویر 14.3](images/margin2.png)

شاید ما بتوانیم فونت را در هدر صفحه‌مان سفارشی کنیم؟ این قطعه کد را در بخش `<head>` فایل `blog/templates/blog/post_list.html` وارد کنید:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

همانند قبل ترتیب قرار دادن لینک‌ها را چک کنید و این خط را قبل پیوند به `blog/static/css/blog.css` قرار دهید. این خط، فونتی به نام *Lobster* را از مجموعه فونت‌های گوگل فراخوانی می‌کند (https://www.google.com/fonts).

در فایل CSS به آدرس `blog/static/css/blog.css`، بخش تعریف عنصر ` h1 a ` را پیدا کنید (قطعه کدی که بین `{` و `}` قرار دارد). حالا خط `font-family: 'Lobster';` را بین آکولادها اضافه کنید و صفحه وب را دوباره بارگیری کنید:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a { color: #C25100; font-family: 'Lobster'; }
```

![تصویر 14.3](images/font.png)

عالی!

همانطور که در بالا ذکر شد CSS دارای مفهوم کلاس است. کلاس‌ها به شما اجازه می‌دهند تا بخشی از کد HTML را نامگذاری کنید و تنها فرمت این قسمت از کد را تغییر بدهید، بدون اینکه به سایر قسمت‌ها آسیبی برسد. کلاس‌ها می‌توانند فوق‌العاده مفید باشند! شاید شما دو div دارید که کاری متفاوت انجام می دهند (مانند header و post). یک کلاس می‌تواند به شما کمک کند آن‌ها را متفاوت نگاه کنید.

پیش برویم و بخش هایی از کد HTML را نام گذاری کنیم. کلاسی به نام `page-header` را به `div` اضافه کنید که شامل هدر شما است، مانند این:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

و اکنون کلاس `post` را به `div` اضافه کنید که حاوی یک پست وبلاگ است.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

ما اکنون بلوک‌های معرف را به انتخاب‌گرهای مختلف اضافه خواهیم کرد. انتخابگرهایی که با `.` آغاز می‌شوند مربوط به کلاس‌ها هستند. آموزش‌ها و توضیحات بسیار خوبی درباره CSS در اینترنت وجود دارد که می‌تواند به شما در درک کد زیر کمک کند. حالا این قطعه کد را در فایل `blog/static/css/blog.css` کپی کنید:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
.page-header {     background-color: #C25100;     margin-top: 0;     padding: 20px 20px 20px 40px; } .page-header h1, .page-header h1 a, .page-header h1 a:visited, .page-header h1 a:active {     color: #ffffff;     font-size: 36pt;     text-decoration: none; } .content {     margin-left: 40px; } h1, h2, h3, h4 {     font-family: 'Lobster', cursive; } .date {     color: #828282; } .save {     float: right; } .post-form textarea, .post-form input {     width: 100%; } .top-menu, .top-menu:hover, .top-menu:visited {     color: #ffffff;     float: right;     font-size: 26pt;     margin-right: 20px; } .post {     margin-bottom: 70px; } .post h2 a, .post h2 a:visited {     color: #000000; }
```

سپس کد HTML زیر را که نمایش پست‌ها با اسامی کلاس‌ها را نشان می‌دهد:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

در فایل `blog/templates/blog/post_list.html` با قطعه کد زیر عوض کنید:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="content container">
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
```

این فایل‎‌ها را ذخیره کنید و وبسایت خود را دوباره بارگیری کنید.

![تصویر 14.4](images/final.png)

یووهو! به نظر عالی می‌آید، اینطور نیست؟ به کدی که اضافه کردیم نگاه کنید تا محلی که کلاس ها را در HTML اضافه و در CSS استفاده کرده ایم پیدا کنید. اگر بخواهید نوشته تاریخ ها را فیروزه ای رنگ کنید کجا را باید تغییر دهید؟

نگران نباشید کمی با این CSS کار کنید و سعی کنید برخی از چیزها را تغییر دهید. بازی با CSS می‌تواند به شما کمک کند که بفهمید هر بخش چگونه کار می‌کند. اگر چیزی را خراب کردید، نگران نباشید، همیشه می‌توانید این تغییرات را به حالت قبل برگردانید!

ما اکیداً گذراندن دوره‌های آموزشی آنلاین "Basic HTML & HTML5" و "Basic CSS" را در [freeCodeCamp](https://learn.freecodecamp.org/) توصیه می‌کنیم. این دوره‌ها به شما کمک خواهد کرد تا همه چیزهایی که برای زیباتر کردن وبسایت خود با HTML و CSS لازم دارید یاد بگیرید.

برای فصل بعدی آماده هستید؟! :)