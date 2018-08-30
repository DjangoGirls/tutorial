# CSS - آن را زیبا!

بلاگ ما هنوز خیلی زشت است، نه؟ وقتش است که زیبایش کنیم. برای این کار از CSS استفاده می‌کنیم.

## CSS چیست؟

صفحات سبک آبشارCSS) ) زبان مورد استفاده برای توصیف ظاهر و قالببندی یک وب سایت نوشته شده در زبان نشانه گذاری (مانند HTML) است. آن را به عنوان آرایش برای صفحه وب ما درمان کنید. ؛)

اما ما نمی خواهیم دوباره از ابتدا شروع کنیم، درست است؟ یک بار دیگر، ما از چیزی که برنامه نویسان در اینترنت به صورت رایگان منتشر می کنند استفاده می کنند. بازخورد چرخ به هیچ وجه سرگرم کننده نیست، شما می دانید.

## با بوت‌ استرپ شروع کنیم!

بوت استرپ یکی از محبوب ترین چارچوب های HTML و CSS برای توسعه وب سایت های زیبا است: https://getbootstrap.com/

توسط برنامه نویسانی که در توییتر کار می کردند نوشته شده بود. در حال حاضر توسط داوطلبان از سراسر جهان توسعه یافته است!

## نصب بوت استرپ

To install Bootstrap, open up your `.html` file in the code editor and add this to the `<head>` section:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

This doesn't add any files to your project. It just points to files that exist on the Internet. So go ahead, open your website and refresh the page. Here it is!

![عدد 14.1](images/bootstrap1.png)

ظاهری قشنگ تر از قبل!

## فایل ها ی ثابت در جنگو

ما در نهایت نگاهی دقیقتر به فایلها می اندازیم ( فایل های ثابت). فایلهای ثابت شامل تمامی فایلهای CSS و عکسها می باشند. محتوای آنها به متن درخواست بستگی ندارد و برای هر کاربر یکسان خواهد بود.

### فایل های ثابت در جنگو کجا قرار میگیرد

Django already knows where to find the static files for the built-in "admin" app. Now we need to add some static files for our own app, `blog`.

ما این کار را با ایجاد یک پوشه به نام ` static </ 0> در داخل برنامه وبلاگ انجام می دهیم:</p>

<pre><code>دختران جنگجو
├── وبلاگ
│   ├── مهاجرت
│   ├── استاتیک
│   └── قالب ها
└── سایت من
`</pre> 

جانگا به طور خودکار هر پوشه ای را به نام "استاتیک" در هر پوشه برنامه های خود پیدا خواهد کرد. پس از آن قادر به استفاده از مطالب خود به عنوان فایل های استاتیک خواهد بود.

## اولین فایل CSS شما!

اکنون یک فایل CSS ایجاد کنیم تا سبک خود را به صفحه وب اضافه کنیم. ایجاد یک دایرکتوری جدید با نام ` css </ 0> در داخل <code> static </ 0> دایرکتوری شما. سپس یک فایل جدید با نام <code> blog.css </ 0> ایجاد کنید در داخل این <code> css </ 0>. آماده؟</p>

<pre><code>دختران جنگجو
└─── وبلاگ
      └─── استاتیک
           └─── Css
                └─── وبلاگ.css
`</pre> 

زمان برای نوشتن برخی از CSS! فایل ` blog / static / css / blog.css </ 0> را در ویرایشگر کد خود باز کنید.</p>

<p>ما در مورد سفارشی سازی و یادگیری CSS در اینجا به سراغ ما نخواهیم رفت. اگر بخواهید بیشتر بدانید، یک توصیه برای یک دوره CSS رایگان در پایان این صفحه وجود دارد.</p>

<p>اما بیایید حداقل کمی. شاید ما بتوانیم رنگ هدر ما را تغییر دهیم؟
برای درک رنگ ها، رایانه ها از کدهای ویژه استفاده می کنند. این کد ها با <code> # </ 0> شروع می شوند و به ترتیب 6 حرف (A-F) و اعداد (0-9) می شوند. به عنوان مثال، کد آبی <code> # 0000FFو </ 0> است. شما می توانید کد رنگ برای بسیاری از رنگ ها را پیدا کنید http://www.colorpicker.com:/. شما همچنین ممکن است از <a href="http://www.w3schools.com/colors/colors_names.asp"> رنگ های از پیش تعریف شده </a> از جمله <code> قرمز </ 1> و <code> سبز ` استفاده کنید.

در ` blog/static/css/blog.cssو </ 0> شما باید کد زیر را اضافه کنید:</p>

<p>% filename %}blog/static/css/blog.css{% endfilename %}}</p>

<pre><code class="css">h1 a {
    رنگ: #FCA205;
}
`</pre> 

`h1 a` انتخابگر CSS است. این به این معنی است که ما سبک های خود را به هر عنصر ` a </ 0> درون عنصر <code> h1 </ 0> اعمال می کنیم. بنابراین وقتی ما چیزی شبیه <code><h1><a href=""> لینک </a></h1>` داریم، سبک `اچ 1 آ`اعمال خواهد شد. در این مورد، ما می خواهیم رنگ آن را به `#FCA205ر`تغییر دهیم که رنگ نارنجی است. Or you can put your own color here!

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
                <h1><a href="">{{ post.title }}</a></h1>
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

<pre><code class="css">h1 a {
    رنگ : #FCA205;
    فونت هم خانواده : 'لفضی';
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
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
`</pre> 

ما اکنون بلوک های اعلامیه را به انتخاب کننده های مختلف اضافه خواهیم کرد. انتخابگرها شروع با `. </ 0> مربوط به کلاس ها. بسیاری از آموزش های عالی و توضیحات درباره CSS در وب وجود دارد که می تواند به شما در درک کد زیر کمک کند. For now, copy and paste it into your <code>blog/static/css/blog.css` file:

% filename %}blog/static/css/blog.css{% endfilename %}}

```css
.page-header {
    background-color: #ff9400;
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

.post h1 a, .post h1 a:visited {
    color: #000000;
}
```

سپس کد HTML را که نمایش پست ها با اعلان کلاس ها را نشان می دهد احاطه کرده است. جایگزین این:

% filename %}blog/templates/blog/post_list.html{% endfilename %}}

```html
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
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
                    <h1><a href="">{{ post.title }}</a></h1>
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