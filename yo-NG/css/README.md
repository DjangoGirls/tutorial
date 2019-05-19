# CSS – mú kí ó rẹwà!

Blog wa ṣì burẹ́wà ní wíwò, àbí bẹ́ẹ̀ kọ? Àkókò láti mú kí ó dára! A ma lo CSS fún yẹn.

## Kíni CSS?

Cascading Style Sheets (CSS) jẹ́ èdè kan tí a n lò fún ṣíṣe àpèjúwe ìrísí àti àgbékalẹ̀ ti ààyè ayélujára kan tí a kọ ní èdè ìṣàmìsí (markup) kan (bíi HTML). Wò ó gẹ́gẹ́ bí èròjà ìṣaralóge fún ojú-ìwé ayélujára wa. ;)

Ṣùgbọ́n a kò fẹ́ bẹ̀rẹ̀ láti ìbẹ̀rẹ̀ padà, àbí bẹ́ẹ̀ kọ? Lẹ́ẹ̀kan síi, a ma lo nnkan kan tí àwọn onímọ̀ nípa kóòdù ti gbé jáde sórí íńtánẹ́ẹ̀tì lọ́fẹ̀ẹ́. Ṣíṣe nnkan tí ẹnìkan ti ṣe kalẹ̀ tẹ́lẹ̀ kìí ṣe ìgbádùn, o mọ̀.

## Ẹ jẹ́ ká lo Bootstrap!

Bootstrap jẹ́ ọ̀kan lára àwọn ètò HTML àti CSS tó gbajúmọ̀ púpọ̀ fún gbígbé àwọn ààyè ayélujára tó rẹwà jáde: https://getbootstrap.com/

Ó gba kíkọ nípasẹ̀ àwọn onímọ̀ nípa kóòdù tó ṣiṣẹ́ fún Twitter. Ní báyìí ó ní àgbéjáde nípasẹ̀ àwọn tó yọ̀ǹda ara wọn káàkiri àgbáyé!

## Ṣàgbékalẹ̀ Bootstrap

Láti ṣàgbékalẹ̀ Bootstrap, ṣí fáìlì `.html` rẹ nínú olóòtú kóòdù náà kí o sì ṣàfikún èyí sí abala `<head>` náà:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Èyí kò ní ṣàfikún fáìlì kankan sí iṣẹ́ rẹ. Yóò kàn tọ́ka sí àwọn fáìlì tó wà lórí Íńtánẹ́ẹ̀tì náà. Nítorí náà tẹ̀síwájú, ṣí ààyè ayélujára rẹ kí o sì ṣe ìmúdójúìwọ̀n ojú-ìwé náà. Òhun nìyí!

![Figure 14.1](images/bootstrap1.png)

Ó tí n dára ní wíwò!

## Static files in Django

Finally we will take a closer look at these things we've been calling **static files**. Static files are all your CSS and images. Their content doesn't depend on the request context and will be the same for every user.

### Where to put static files for Django

Django already knows where to find the static files for the built-in "admin" app. Now we need to add some static files for our own app, `blog`.

A ma ṣe ìyẹn nípasẹ̀ ṣíṣẹ̀dá fódà kan tí a n pè ní `static` sínú ètò blog náà:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Django will automatically find any folders called "static" inside any of your apps' folders. Then it will be able to use their contents as static files.

## Fáìlì CSS àkọ́kọ́ rẹ!

Ẹ jẹ́ ká ṣẹ̀dá fáìlì CSS kan ní báyìí, láti ṣàfikún àrà tìẹ sí ojú-ìwé ayélujára rẹ. Ṣẹ̀dá àkójọpọ̀ fáìlì tuntun kan tí a n pè ní `css` sínú àkójọpọ̀ fáìlì `static` rẹ. Lẹ́yìn náà ṣẹ̀dá fáìlì tuntun kan tí a pè ní `blog.css` sínú àkójọpọ̀ fáìlì `css` yìí. Ṣé o ti ṣetán?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Àkókò láti kọ àwọn CSS! Ṣí fáìlì `blog/static/css/blog.css` náà nínú olóòtú kóòdù rẹ.

We won't be going too deep into customizing and learning about CSS here. There is a recommendation for a free CSS course at the end of this page if you would like to learn more.

