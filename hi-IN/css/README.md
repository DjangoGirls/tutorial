# CSS – इसे सुंदर बनाएँ!

अभी भी हमारा ब्लॉग अच्छा नहीं दिख रहा है। सही बात है ना ? इसीलिए अब समय आ गया है की हम इसे सुन्दर बनाएँ। इसके लिए हम CSS का इस्तेमाल करेंगे। 

## सीएसएस क्या है?

Cascading Style Sheets (CSS) एक भाषा है जो मार्कअप भाषा (जैसे HTML) में लिखी गई वेबसाइट के स्वरूप और फॉर्मेट का बताने के लिए प्रयोग की जाती है। इसे हमारे वेब पेज के लिए मेक-अप की तरह देखें। ;)

लेकिन हम फिर से स्क्रैच से शुरू नहीं करना चाहते हैं, है ना? एक बार और, हम इंटरनेट पर प्रोग्रामर द्वारा मुफ्त में रिलीज़ किए गए किसी चीज़ का इस्तेमाल करेंगे। पहिया का अविष्कार फिर से करना कोई खेल नहीं है, आपको पता है।

## चलिए बूटस्ट्रैप का उपयोग करें!

बूटस्ट्रैप बढ़िया वेबसाइटों के विकास के लिए सबसे लोकप्रिय HTML और CSS फ्रेमवर्कोंं से एक है: वेबसाइट: https://getbootstrap.com/

यह प्रोग्रामर द्वारा लिखे गए थे जिन्होंने ट्विटर के लिए काम किया था। अब यह दुनिया भर से स्वयंसेवकों द्वारा विकसित किया जा रहा है!

## बूटस्ट्रैप इनस्टॉल करें। 

बूटस्ट्रैप को इनस्टॉल करने के लिए, कोड एडिटर में अपनी `.html` फ़ाइल खोलें और इसे `<head>` अनुभाग से जोड़ें:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

यह आपकी परियोजना में कोई भी फाइल नहीं जोड़ता है। यह सिर्फ इंटरनेट पर मौजूद फ़ाइलों को इंगित करता है। तो आगे बढ़ें, अपनी वेबसाइट खोलें और पेज रीफ्रेश करें। यह रहा!

![Figure 14.1](images/bootstrap1.png)

पहले से ही अच्छे दिख रहा हैं!

## Django में static फ़ाइलें

आखिरकार हम इन चीजों पर नज़र डालेंगे जिन्हें हम **static files** कह रहे हैं। स्टेटिक फाइलें हमारी सभी CSS और images हैं। उनकी सामग्री अनुरोध संदर्भ पर निर्भर नहीं है और प्रत्येक उपयोगकर्ता के लिए समान होगी।

### Django के लिए Static Files कहाँ रखें । 

Django पहले से ही जानता है कि अंत: निर्मित "admin" ऐप के लिए स्टेटिक फ़ाइलों को कहाँ खोजें। अब हमें अपने `blog` ऐप के लिए कुछ स्टेटिक फाइलों को जोड़ने की जरूरत है।

हम ब्लॉग ऐप के अंदर `static` नामक फ़ोल्डर बनाकर ऐसा करते हैं:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Django स्वचालित रूप से आपके किसी भी ऐप के फ़ोल्डर्स के अंदर "static" नामक किसी भी फ़ोल्डर को ढूंढ लेगा। फिर यह स्टेटिक सामग्री के रूप में उनका उपयोग करने में सक्षम हो जाएगा।

## आपकी पहली CSS फ़ाइल!

चलिए अपने वेब पेज पर अपनी शैली जोड़ने के लिए अब एक CSS फ़ाइल बनाएँँ। अपनी `static` डायरेक्टरी के अंदर `css` नामक एक नई डायरेक्टरी बनाएँँ। फिर इस `css` डायरेक्टरी के अंदर `blog.css` नामक एक नई फ़ाइल बनाएँँ। तैयार?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

कुछ CSS! लिखने का समय आ गया। अपने कोड एडिटर में `blog/static/css/blog.css` फ़ाइल खोलें

हम यहाँँ CSS के बारे में अनुकूलित करने(customizing) और सीखने में बहुत गहरा नहीं जाएँगे। यदि आप और जानना चाहते हैं तो इस पृष्ठ के अंत में एक मुफ्त CSS पाठ्यक्रम की संस्तुति है।

लेकिन चलिए कम से कम थोड़ा करते हैं। शायद हम अपने हेडर का रंग बदल सकें? रंगों को समझने के लिए, कंप्यूटर विशेष कोड का उपयोग करते हैं। ये कोड `#` के बाद 6 अक्षर (A–F) और संख्याएँ (0-9) के साथ शुरू होते हैं। उदाहरण के लिए, नीले रंग का कोड `#0000FF` है। आप http://www.colorpicker.com/ पर कई रंगों के लिए रंग कोड पा सकते हैं। आप [पूर्वनिर्धारित रंग](http://www.w3schools.com/colors/colors_names.asp) का भी उपयोग कर सकते हैं, जैसे कि `लाल` और `हरा`।

आपको `blog/static/css/blog.css` फ़ाइल में निम्न कोड जोड़ना चाहिए:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #FF8833;
}

```

`h1 a` एक CSS Selector है। This means we're applying our styles to any `a` element inside of an `h1` element; the `h2 a` selector does the same thing for `h2` elements. So when we have something like `<h1><a href="">link</a></h1>`, the `h1 a` style will apply. In this case, we're telling it to change its color to `#C25100`, which is a dark orange. Or you can put your own color here, but make sure it has good contrast against a white background!

In a CSS file we determine styles for elements in the HTML file. The first way we identify elements is with the element name. You might remember these as tags from the HTML section. Things like `a`, `h1`, and `body` are all examples of element names. We also identify elements by the attribute `class` or the attribute `id`. Class and id are names you give the element by yourself. Classes define groups of elements, and ids point to specific elements. For example, you could identify the following tag by using the tag name `a`, the class `external_link`, or the id `link_to_wiki_page`:

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

Your file should now look like this:

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

OK, save the file and refresh the site!

![Figure 14.2](images/color2.png)

Nice work! Maybe we would also like to give our website a little air and increase the margin on the left side? Let's try this!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Add that to your CSS, save the file and see how it works!

![Figure 14.3](images/margin2.png)

Maybe we can customize the font in our header? Paste this into your `<head>` in `blog/templates/blog/post_list.html` file:

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
                    <h2><a href="">{{ post.title }}</a></h2>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
```

Save those files and refresh your website.

![Figure 14.4](images/final.png)

Woohoo! Looks awesome, right? Look at the code we just pasted to find the places where we added classes in the HTML and used them in the CSS. Where would you make the change if you wanted the date to be turquoise?

Don't be afraid to tinker with this CSS a little bit and try to change some things. Playing with the CSS can help you understand what the different things are doing. If you break something, don't worry – you can always undo it!

We really recommend taking the free online courses "Basic HTML & HTML5" and "Basic CSS" on [freeCodeCamp](https://learn.freecodecamp.org/). They can help you learn all about making your websites prettier with HTML and CSS.

Ready for the next chapter?! :)