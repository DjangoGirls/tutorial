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

Ինչպես նախկինում, ստուգեք հրահանգը և տեղադրեք `blog/static/css/blog.css` հղումը: Այս տողում Google Fonts- ից (https://www.google.com/fonts) ներմուծեք * Lobster * կոչվող տառատեսակը:

Find the `h1 a` declaration block (the code between braces `{` and `}`) in the CSS file `blog/static/css/blog.css`. Ձևավոր փակագծերի միջև ավելացրեք `font-family: 'Lobster';` տողը և թարմացրեք էջը.

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
```

![Figure 14.3](images/font.png)

Հիանալի է!

Ինչպես նշվեց վերևում, CSS- ն ունի դասակարգման հասկացություն: Դրանք թույլ են տալիս անվանել HTML կոդի մի մաս և կիրառել ոճեր միայն այդ մասի վրա ՝ առանց այլ մասերի վրա ազդելու: Սա կարող է շատ օգտակար լինել: Գուցե դուք ունեք երկու բաժիններ, որոնք տարբեր դերեր ունեն (ինչպես օրինակ վերնագիրն և բուն հաղորդագրությունը): Դասակարգումը (Class) կարող է օգնել ձեզ տարբեր տեսքեր ստանալ:

Առաջ անցնենք և անվանեք HTML կոդի որոշ մասեր: Փոխարինեք Ձեր վերնագիրը հետևյալով `header` :

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

Այժմ եկեք ավելացնենք բլոկի սահմանումները տարբեր ընտրողների համար: Selector-ները (ընտրողները), որոնք սկսվում են ` - ով: ` դասին հատուկ են: Համացանցում կան բազմաթիվ հիանալի հղումներ և բացատրություններ CSS- ի վերաբերյալ, որոնք կարող են օգնել ձեզ հասկանալ հետևյալ կոդը: Առայժմ, պատճենեք և տեղադրեք այն ձեր `blog/static/css/blog.css` ֆայլում.

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

Հետո, փոփոխեք հաղորդագրությունները ցուցադրող HTML կոդը: Փոխարինեք սարանով ՝

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

`blog/templates/blog/post_list.html`-ում սրանով

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

Պահեք այդ ֆայլերը և թարմացրեք ձեր կայքը:

![Figure 14.4](images/final.png)

Օօօօ Հիանալի տեսք ունի, այնպես չէ՞ Նայեք մեր տեղադրած կոդին: Մենք դասակարգումներ (classes) ենք ավելացրել HTML- ին և օգտագործել դրանք CSS- ում: Որտե՞ղ կկատարեք փոփոխություն, եթե ցանկանում եք, որ ամսաթիվը փիրուզագույն լինի:

Մի վախեցեք խճճվել CSS- ով `փորձեք փոխություններ անել: CSS- ով "խաղալը" կօգնի ձեզ հասկանալ, թե ինչ ֆունկցոնալություն ունեն տարբեր գործիքներ: Եթե ​​ինչ-որ բան փչացնում եք, մի անհանգստացեք. Միշտ կարող եք չեղարկել այն:

Խորհուրդ ենք տալիս անցնել «Հիմնական HTML & HTML5» և «Հիմնական CSS» առցանց դասընթացներ [freeCodeCamp](https://learn.freecodecamp.org/): Դրանք կարող են օգնել ձեզ դարձնել ձեր կայքերը ավելի գեղեցիկ HTML և CSS- ին տիրապետելու միջոցով:

Պատրա՞ստ եք հաջորդ գլխին: :)