Ṣùgbọ́n jẹ́ kí a ṣe ó kéré tán díẹ̀ nínú rẹ̀. Bóyá a le ṣàyípadà àwọ̀ ti àwọn àkọsórí wa? Láti lóye nípa àwọn àwọ̀, àwọn kọ̀mpútà má n lo àwọn àkànṣe kóòdù. Àwọn kóòdù wọ̀nyí ma bẹ̀rẹ̀ pẹ̀lú `#` tí àwọn lẹ́tà 6 (A–F) àti àwọn nọ́mbà (0–9) sì tẹ̀le. Fún àpẹẹrẹ, kóòdù náà fún àwọ̀ búlúù jẹ́ `#0000FF`. O lè rí àwọn kóòdù àwọ̀ fún oríṣiríṣi àwọ̀ níbí: http://www.colorpicker.com/. O tún lè lo [àwọn àwọ̀ ìpìlẹ̀](http://www.w3schools.com/colors/colors_names.asp), bíi `red` àti `green`.

Nínú fáìlì `blog/static/css/blog.css` rẹ ó yẹ kí o ṣàfikún kóòdù tó tẹ̀le yìí:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
}

```

`h1 a` is a CSS Selector. This means we're applying our styles to any `a` element inside of an `h1` element; the `h2 a` selector does the same thing for `h2` elements. So when we have something like `<h1><a href="">link</a></h1>`, the `h1 a` style will apply. In this case, we're telling it to change its color to `#C25100`, which is a dark orange. Or you can put your own color here, but make sure it has good contrast against a white background!

In a CSS file we determine styles for elements in the HTML file. Ọnà àkọ́kọ́ tí a lè fi mọ àwọn element ni pẹ̀lú orúkọ element náà. You might remember these as tags from the HTML section. Things like `a`, `h1`, and `body` are all examples of element names. We also identify elements by the attribute `class` or the attribute `id`. Class and id are names you give the element by yourself. Classes define groups of elements, and ids point to specific elements. For example, you could identify the following tag by using the tag name `a`, the class `external_link`, or the id `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

You can read more about [CSS Selectors at w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

We also need to tell our HTML template that we added some CSS. Open the `blog/templates/blog/post_list.html` file in the code editor and add this line at the very beginning of it:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

We're just loading static files here. :) Between the `<head>` and `</head>` tags, after the links to the Bootstrap CSS files, add this line:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

The browser reads the files in the order they're given, so we need to make sure this is in the right place. Otherwise the code in our file may be overriden by code in Bootstrap files. We just told our template where our CSS file is located.

Ó yẹ kí fáìlì rẹ rí báyìí:

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

Ó dáa, tọ́jú fáìlì náà kí o sì ṣe ìmúdójúìwọ̀n ojú-ìwé ààyè ayélujára náà!

![Figure 14.2](images/color2.png)

Nice work! Maybe we would also like to give our website a little air and increase the margin on the left side? Let's try this!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Ṣàfikún ìyẹn sí CSS rẹ, tọ́jú fáìlì náà kí o sì wo bó tí n ṣiṣẹ́!

![Figure 14.3](images/margin2.png)

Bóyá a lè ṣe ìrísí-lẹ́tà náà bí a ṣe fẹ́ nínú àkọsórí wa? Lẹ èyí sínú `<head>` rẹ nínú fáìlì `blog/templates/blog/post_list.html`:

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
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

We will now add declaration blocks to different selectors. Selectors starting with `.` relate to classes. There are many great tutorials and explanations about CSS on the Web that can help you understand the following code. For now, copy and paste it into your `blog/static/css/blog.css` file:

{% filename %}blog/static/css/blog.css{% endfilename %}

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

Then surround the HTML code which displays the posts with declarations of classes. Replace this:

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

nínú `blog/templates/blog/post_list.html` náà pẹ̀lú èyí:

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

Tọ́jú àwọn fáìlì yẹn kí o sì ṣe ìmúdójúìwọ̀n ojú-ìwé ààyè ayélujára rẹ.

![Figure 14.4](images/final.png)

Woohoo! Looks awesome, right? Look at the code we just pasted to find the places where we added classes in the HTML and used them in the CSS. Where would you make the change if you wanted the date to be turquoise?

Don't be afraid to tinker with this CSS a little bit and try to change some things. Playing with the CSS can help you understand what the different things are doing. If you break something, don't worry – you can always undo it!

We really recommend taking this free online [Codeacademy HTML & CSS course](https://www.codecademy.com/tracks/web). It can help you learn all about making your websites prettier with CSS.

Ṣé o ti ṣetán fún àkòrí tó kàn náà?! :)