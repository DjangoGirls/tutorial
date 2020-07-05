# ސީއެސް އެސް - ރީތިކުރުމަށް!

އަހަރެމެންގެ ބްލޮގް ހަޑިދޯ؟ މިއީ ބްލޮގް ރީތި ކޮށްލާ ވަގުތު! މިކަމަށް ބޭނުން ކުރާނީ ސީއެސްއެސް.

## ސީ އެސް އެސް އަކީ ކޯއްޗެއް؟

ކެސްކޭޑިން ސްޓައިލްޝީޓްސް ( ސީއެސް އެސް) އަކީ މާރކްއަޕް ލެންގުއޭޖުން ( އެޗްޓީއެމްއެލް ފަދަ) ލިޔަފައި ހުންނަ ވެބްސައިޓް ފެންނަގޮތް އަދި ފޯރމެޓިން އިންނަންވާގޮތް ކިޔައިދޭ ލެންގުއޭޖެކެވެ. ވެބްޕޭޖްގެ މޭކަޕް ގެ ގޮތަށް ގެންގުޅުން ރަނގަޅުވާނެ :)

އެކަމަކު އަލުން ފަށާކަށް ބޭނުމެއް ނޫންދޯ؟ އަދި އެއްފަހަރު، އެކި ޕްރޮގްރާމަރުން އިންޓަރނެޓްއަށް ދޫކޮށްފައިހުރި ހިލޭ ބޭނުންކުރެވޭ ތަކެތި ބޭނުންކޮށްލާނަމެވެ. އަލުން ހުރިހާ އެއްޗެއް ހެދުމަކީ މަޖާކަމެއް ނޫން.

## ބޫްޓް ސްޓްރެޕް ބޭނުންކުރަން ހިނގާ!

ބޫޓްސްޓްރެޕްއަކީ ރީތި ވެބްސައިޓް ހެދުމަށްޓަކައި ބޭނުންކުރާ އެޗްޓީއެމްއެލް އަދި ސީއެސްއެސް ފްރޭމްވޯރކްއެވެ.: /https://getbootstrap.com

މީތި ލިޔެފައިވަނީ ޓުވިޓާއަށް ކުރިން މަސައްކަތްކުރި ޕްރޮގްރާމަރުން ތަކެކެވެ. މިހާރު މީތި ތައްޔާރުކުރަނީ ދުނިޔޭގެ އެކިތަންތަނުގައި ތިބި ހިލޭ ސާބަހަށް މަސައްކަތްކުރާ މީހުންނެވެ!

## ބޫޓްސްޓްރެޕް އިންސްޓޯލް ކުރޭ

ބޫޓްސްޓްރެޕް އިންސްޓޯލްކުރުމަށް، `.html` ފައިލް ކޯޑު އެޑިޓަރގައި ހުޅުވާ އަދި `<head>` މީތި ސެކްޝަން އަށް ލާށެވެ:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"><link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

މީގެއިން ޕްރޮޖެކްޓްއަށް އެއްވެސް ފައިލްއެއް ނޭޅޭނެއެވެ. މީގެއިން އިންޓަރނެޓްގައި ވާ ފައިލްތަކަށް ޕޮއިންޓްކުރާނެއެވެ. އެހެންވީމާ، ވެބްސައިޓް ހުޅުވާފައި ޕޭޖް ރީފްރެޝް ކޮށްލާށެވެ. މިއޮތީ!

![Figure 14.1](images/bootstrap1.png)

މިހާރުވެސް ރީތިވެއްޖެ!

## ޖެންގޯގައިވާ ސްޓެޓިކް ( ބަދަލުނުވާ) ފައިލްތައް

**ސްޓެޓިިިކް ފައިލްސް** އޭ މިކިޔާ އެއްޗަށް ތަންކޮޅެއް ކައިރިން ބަލާލާނަމެވެ. ސްޓެޓިކް ފައިލްސް އަކީ ސީއެސް އެސް އަދި އިމޭޖް ތައް. މީގެ ކޮންޓެންޓުތައް ކޮންމެ ރިކުއެސްޓަކަށް (ސަރވާއަށް ފޮނުވާ ރިކުއެސްޓް) ނުބަލާނެ އަދި ބޭނުންކުރާމީހަކަށްވެސް ތަފާތެއް ނުވާނެއެވެ.

### ޖެންގޯގައި ސްޓެޓިކް ފައިލްތައް ލާނީ ކޮންތަނަކަށް

