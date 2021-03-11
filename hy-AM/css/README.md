# CSS - դարձրեք այն գեղեցիկ:

Մեր բլոգը դեռ բավականին վատ տեսք ունի, այնպես չէ՞: Ժամանակն է այն ավելի գրավիչ դարձնել: Դրա համար մենք կօգտագործենք CSS:

## Ի՞նչ է CSS- ը:

Cascading Style Sheets (CSS-կասկադի ոճի թերթեր) դա լեզու է, որն օգտագործվում է նշագրման լեզվով գրված կայքի տեսքն ու ձևաչափումը նկարագրելու համար (ինչպես HTML-ն է): Համարեք սա որպես դիմահարդարում մեր կայքի համար :)

Բայց մենք չենք ուզում զրոյից սկսել, այնպես չէ՞: Մենք կօգտագործենք այն ամենը, ինչ այլ ծրագրավորողներ տեղադրել են ինտերնետում անվճար: Նորից անվադող հորինելն այնքան էլ հետաքրքիր չէ :)

## Եկեք օգտագործենք Bootstrap!

Bootstrap- ը գեղեցիկ կայքեր մշակելու ամենատարածված HTML և CSS շրջանակներից մեկն է. Https://getbootstrap.com/

Այն գրվել է Twitter ծրագրավորողների կողմից, իսկ այժմ մշակվում է կամավորների կողմից ամբողջ աշխարհից:

## Տեղադրեք Bootstrap- ը

Bootstrap- ը տեղադրելու համար խմբագրում բացեք ` .html ` կոդը պարունակող ֆայլը և այս տողերն ավելացրեք `<head>` վերնագրում.

{% filename %}blog/templates/blog/post_list.html{% endfilename %} 

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

```

Սա ձեր ծրագրին ոչ մի ֆայլ չի ավելացնի: Այս կոդը պարզապես ցույց է տալիս, որ այդ ֆայլերը գոյություն ունեն ինտերնետում: Այսպիսով, բացեք կայքը և թարմացրեք էջը: Ահա՝ դուք կտեսնեք փոփոխությունները:

![Figure 14.1](images/bootstrap1.png)

Արդեն ավելի գեղեցիկ տեսք ունի:

## Ստատիկ ֆայլեր Django- ում

Վերջապես, մենք ավելի մանրամասն կանդրադառնանք այն ամենին, ինչ կոչվում է **static files** (ստատիկ ֆայլեր): Ստատիկ ֆայլերը` բոլոր CSS ֆայլերը և պատկերներ են: Դրանց բովանդակությունը կախված չէ հարցման ենթատեքստից և արդյունքը նույնը կլինի յուրաքանչյուր օգտագործողի համար:

### Որտե՞ղ տեղադրել ստատիկ ֆայլեր Django- ում:

Django- ն արդեն գիտի, թե որտեղ կարելի է գտնել ստատիկ ֆայլերը «ադմինիստրատոր» ներդրված ծրագրի համար: Այժմ մենք պետք է ստատիկ ֆայլեր ավելացնենք մեր սեփական ծրագրում ՝ `blog` (բլոգ):

Մենք դա կանենք ՝ ստեղծելով `static` folder (ստատիկ պանակ) մեր բլոգի հավելվածի ներսում:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Django- ն ձեր ծրագրի պանակների մեջ ավտոմատ կերպով կգտնի «ստատիկ» կոչվող ցանկացած պանակ: Այնուհետև դրանց բովանդակությունը կարող եք օգտագործել որպես ստատիկ ֆայլեր:

## Ձեր առաջին CSS ֆայլը:

Եկեք ստեղծենք CSS ֆայլ ՝ ձեր վեբ էջում ձեր սեփական ոճը ստեղծելու համար: Ստեղծեք նոր ` css ` պանակ `static` (ստատիկ) պանակի ներսում: Դրանից հետո ստեղծեք ` blog.css ` կոչվող նոր ֆայլ այս ` css ` պանակի ներսում: Պատրա՞ստ եք

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Ժամանակն է գրել CSS մի քանի տող: Ձեր կոդի խմբագրիչում բացեք `blog/static/css/blog.css` ֆայլը:

Այս դասընթացում մենք չենք կենտրոնանալու CSS-ի ուսուցման մեջ: Էջի վերջում առաջարկվում են անվճար CSS դասընթացներ, եթե ցանկանում եք ինքնուրույն սովորել CSS:

