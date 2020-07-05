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

## Àwọn fáìlì tó wà lójú kan nínú Django

Nígbẹ̀yìn, a ó ṣàgbéyẹ̀wò àwọn ohun tí a tí n pè ní **àwọn fáìlì tó wà lójú kan**. Àwọn fáìlì tó wà lójú kan ni gbogbo CSS àti àwọn àwòrán rẹ. Àkóónú wọn kìí dá lórí bí ìbéèrè náà ṣe rí àti pé yíò jẹ́ bákannáà fún gbogbo aṣàmúlò.

### Ibi tí a ó fi àwọn fáìlì tó wà lójú kan sí fún Django

Django ti mọ ibi tó ti máa ṣàwárí àwọn fáìlì tó wà lójú kan fún ètò "alábòójútó" tó ba wá náà. Ní báyìí, a nílò láti ṣàfikún àwọn fáìlì tó wà lójú kan fún ètò tiwa, `blog`.

A ma ṣe ìyẹn nípasẹ̀ ṣíṣẹ̀dá fódà kan tí a n pè ní `static` sínú ètò blog náà:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Django yíò fúnra rẹ̀ ṣàwárí èyíkéyìí fódà tó n jẹ́ "static" nínú èyíkéyìí fódà ti àwọn ètò rẹ. Lẹ́yìn náà, yíò ní ààyè láti lo àwọn àkóónú wọn gẹ́gẹ́ bí àwọn fáìlì tó wà lójú kan.

## Fáìlì CSS àkọ́kọ́ rẹ!

Ẹ jẹ́ ká ṣẹ̀dá fáìlì CSS kan ní báyìí, láti ṣàfikún àrà tìẹ sí ojú-ìwé ayélujára rẹ. Ṣẹ̀dá àkójọpọ̀ fáìlì tuntun kan tí a n pè ní `css` sínú àkójọpọ̀ fáìlì `static` rẹ. Lẹ́yìn náà ṣẹ̀dá fáìlì tuntun kan tí a pè ní `blog.css` sínú àkójọpọ̀ fáìlì `css` yìí. Ṣé o ti ṣetán?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Àkókò láti kọ àwọn CSS! Ṣí fáìlì `blog/static/css/blog.css` náà nínú olóòtú kóòdù rẹ.

A kò ní lọ jìnnà púpọ̀ sínú ṣíṣe bí o ṣe fẹ́ àti ìkẹ́kọ̀ọ́ nípa CSS níbí. Àmọ̀ràn kan wà fún ìdánilékọ̀ọ́ CSS ọ̀fẹ́ kan ní ìparí ojú-ìwé yìí tí o bá fẹ́ láti kẹ́kọ̀ọ́ síi.

Ṣùgbọ́n jẹ́ kí a ṣe ó kéré tán díẹ̀ nínú rẹ̀. Bóyá a le ṣàyípadà àwọ̀ ti àwọn àkọsórí wa? Láti lóye nípa àwọn àwọ̀, àwọn kọ̀mpútà má n lo àwọn àkànṣe kóòdù. Àwọn kóòdù wọ̀nyí ma bẹ̀rẹ̀ pẹ̀lú `#` tí àwọn lẹ́tà 6 (A–F) àti àwọn nọ́mbà (0–9) sì tẹ̀le. Fún àpẹẹrẹ, kóòdù náà fún àwọ̀ búlúù jẹ́ `#0000FF`. O lè rí àwọn kóòdù àwọ̀ fún oríṣiríṣi àwọ̀ níbí: http://www.colorpicker.com/. O tún lè lo [àwọn àwọ̀ ìpìlẹ̀](http://www.w3schools.com/colors/colors_names.asp), bíi `red` àti `green`.

Nínú fáìlì `blog/static/css/blog.css` rẹ ó yẹ kí o ṣàfikún kóòdù tó tẹ̀le yìí:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #FF8833;
}