"އެޑްމިން" އެޕްގެ ސްޓެޓިކް ފައިލްތައް ލާން ޖެހޭތަން ޖެންގޯއަށް އިނގޭނެއެވެ. އަހަރެމެންގެ އަމިއްލަ `blog` އެޕްއަށް ސްޓެޓިކް ފައިލްތައް ލާންވީ.

ފައިލްތައް ލާނީ ބްލޮގް އެޕްގައި `static`ނަމުގައި ފޯލްޑަރ އެއް ހަދައިގެން:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

އެއްވެސް އެޕް ފޯލްޑަރ އެއްގައި "static" ފޯލްޑަރ އެއް އިންތޯ ޖެންގޯއިން ހޯދާނެ. ސްޓެޓިކް ފައިލްގައި ހުރި އެއްޗެއް ބޭނުންކުރެވޭނެ.

## އެންމެ ފުރަތަމަ ސީއެސްއެސް ފައިލް!

އެންމެ ފުރަތަމަ ހިނގާ ސީއެސްއެސް ފައިލް އެއް ހަދަން، ވެބް ޕޭޖަށް އަމިއްލަ ސްޓައިލް އެއް ލާން. `static` ޑިރެކްޓްރީ ތެރޭގައި `css` ޖަހާފައި އާ ޑިރެކްޓްރީ އެއް ހަދާ. ދެން `css` ޑިރެކްޓްރީ ތެރޭގައި `blog.css` ނަމުގައި އާ ފައިލް އެއް ހަދާ. ތައްޔާރުތަ?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

މިއީ ސީއެސް އެސް ތަކެއް ލިޔަންވީ ވަގުތު! ކޯޑު އެޑިޓަރުގައި `blog/static/css/blog.css` ފައިލް ހުޅުވާ.

މިތަނުގައި ސީއެސްއެސް ތަފްސީލުކޮށް ކަސްޓަމައިޒްކޮށް ދަސްކުރަން ކިޔައެއް ނުދޭނެ. އިތުރަށް ދަސްކުރަން ބޭނުންނަމަ މި ޕޭޖްގެ ތިރީގައި ހިލޭ ކިޔެވޭ ސީއެސްއެސް ކޯސްތައް ކިޔައިދީފައި ހުންނާނެ.

އެކަމަކު ކުޑަކޮށް ކަސްޓަމައިޒް ކުރެވިދާނެ. ހެޑަރސްގެ ކުލަ ބަދަލުކޮށްލެވިދާނެ ދޯ? ކުލަ ދަސްކުރުމަށް، ޚާއްސަ ކޯޑުތަކެއް ކޮމްޕިއުޓަރ ގެންގުޅޭ. މިކޯޑުތައް ފެށޭނީ `#` އިން ދެން ފަހަތަށް 6 އަކުރު (A–F) އަދި ނަމްބަރު(0–9). މިސާލަކަށް، ނޫކުލައިގެ ކޯޑަކީ0000FF `#` ގިނަ ކުލަތަކުގެ ކޯޑު ލިބޭނީ http://www.colorpicker.com. `green ` އަދި `red` ފަދަ [ޕްރީޑިފައިންޑް ކުލަތައް](http://www.w3schools.com/colors/colors_names.asp) ބޭނުންކުރެވޭނެ.

`blog/static/css/blog.css` ފައިލް އަށް ތިރީގައިވާ ކޯޑު އިތުރުކުރޭ:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #FF8833;
}

```

`h1 a` އަކީ ސީއެސްއެސް ސިލެކްޓަރ އެއް. މީގެ މާނައަކީ އަހަރެމެންގެ ސްޓައިލްތައް `h1` ތެރޭގައި ހިމެނޭ `a` ބަޔަކަށް ލަނީއޭ: `h2 a` ސިލެކްޓަރ ވެސް `h2` ގެ ބައިތަކަށް ހަމަ މިގޮތަށް ހަަދަނީ. އެހެންވީމާ `<h1><a href="">link</a></h1>` ގޮތަށް ހުންނަ ތަންތަނަށް`h1 a` ސްޓައިލް އެޕްލައިވާނެ. މިހާރު، މިބުނަނީ ކުލަ `C25100</0#> ކަޅު އޮރެންޖް ކުަލައަށް ބަދަލުކުރުމަށް. ނޫނީ އަމިއްލަޔަށް ބޭނުންވާ ކުަލައެއްވެސް ލިޔެވިދާނެ، އެކަމަކު ހުދު ބެކްގްރައުންޑެއްގައި ބޭނުންކުރީމައި ރަނގަޅަށް ފެންނަ ކުލައެއްތޯ ބަލާތި!</p>

