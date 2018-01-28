# CSS - آن را زیبا!

بلاگ ما هنوز خیلی زشت است، نه؟ وقتش است که زیبایش کنیم. برای این کار از CSS استفاده می‌کنیم.

## CSS چیست؟

صفحات سبک آبشارCSS) ) زبان مورد استفاده برای توصیف ظاهر و قالببندی یک وب سایت نوشته شده در زبان نشانه گذاری (مانند HTML) است. آن را به عنوان آرایش برای صفحه وب ما درمان کنید. ؛)

اما ما نمی خواهیم دوباره از ابتدا شروع کنیم، درست است؟ یک بار دیگر، ما از چیزی که برنامه نویسان در اینترنت به صورت رایگان منتشر می کنند استفاده می کنند. بازخورد چرخ به هیچ وجه سرگرم کننده نیست، شما می دانید.

## با بوت‌ استرپ شروع کنیم!

بوت استرپ یکی از محبوب ترین چارچوب های HTML و CSS برای توسعه وب سایت های زیبا است: https://getbootstrap.com/

توسط برنامه نویسانی که در توییتر کار می کردند نوشته شده بود. در حال حاضر توسط داوطلبان از سراسر جهان توسعه یافته است!

## نصب بوت استرپ

برای نصب بوت استرپ، شما باید این را در `.html </ 1> فایل <code><head>` خود اضافه کنید:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

این هیچ پرونده ای برای پروژه شما اضافه نمی کند. این فقط به فایل هایی که در اینترنت وجود دارد اشاره می کند. فقط پیش بروید، وب سایت خود را باز کنید و صفحه را تازه کنید. ایناهاش!

![عدد 14.1](images/bootstrap1.png)

ظاهری قشنگ تر از قبل!

## فایل ها ی ثابت در جنگو

ما در نهایت نگاهی دقیقتر به فایلها می اندازیم ( فایل های ثابت). فایلهای ثابت شامل تمامی فایلهای CSS و عکسها می باشند. محتوای آنها به متن درخواست بستگی ندارد و برای هر کاربر یکسان خواهد بود.

### فایل های ثابت در جنگو کجا قرار میگیرد

جانگو در حال حاضر می داند که برای پیدا کردن فایل های استاتیک برای ساخته شده در برنامه "مدیر". حالا ما فقط باید برخی از فایل های استاتیک را برای برنامه خود اضافه کنیم، ` blog </ 0>.</p>

<p>ما این کار را با ایجاد یک پوشه به نام <code> static </ 0> در داخل برنامه وبلاگ انجام می دهیم:</p>

<pre><code>djangogirls
├── blog
│   ├── migrations
│   ├── static
│   └── templates
└── mysite
`</pre> 

Django will automatically find any folders called "static" inside any of your apps' folders. Then it will be able to use their contents as static files.

## Your first CSS file!

Let's create a CSS file now, to add your own style to your web page. Create a new directory called `css` inside your `static` directory. Then create a new file called `blog.css` inside this `css` directory. Ready?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Time to write some CSS! Open up the `blog/static/css/blog.css` file in your code editor.

We won't be going too deep into customizing and learning about CSS here. There is a recommendation for a free CSS course at the end of this page if you would like to learn more.

But let's do at least a little. Maybe we could change the color of our header? To understand colors, computers use special codes. These codes start with `#` followed by 6 letters (A–F) and numbers (0–9). For example, the code for blue is `#0000FF`. You can find the color codes for many colors here: http://www.colorpicker.com/. You may also use [predefined colors](http://www.w3schools.com/colors/colors_names.asp), such as `red` and `green`.

In your `blog/static/css/blog.css` file you should add the following code:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
}
```

`h1 a` انتخابگر CSS است. این به این معنی است که ما سبک های خود را به هر عنصر ` a </ 0> درون عنصر <code> h1 </ 0> اعمال می کنیم. بنابراین وقتی ما چیزی شبیه <code><h1><a href=""> لینک </a></h1>` داریم، سبک `اچ 1 آ`اعمال خواهد شد. در این مورد، ما می خواهیم رنگ آن را به `#FCA205ر`تغییر دهیم که رنگ نارنجی است. البته شما می توانید رنگ خود را در اینجا قرار دهید!