```

`h1 a` jẹ́ Selector CSS kan. Èyí túmọ̀ sí pé a n lo àwọn àrà wa sí èyíkéyìí element `a` tó wà nínú element `h1` kan; selector `h2 a` náà yíò ṣiṣẹ́ bákannáà fún àwọn element `h2`. Nítorí náà, tí a bá ní nnkan kan bíi `<h1><a href="">link</a></h1>`, àrà `h1 a` náà yíò jẹ́ lílò. Ní irú ìṣẹ̀lẹ̀ yìí, a n sọ fún-un láti ṣàyípadà àwọ̀ rẹ̀ sí `#C25100`, èyí tó jẹ́ àwọ̀ omi ọsàn kíki kan. Tàbí o lè fi àwọ̀ tìẹ síbí, ṣùgbọ́n rí dájú pé ó hàn dáadáa lórí àgbétẹ́lẹ̀ funfun kan!

Nínú fáìlì CSS kan, a máa pinnu àwọn àrà fún àwọn element nínú fáìlì HTML náà. Ọnà àkọ́kọ́ tí a lè fi mọ àwọn element ni pẹ̀lú orúkọ element náà. O lè rántí àwọn wọ̀nyí gẹ́gẹ́ bí àwọn àmì láti abala HTML náà. Àwọn nnkan bíi `a`, `h1`, àti `body` jẹ́ àpẹẹrẹ àwọn orúkọ element. A tún máa n dá àwọn element mọ̀ nípasẹ̀ àsopọ̀ `class` náà tàbí àsopọ̀ `id` náà. Class àti id jẹ́ àwọn orúkọ tí o fún element náà fúnra rẹ. Àwọn kíláàsì máa ṣàlàyé àwọn ẹgbẹ́ ti àwọn element, àti pé àwọn id máa tọ́ka sí àwọn element pàtó. Fún àpẹẹrẹ, o lè dá àmì tó tẹ̀lé yìí mọ̀ nípasẹ̀ orúkọ àmì náà `a`, kíláàsì `external_link` náà, tàbí id `link_to_wiki_page` náà:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

O lè kà síi nípa [Àwọn Selector CSS ní w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

A tún nílò láti sọ fún awoṣe (template) HTML wa wípé a ti ṣàfikún àwọn CSS kan. Ṣí fáìlì `blog/templates/blog/post_list.html` nínú olóòtú kóòdù náà kí o sì ṣàfikún ìlà yìí ní ìbẹ̀rẹ̀ pẹ̀pẹ̀ rẹ̀:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

A kàn n gbé àwọn fáìlì tó wà lójú kan níbí. :) Láàrín àwọn àmì `<head>` àti `</head>` náà, lẹ́yìn àwọn atọ́ka sí àwọn fáìlì CSS Bootstrap náà, ṣàfikún ìlà yìí:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

Aṣàwákiri náà yíò ka àwọn fáìlì náà bí a ṣe tò wọ́n síbẹ̀, nítorí náà, a nílò láti rí dájú pé èyí wà níbi tó yẹ. Bí bẹ́ẹ̀ kọ́, kóòdù tó wà nínú àwọn fáìlì Bootstrap lè borí kóòdù tó wà nínú fáìlì wa. A ṣẹ̀ṣẹ̀ sọ ibi tí fáìlì CSS wa wà fún àwòṣe (template) wa.

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

Iṣẹ́ tó dára! Bóyá a tún lè fẹ́ fún ààyè ayélujára wa ní ìwọ̀nba àyè díẹ̀ àti ṣàfikún etí-ìwé náà ní apá òsì? Jẹ́ ká gbìyànjú èyí!

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

