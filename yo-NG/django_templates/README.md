# Àwọn àwòṣe (template) Django

Àkókò láti ṣàfihàn àwọn dátà kan! Django fún wa ní **àwọn àmì àwòṣe** (template tags) tó wúlò fún ìyẹn.

## Kíni àwọn àmì àwòṣe?

Wòó, nínú HTML, ìwọ kò lè kọ kóòdù Python, nítorí pé àwọn aṣàwákiri kò loye rẹ̀. Wọ́n mọ HTML nìkan. A sì mọ̀ pé HTML má n wà lójú kan, nígbà tí Python má n ṣiṣẹ́.

**Àwọn àmì àwòṣe Django** fún wa láàyè láti gbé àwọn nnkan tó jẹ́ mọ́ Python sínú HTML, kó o bàa lè yára kọ́ àwọn ààyè ayélujára tó n ṣiṣẹ́. Ó dára!

## Ṣàfihàn àwòṣe àkójọ àròkọ

Nínú àkòrí tó ṣáájú náà, a fún àwòṣe wa ní àkójọ àwọn àròkọ kan nínú variable `posts` náà. Ní báyìí, a ó ṣàfihàn rẹ̀ nínú HTML.

Láti ṣàtẹ̀jáde variable kan nínú àwọn àwòṣe Django, a ma lo àkámọ́ onídodo méjì pẹ̀lú orúkọ variable náà nínú rẹ̀, báyìí:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Gbìyànjú èyí nínú àwòṣe `blog/templates/blog/post_list.html` rẹ. Ṣí i sílẹ̀ nínú olóòtú kóòdù náà, kí o sì rọ́pò gbogbo nnkan láti `<div>` kejì sí `</div>` kẹta pẹ̀lú `{{ posts }}`. Tọ́jú fáìlì náà, kí o sì ṣe ìmúdójúìwọ̀n ojú-ìwé náà láti rí àbájáde náà:

![Figure 13.1](images/step1.png)

Gẹ́gẹ́ bó o ṣe ríi, gbogbo ohun tí a ní ni èyí:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Èyí túmọ̀ sí pé Django lóye rẹ̀ gẹ́gẹ́ bí àkójọ àwọn ohun-èlò kan. Rántí láti **Ìfihàn sí Python** bí a ṣe lè ṣàfihàn àwọn àkójọ? Bẹ́ẹ̀ni, pẹ̀lú for loops! Nínú àwòṣe Django kan, wàá ṣe wọ́n báyìí:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Gbìyànjú èyí nínú àwòṣe rẹ.

![Figure 13.2](images/step2.png)

Ó n ṣiṣẹ́! But we want the posts to be displayed like the static posts we created earlier in the **Introduction to HTML** chapter. You can mix HTML and template tags. Our `body` will look like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
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
```

{% raw %}Everything you put between `{% for %}` and `{% endfor %}` will be repeated for each object in the list. Refresh your page:{% endraw %}

![Figure 13.3](images/step3.png)

Have you noticed that we used a slightly different notation this time (`{{ post.title }}` or `{{ post.text }}`)? We are accessing data in each of the fields defined in our `Post` model. Also, the `|linebreaksbr` is piping the posts' text through a filter to convert line-breaks into paragraphs.

## One more thing

It'd be good to see if your website will still be working on the public Internet, right? Let's try deploying to PythonAnywhere again. Here's a recap of the steps…

* Lákọ̀ọ́kọ́, ti kóòdù rẹ sí GitHub

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* Lẹ́yìn náà, wọlé padà sí [PythonAnywhere](https://www.pythonanywhere.com/consoles/) kí o lọ sí **Bash console** rẹ (tàbí bẹ̀rẹ̀ tuntun kan), àti ṣe:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd <your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Rántí láti rọ́pò `<your-pythonanywhere-domain>` pẹ̀lú subdomain PythonAnywhere rẹ, láìsí àwọn àkámọ́ onígun náà.)

* Ní ìparí, lọ sí [ojú-ìwé "Ayélujára"](https://www.pythonanywhere.com/web_app_setup/) náà kí o sì tẹ **Reload** lórí ètò ayélujára rẹ. (To reach other PythonAnywhere pages from the console, use the menu button in the upper right corner.) Your update should be live on https://subdomain.pythonanywhere.com -- check it out in the browser! If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. The databases on your local computer and Python Anywhere don't sync with the rest of your files.

Kú oríire! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://subdomain.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![Figure 13.4](images/donut.png)