# CSS – בואו נעשה את זה יפה!

הבלוג שלנו עדיין נראה די מכוער, לא? הגיע הזמן לגרום לו להראות טוב! בשביל זה, נשתמש ב-CSS.

## מה זה CSS?

CSS (Cascading Style Sheets, או בעברית - גליונות סגנון מדורגים) היא שפה המשמשת לתאר את המראה והעיצוב של אתר הכתוב בשפת markup (כמו HTML). תחשבו על זה כמו על איפור לדף אינטרנט שלנו. ;)

אבל לא נרצה להתחיל את הכל מחדש, נכון? שוב פעם, נשתמש במשהו ששוחרר באינטרנט בחינם. להמציא את הגלגל זה לא כיף.

## בואי נשתמש ב-Bootstrap!

Bootstrap היא אחת מחבילות ה-HTML ו-CSS הפופולריות ביותר ליצירה של אתרים יפים: https://getbootstrap.com/

היא נכתבה על ידי מתכנתות.ים שעבדו בטוויטר, ועכשיו היא מפותחת ומתוחזקת על ידי מתנדבים מכל העולם!

## התקנת Bootstrap

כדי להתקין את Bootstrap, עלינו לפתוח את קובץ ה`.html` בעורך הקוד ולהוסיף את זה לחלק ה`<head>`.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

זה לא מוסיף קבצים לפרויקט שלך; זה פשוט מצביע לקבצים קיימים באינטרנט. אז פשוט לכו על זה, תפתחו את הדפדפן, תרעננו את העמוד, והנה!

![תמונה 14.1](images/bootstrap1.png)

זה כבר נראה טוב יותר!

## קבצים סטטיים ב Django

סוף-סוף אנחנו יכולים להתעמק במה שנקרא **קבצים סטטיים** (או בעברית, קבועים). קבצים סטטיים הם כל התמונות וקבצי הCSS. Their content doesn't depend on the request context and will be the same for every user.

### איפה לשים קבצים סטטיים בג'נגו

Django already knows where to find the static files for the built-in "admin" app. Now we need to add some static files for our own app, `blog`.

נעשה זאת על ידי יצירה של קובץ בשם `static` בתיקייה של האפליקציה שלנו:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Django ימצא באופן אוטומטי את כל התיקיות בשם "static" בתוך כל אחת מהתיקיות של האפליקציה. ואז הוא יוכל להשתמש בתוכן שלהם כקבצים סטטיים.

## קובץ ה-CSS הראשון שלך!

בואו ניצור קובץ CSS עכשיו, כדי להוסיף את סטייל אישי לעמוד. תייצרי תיקייה חדשה בשם `css` בתוך תיקייה ה-`static` שלך. עכשיו, תייצרי קובץ חדש בשם `blog.css` בתוך תיקיית ה-`css`. Ready?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

הגיע הזמן לכתוב קצת CSS! תפתחי את הקובץ `blog/static/css/blog.css` בעורך הקוד שלך.

We won't be going too deep into customizing and learning about CSS here. There is a recommendation for a free CSS course at the end of this page if you would like to learn more.

אבל בואי נלמד לפחות קצת. Maybe we could change the color of our headers? כדי להבין צבעים, מחשבים משתמשים בקידודים מיוחדים. These codes start with `#` followed by 6 letters (A–F) and numbers (0–9). For example, the code for blue is `#0000FF`. You can find the color codes for many colors here: http://www.colorpicker.com/. את גם יכולה להשתמש ב[צבעים מוגדרים מראש](http://www.w3schools.com/colors/colors_names.asp) עם שמות ידועים, כמו `red` ו-`green`.

בקובץ `blog/static/css/blog.css` שלך, הוסיפי את השורות הבאות:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #FF8833;
}

```

`h1` הוא מה שנקרא CSS Selector (או בעברית, בורר CSS). This means we're applying our styles to any `a` element inside of an `h1` element; the `h2 a` selector does the same thing for `h2` elements. So when we have something like `<h1><a href="">link</a></h1>`, the `h1 a` style will apply. In this case, we're telling it to change its color to `#C25100`, which is a dark orange. Or you can put your own color here, but make sure it has good contrast against a white background!

בקובץ ה-CSS אנחנו בוחרים עיצוב לתגיות המופיעות בקובץ ה-HTML. The first way we identify elements is with the element name. You might remember these as tags from the HTML section. Things like `a`, `h1`, and `body` are all examples of element names. We also identify elements by the attribute `class` or the attribute `id`. המאפיינים class ו-id מוסיפים לתגיות שלך שמות שאת בוחרת בעצמך. מאפייני class מגדירים קבוצות (מחלקות) של תגיות, ומאפייני id מייחדים תגיות מסוימות. For example, you could identify the following tag by using the tag name `a`, the class `external_link`, or the id `link_to_wiki_page`:

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

The browser reads the files in the order they're given, so we need to make sure this is in the right place. Otherwise the code in our file may be overriden by code in Bootstrap files. הרגע גילינו לתבנית שלנו איפה נמצא קובץ ה-CSS שלנו.

בשלב הזה, הקובץ שלך צריך להיראות בערך כך:

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

אחלה, תשמרי את הקובץ ותרענני את העמוד!

![תמונה 14.2](images/color2.png)

עבודה טובה! אולי עכשיו נוסיף לאתר שלנו קצת אוויר, ונגדיל את הרווח מצד שמאל? בואי ננסה!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Add that to your CSS, save the file and see how it works!

![תמונה 14.3](images/margin2.png)

אולי אנחנו יכולים לשנות קצת את הגופן בכותרות שלנו? תעתיקי לתוך ה-`<head>` של קובץ ה-0>blog/templates/blog/post_list.html</code> שלך את השורות הבאות:

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

![תמונה 14.3](images/font.png)

מגניב!

As mentioned above, CSS has a concept of classes. These allow you to name a part of the HTML code and apply styles only to this part, without affecting other parts. This can be super helpful! Maybe you have two divs that are doing something different (like your header and your post). A class can help you make them look different.

יאללה, נסי לתת שמות לחתיכות קוד HTML. הוסיפי מאפיין class עם הערך `page-header` ל-`div` שמכיל את הכותרת שלך, ככה:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

ועכשיו תוסיפי מאפיין class בשם `post` ל-`div` שלך שמכיל את גוף ההודעה.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

עכשיו נוסיף עיצוב למחלקות השונות שהגדרנו. סלקטורים המתחילים ב-`.` (נקודה) מתאימים למאפייני class. There are many great tutorials and explanations about CSS on the Web that can help you understand the following code. For now, copy and paste it into your `blog/static/css/blog.css` file:

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

ואז תוסיפי את מאפייני ה-class לקוד ה-HTML שלך, שמציג את הפוסטים בבלוג. תחליפי את זה:

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

בקובץ ה-`blog/templates/blog/post_list.html` שלך בזה:

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

שמרו את הקבצים האלו ותרעננו את האתר.

![תמונה 14.4](images/final.png)

ווהו! נראה מדהים, נכון? Look at the code we just pasted to find the places where we added classes in the HTML and used them in the CSS. Where would you make the change if you wanted the date to be turquoise?

Don't be afraid to tinker with this CSS a little bit and try to change some things. Playing with the CSS can help you understand what the different things are doing. If you break something, don't worry – you can always undo it!

We really recommend taking the free online courses "Basic HTML & HTML5" and "Basic CSS" on [freeCodeCamp](https://learn.freecodecamp.org/). They can help you learn all about making your websites prettier with HTML and CSS.

מוכנה לפרק הבא?! :)