<p>އެޗްޓީއެމްއެލްގައިވާ ބައިތަކަށް ބޭނުންވާ ސްޓްއިލްތައް ސީއެސްއެސް ފައިލް އިން ކިޔައިދޭ. ކޮންމެ އެލިމެންޓް ( ބައެއް) ވެސް ވަކިކުރަނީ އެބަޔަކަށް ކިޔާނަމުން. އެޗްޓީއެމްއެލް ސެކްޝަންއިން ޓެގްސްގެ ގޮތުގައި ހަނދާން ވެދާނެ. މިގޮތުން <code>a`، `h1` އަދި `body` އަކީ މިފަދަ ބައިތަކުގެ ނަންތައް. އެޓްރިބިއުޓު `class` ނުވަތަ އެޓްރިބިއުޓު `id<0>އިންވެސް އެލިމެންޓްއެއް ވަކިކުރެވިދާނެ. އެލިމެންޓެއްގެ ކްލާސް އަދި އައިޑީ ނަމަކީ އެމީހަކު އަމިއްލަޔަށް ދޭ ނަމެއް. ކްލާހެއްގައި ހިމެނެނީ ގުރޫޕްކުރެވިފައިވާ އެލިމެންޓްތަކެއް، އަދި އައިޑީއިން ޕޮއިންޓުކުރަނީ ވަކި ވަކި އެލިމެންޓުތަކަށް. މިސާލަކަށް، މީގައި މިވާ ޓެގުތައް ޓެގުގެ ނަމުން ވަކި ކުރެވިދާނެ <code>a`، the class `external_link`, or the id `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

އިތުރަށް ކިޔާލަން [CSS Selectors at w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

ސީއެސް އެސް އިތިރުކުރި އެޗްޓީއެމްއެލް ޓެމްޕްލޭޓް އާއި ގުޅޭގޮތުން ކިޔައިދޭން އެބަޖެހޭ. `blog/templates/blog/post_list.html` ފައިލް ކޯޑު އެޑިޓަރގައި ހުޅުވާ އަދި ފަށާބަޔަށް މިލައިން އިތުރުކުރޭ:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

މިތަނުން ލޯޑު މިކުރަނީ ހަމައެކަނި ސްޓެޓިކް ފައިލްސް :) `<head>`and`</head>` ޓެގުތަކުގެ ދޭތެރޭ އަދި ބޫޓުސްޓްރެޕް ސީއެސް އެސް ފައިލްސްގެ ލިންކު ފަހަތަށް މިލައިން އިތުރުކުރޭ:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

ބްރައުޒާއިން ނަގާނީ ފައިލްތައް ދޭ ތަރުތީބުން، އެހެންވީމާ ރަނގަޅަށް ދޭން ޔަގީންކުރަންޖެހޭ. ނޫނީ އަހަރެމެންގެ ފައިލްގެ މައްޗަށް ބޫޓްސްޓްރެޕް ފައިލް ލެވިދާނެ. އަހަރެމެންގެ ޓެމްޕްލޭޓަށް މިކިޔައިދިނީ ސީއެސްއެސް ފައިލް އިންތަން.

މިހާރު ފައިލް އިންނަންވާނީ މިހެން:

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

އޯކޭ، ފައިލް ސޭވްކޮށްފައި ސައިޓް ރީފްރެށްކޮށްލާ!

![Figure 14.2](images/color2.png)

ސަޅި: މިހާރު ކުޑަކޮށް ވެބްސައިޓް ބޮޑުކޮށްލާ އަދި ކަނާތްފަރާތުގެ މާރޖިން ބޮޑުކޮށްލަން މަސައްކަތްކޮށްލަންވީ. މިހެން ހަދަން ހިނގާ!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

ސީއެސްއެސް ފައިލް އަށް ކޯޑުކޮޅު އިތުރުކޮށްފައި ސޭވްކޮށްލީމާ މަސައްކަތްކުރޭތޯ ބަލަންވީއެންނު!

![Figure 14.3](images/margin2.png)

ހެޑަރގައި އިން ފޮންޓު ކަސްޓަމައިޒްކޮށްލަން ވީއެންނު؟ މިލައިން ޕޭޖުގެ `<head>` in `blog/templates/blog/post_list.html` file ހިމަނާލަންވީނު:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