Bíi ti tẹ́lẹ̀, ṣàyẹ̀wò bí a ṣe tò wọ́n kí o sì fi síwájú atọ́ka sí `blog/static/css/blog.css` náà. Ìlà yìí yíò ṣàgbéwọlé ìrísí-lẹ́tà kan tí a n pè ní *Lobster* láti Google Fonts (https://www.google.com/fonts).

Wá búlọ́ọ̀kù ìkéde `h1 a` náà (kóòdù tó wà láàrín àwọn àkámọ́ onídodo `{` àti `}`) nínú fáìlì CSS `blog/static/css/blog.css` náà. Ní báyìí, ṣàfikún ìlà `font-family: 'Lobster';` náà sí àárín àwọn àkámọ́ onídodo náà, kí o sì ṣe ìmúdójúìwọ̀n ojú-ìwé náà:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
```

![Figure 14.3](images/font.png)

Ó dára!

Gẹ́gẹ́ bí a ṣe sọ lókè, CSS ní ìpìlẹ̀ èròngbà kan ti àwọn kíláàsì. Àwọn wọ̀nyí yíò fún ọ láàyè láti sọ apá kan lára kóòdù HTML náà lórúkọ àti lo àwọn àrà sí apá yìí nìkan, láì nípa lórí àwọn apá yòókù. Èyí lè wúlò púpọ̀! Bóyá o ní àwọn div méjì tó n ṣe nnkan ọ̀tọ̀ọ̀tọ̀ (bíi àkọsórí rẹ àti àròkọ rẹ). Kíláàsì kan lè ràn ọ́ lọ́wọ́ láti mú wọn yàtọ̀ síra.

Tẹ̀síwájú láti sọ àwọn apá kan lára kóòdù HTML náà lórúkọ. Ṣàfikún kíláàsì kan tí a n pè ní `page-header` sí `div` rẹ tó kó àkọsórí rẹ sínú, báyìí:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

Àti pé ní báyìí, ṣàfikún kíláàsì `post` kan sí `div` rẹ tó kó àròkọ blog kan sínú.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

A máa wá ṣàfikún àwọn búlọ́ọ̀kù ìkéde sí oríṣiríṣi selector. Àwọn selector tó n bẹ̀rẹ̀ pẹ̀lú `.` jẹ mọ́ àwọn kíláàsì. Ọ̀pọ̀lọpọ̀ àwọn àlàyé tó wúlò púpọ̀ nípa CSS ti wà lórí Ayélujára náà tó lè ràn ọ́ lọ́wọ́ láti mọ kóòdù tó tẹ̀le yìí. Ní báyìí, ṣàdàkọ rẹ̀ sínú fáìlì `blog/static/css/blog.css` rẹ:

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

Lẹ́yìn náà, yí kóòdù HTML tó n ṣàfihàn àwọn àròkọ náà ká pẹ̀lú àwọn ìkéde ti àwọn kíláàsì. Rọ́pò èyí:

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

Woohoo! Ó dára ní wíwò, àbí bẹ́ẹ̀ kọ? Wo kóòdù tí a ṣẹ̀ṣẹ̀ lẹ̀ náà láti wá àwọn ibi tí a ti ṣàfikún àwọn kíláàsì nínú HTML náà tí a sì lò wọ́n nínú CSS náà. Ibo lo ti máa ṣàyípadà náà tí o bá fẹ́ kí ọjọ́ náà jẹ́ àwọ̀ turquoise (àdàlù àwọ̀ búlúù àti àwọ̀ ewé)?

Má bẹ̀rù láti ṣàtúnṣe CSS yìí díẹ̀ kí o sì gbìyànjú láti ṣàyípadà àwọn nnkan kan. Fífi CSS náà ṣeré lè ràn ọ́ lọ́wọ́ láti mọ ohun tí àwọn nnkan ọ̀tọ̀ọ̀tọ̀ n ṣe. Tí o bá ṣe àṣìṣe kan, má dààmú – o lè ṣàtúnṣe rẹ̀ padà!

We really recommend taking the free online courses "Basic HTML & HTML5" and "Basic CSS" on [freeCodeCamp](https://learn.freecodecamp.org/). They can help you learn all about making your websites prettier with HTML and CSS.

Ṣé o ti ṣetán fún àkòrí tó kàn náà?! :)