Բայց եկեք պարզապես մի փոքր ուսումնասիրենք: Գուցե՞ մենք կարող ենք փոխել մեր վերնագրերի գույները: Գույները հասկանալու համար համակարգիչները օգտագործում են հատուկ ծածկագրեր (կոդեր): Այս կոդերը սկսվում են ` # ` - ից, որին հաջորդում են 6 տառ (A – F) և թվեր (0–9): Օրինակ ՝ կապույտի կոդը ` # 0000FF ` է: Շատ գույների գունային կոդերը կարող եք գտնել այստեղ ՝ http://www.colorpicker.com/: Կարող եք նաև օգտագործել [ կանխորոշված ​​գույներ ](http://www.w3schools.com/colors/colors_names.asp), ինչպիսիք են ` կարմիրը ` և ` կանաչը ` ( <1>red</1> and <1>green</1>.)

Ձեր ` blog/static/css/blog.css ` ֆայլում պետք է ավելացնեք հետևյալ ծածկագիրը.

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
}

```

` h1 a ` - ը CSS ընտրող է: Սա նշանակում է, որ մենք օգտագործում ենք մեր ոճերը `a`տարրի ներսում գտնվող ցանկացած `h1` տարրի նկատմամբ; `h2 a` ընտրիչը նույնն է անում`h2`տարրերի համար: Այսպիսով, երբ մենք ունենք `<h1><a href="">link</a></h1>` պես մի բան, կկիրառվի `h1 a` ոճը: Այս դեպքում մենք հրահանգում ենք, որ այն փոխի իր գույնը և դարձնի `#C25100`, որը մուգ նարնջագույն է: Կամ կարող եք այստեղ տեղադրել ձեր սեփական գույնը, բայց համոզված լինելով, որ այն լավ հակադրություն ունի սպիտակ ֆոնի վրա:

CSS ֆայլում մենք որոշում ենք HTML ֆայլի տարրերի ոճերը: Էլեմենտները նույնացնելու առաջին եղանակը դրանց անվանումներն են: Պետք է հիշել այս պիտակները (tag-երը) HTML- ից: ` a `, ` h1 `, և ` body ` սրանք բոլորը տարրերի անունների օրինակներ են: Մենք նաև տարրերը նույնացնում ենք ըստ հատկանիշի `class` կամ հատկանիշը `id`. Class և id-ը անուններ են, որոնք դուք ինքներդ եք վերագրում տարրերին: Դասերը (сlass) սահմանում են տարրերի խմբեր, իսկ նույնացուցիչները (id) մատնանշում են հատուկ տարրեր: Օրինակ, դուք կարող եք նույնականացնել հետևյալ տարրը ՝ օգտագործելով տարրի անունը

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

CSS ընտրողների մասին ավելին կարող եք կարդալ այստեղ [CSS Selectors at w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

Մենք նաև պետք է մեր HTML ձևանմուշին ասենք, որ մենք ավելացրել ենք CSS ոճեր: Կոդի խմբագրում բացեք `blog/templates/blog/post_list.html` ֆայլը և հենց սկզբում ավելացրեք այս տողը. 

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

Մենք պարզապես ներբեռնում ենք ստատիկ ֆայլեր :) `<head>` և ` </head> ` միջև, Bootstrap CSS ֆայլեր ֆայլերից հետո, ավելացրեք այս տողը.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

Բրաուզերը կարդում է ֆայլերը տրված հերթականությամբ, ուստի մենք պետք է համոզվենք, որ դրանք ճիշտ տեղում են: Հակառակ դեպքում, մեր ֆայլի կոդը կարող է գերակշռվել կոդով Bootstrap ֆայլերում: Մենք պարզապես պատմեցինք մեր ձևանմուշին (template), թե որտեղ է գտնվում մեր CSS ֆայլը:

Ձեր ֆայլն այժմ պետք է ունենա այսպիսի տեսք.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
<!DOCTYPE html>
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <header>
            <h1><a href="/">Django Girls Blog</a></h1>
        </header>

        {% for post in posts %}
            <article>
                <time>published: {{ post.published_date }}</time>
                <h2><a href="">{{ post.title }}</a></h2>
                <p>{{ post.text|linebreaksbr }}</p>
            </article>
        {% endfor %}
    </body>