ކުރިންވެސް ހެދި ގޮތށް، އޯރޑަރޗެކްކޮށްފައި މިލިންކު `blog/static/css/blog.css` ގެ ކުރިޔަށް އިތުރުކުރޭ. މިލައިންއިން *Lobster* ނަމުގައި އިން ފޮންޓެއް ގޫގުލް ފޮންޓް އިން އިމްޕޯރޓް ކުރާނެ. (https://www.google.com/fonts).

`blog/static/css/blog.css` ސީއެސް އެސްފައިލްގެ ޑިކްލެރޭޝަން ބްލޮކް ( ބްރެކެޓް ދޭތެރޭގައިވާ ކޯޑުތައް `{` and `}`) އިން `h1 a` ހޯދާ. ދެން `font-family: 'Lobster';` މިލައިން ބްރެކެޓްތަކުގެ ދޭތެރެއަށް އިތުރުކޮށްފައި ޕޭޖު ރިފްރެޝްކޮށްލާ:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
```

![Figure 14.3](images/font.png)

ގަދަ!

މަތީގައިވެސް ބުނިގޮތަށް، ސީއެސްއެސްގައި އިންނަނީ ކްލާސްތަކުގެ ކޮންސެޕްޓް. އެޗްޓީއެމްއެލްގެ ކޯޑުގެ ވަކިބަޔަކަށް ސްޓައިލް އެޕްލައިކުރާއިރު އަނެއް ބަޔަށް އަސަރު ނުކުރާ ގޮތަށް އެޕްލައިކުރެވޭނެ. މިއީ ވަރަށް ބޮޑު އެހީއެއް! ފަހަރެއްގައި ދެ ޑިވް އެއް އިނދެފާނެ ތަފާތު ދެކަމެއް ކުރާ ( ހެޑަރ އަދި ޕޯސްޓް ގޮތައް). ކިލާހަކުން މިދޭތި ފެންނަގޮތް ތަފާތުކުރަން އެހީތެރިވޭ.

ކުރިޔަށްގޮސް އެޗްޓީއެމްއެލްގެ ކޯޑުގެ ބައިތަކަށް ނަން ދީ. އިތުރު ކްލާސް އެއް `page-header` ޖަހާފައި `div` ހެޑަރ އެކުލެވޭ ބަޔަށް މިގޮތަށް ލާ:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

ބްލޮގް ޕޯސްޓުގެ `div` ހިމެނޭ ބަޔަށް ކްލާސް `post` އެއް އިތުރުކުރޭ.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

ދެން އެކި ސެލެކްޓަރސް އަށް ވަކިވަކި ޑެކްލެރޭޝަން ބްލޮކް ލާނީ. ފުރަތަމަ `.` އާއި ގުުޅުންހުރި ސެލެކްޓަރސް އިން ފަށާނީ. މިކޯޑުތައް ދަސްކުރުމަށް އިންޓަރނެޓުގައި ސީއެސްއެސްއާއި ގުޅުންހުރި ވަރަށްގިނަ ޓިއުޓޯރިއަލްއާއި ތަފްސީލުތައް އެބަހުރި. މިހާރަށް، `blog/static/css/blog.css` file: ކޮޕީކޮށްފައި ޕޭސްޓުކޮށްލާ:

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

ނަ ކްލާސް ޑިކްލެރޭޝަންތައް ހިމެނޭ އެޗްޓީއެމްއެލް ކޯޑުތައް ނަގާފައި، މިގޮތަށް ބަދަލުކޮށްލާ:

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

`blog/templates/blog/post_list.html` މިގޮތަށް:

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

ފައިލް ސޭވްކޮށްފައ ވެބްސައިޓް ރީފްރެޝްކޮށްލާ.

![Figure 14.4](images/final.png)

ސާބަހޭ! ރީތިދޯ? Look at the code we just pasted to find the places where we added classes in the HTML and used them in the CSS. Where would you make the change if you wanted the date to be turquoise?

Don't be afraid to tinker with this CSS a little bit and try to change some things. Playing with the CSS can help you understand what the different things are doing. If you break something, don't worry – you can always undo it!

We really recommend taking the free online courses "Basic HTML & HTML5" and "Basic CSS" on [freeCodeCamp](https://learn.freecodecamp.org/). They can help you learn all about making your websites prettier with HTML and CSS.

Ready for the next chapter?! :)