در یک فایل CSS، سبک ها را برای عناصر در فایل HTML تعیین می کنیم. اولین روش شناسایی عناصر با نام عنصر است. شما ممکن است به عنوان برچسب از بخش HTML بخاطر داشته باشید. چیزهایی مانند ` a </ 0>، <code> h1 </ 0>، و <code> چهارچوب </ 0> همه نمونه هایی از نام عناصر هستند.
ما همچنین عناصر را با ویژگی <code> کلاس </ 0> یا صفت <code> آیدی </ 0> شناسایی می کنیم. کلاس و شناسه نام شما را به عنصر خودتان می دهد. کلاس ها گروه های عناصر را تعریف می کنند و شناسه ها به عناصر خاص اشاره می کنند. برای مثال، می توانید برچسب زیر را با استفاده از نام تگ <code> آ </ 0>، کلاس <code> لینک خارجی </ 0> یا آیدی <code>پیوند به صفحه ویکی </ 0> شناسایی کنید:</p>

<pre><code class="html"><a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
`</pre> 

شما می توانید بیشتر در مورد اینها بخوانید[CSS Selectors at w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

ما همچنین باید قالب HTML خودمان را اضافه کنیم که بعضی CSS ها را اضافه کردیم. فایل `blog/templates/blog/post_list.html` را باز کنید و این خط را در ابتدای آن اضافه کنید:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load staticfiles %}
```

ما فقط فایلهای استاتیک را در اینجا بارگیری میکنیم :) بین برچسب `<head>` و ` </ 2> </ 1>، پس از پیوند به فایل های CSS بوت استرپ، این خط را اضافه کنید:</p>

<p>{% filename %}blog/templates/blog/post_list.html{% endfilename %}</p>

<pre><code class="html"><link rel="stylesheet" href="{% static 'css/blog.css' %}">
`</pre> 

مرورگر فایل ها را به ترتیب داده می کند، بنابراین ما باید مطمئن شویم که این در جای مناسب است. در غیر این صورت کد در فایل شما ممکن است توسط کد در فایل های بوت استرپ لغو شود. ما فقط به قالب ما که در آن فایل CSS شما واقع شده است صحبت کردیم.

اکنون فایل شما باید مانند این باشد:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load staticfiles %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <div>
            <h1><a href="/">وبلاگ دختران جنگلی</a></h1>
        </div>

        {% for post in posts %}
            <div>
                <p>منتشر شده: {{ post.published_date }}</p>
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

As mentioned above, CSS has a concept of classes. These allow you to name a part of the HTML code and apply styles only to this part, without affecting other parts. This can be super helpful! Maybe you have two divs that are doing something different (like your header and your post). A class can help you make them look different.

Go ahead and name some parts of the HTML code. Add a class called `page-header` to your `div` that contains your header, like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

And now add a class `post` to your `div` containing a blog post.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

We will now add declaration blocks to different selectors. Selectors starting with `.` relate to classes. There are many great tutorials and explanations about CSS on the Web that can help you understand the following code. For now, just copy and paste it into your `blog/static/css/blog.css` file:

{% filename %}blog/static/css/blog.css{% endfilename %}

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

Then surround the HTML code which displays the posts with declarations of classes. Replace this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

in the `blog/templates/blog/post_list.html` with this:

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
                    <h1><a href="">{{ post.title }}</a></h1>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
```

Save those files and refresh your website.

![عدد 14.4](images/final.png)

Woohoo! Looks awesome, right? Look at the code we just pasted to find the places where we added classes in the HTML and used them in the CSS. Where would you make the change if you wanted the date to be turquoise?

Don't be afraid to tinker with this CSS a little bit and try to change some things. Playing with the CSS can help you understand what the different things are doing. If you break something, don't worry – you can always undo it!

We really recommend taking this free online [Codeacademy HTML & CSS course](https://www.codecademy.com/tracks/web). It can help you learn all about making your websites prettier with CSS.

Ready for the next chapter?! :)