</html>
```

Շատ լավ, պահեք ֆայլը և թարմացրեք կայքը:

![Figure 14.2](images/color2.png)

Հիանալի աշխատանք: Գուցե մենք ցանկանում ենք մեր կայքին որոշակի տարածք և ձախ հատվածում լուսանցք ավելացնել: Եկեք փորձենք!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Ավելացրեք դա ձեր CSS- ին, պահեք ֆայլը և տեսեք, թե ինչպես է այն աշխատում:

![Figure 14.3](images/margin2.png)

Միգուցե կարո՞ղ ենք հարմարեցնել մեր վերնագրի տառատեսակը: Տեղադրեք սա `<head>` in `blog/templates/blog/post_list.html` ձեր ֆայլում:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

As before, check the order and place before the link to `blog/static/css/blog.css`. This line will import a font called *Lobster* from Google Fonts (https://www.google.com/fonts).

Find the `h1 a` declaration block (the code between braces `{` and `}`) in the CSS file `blog/static/css/blog.css`. Now add the line `font-family: 'Lobster';` between the braces, and refresh the page:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
```

![Figure 14.3](images/font.png)

Great!

As mentioned above, CSS has a concept of classes. These allow you to name a part of the HTML code and apply styles only to this part, without affecting other parts. This can be super helpful! Maybe you have two divs that are doing something different (like your header and your post). A class can help you make them look different.

Go ahead and name some parts of the HTML code. Replace the `header` that contains your header with the following:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<header class="page-header">
    <div class="container">
        <h1><a href="/">Django Girls Blog</a></h1>
    </div>
</header>
```

And now add a class `post` to your `article` containing a blog post.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<article class="post">
    <time>published: {{ post.published_date }}</time>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</article>
```

We will now add declaration blocks to different selectors. Selectors starting with `.` relate to classes. There are many great tutorials and explanations about CSS on the Web that can help you understand the following code. For now, copy and paste it into your `blog/static/css/blog.css` file:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
.page-header {
    background-color: #C25100;
    margin-top: 0;
    margin-bottom: 40px;
    padding: 20px 20px 20px 40px;
}

.page-header h1,
.page-header h1 a,
.page-header h1 a:visited,
.page-header h1 a:active {
    color: #ffffff;
    font-size: 36pt;
    text-decoration: none;
}

h1,
h2,
h3,
h4 {
    font-family: 'Lobster', cursive;
}

.date {
    color: #828282;
}

.save {
    float: right;
}

.post-form textarea,
.post-form input {
    width: 100%;
}

.top-menu,
.top-menu:hover,
.top-menu:visited {
    color: #ffffff;
    float: right;
    font-size: 26pt;
    margin-right: 20px;
}

.post {
    margin-bottom: 70px;
}

.post h2 a,
.post h2 a:visited {
    color: #000000;
}

.post > .date,
.post > .actions {
    float: right;
}

.btn-default,
.btn-default:visited {
    color: #C25100;
    background: none;
    border-color: #C25100;
}

.btn-default:hover {
    color: #FFFFFF;
    background-color: #C25100;
}
```

Then surround the HTML code which displays the posts with declarations of classes. Replace this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <article class="post">
        <time>published: {{ post.published_date }}</time>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </article>
{% endfor %}
```

in the `blog/templates/blog/post_list.html` with this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<main class="container">
    <div class="row">
        <div class="col">
            {% for post in posts %}
                <article class="post">
                    <time class="date">
                        {{ post.published_date }}
                    </time>
                    <h2><a href="">{{ post.title }}</a></h2>
                    <p>{{ post.text|linebreaksbr }}</p>
                </article>
            {% endfor %}
        </div>
    </div>
</main>
```

Save those files and refresh your website.

![Figure 14.4](images/final.png)

Woohoo! Looks awesome, right? Look at the code we just pasted to find the places where we added classes in the HTML and used them in the CSS. Where would you make the change if you wanted the date to be turquoise?

Don't be afraid to tinker with this CSS a little bit and try to change some things. Playing with the CSS can help you understand what the different things are doing. If you break something, don't worry – you can always undo it!

We really recommend taking the free online courses "Basic HTML & HTML5" and "Basic CSS" on [freeCodeCamp](https://learn.freecodecamp.org/). They can help you learn all about making your websites prettier with HTML and CSS.

Ready for the next chapter?! :)