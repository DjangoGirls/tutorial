# Ìfihàn sí HTML

Kíni àwòṣe (template) kan, o lè béèrè?

Àwòṣe kan jẹ́ fáìlì kan tí a lè tún lò láti ṣàfihàn ìròyìn ọ̀tọ̀ọ̀tọ̀ ni àgbékalẹ̀ tó báramu kan – fún àpẹẹrẹ, o lè lo àwòṣe kan láti ràn ọ́ lọ́wọ́ lórí kíkọ lẹ́tà kan nítorí bó tilẹ̀ jẹ́ pé lẹ́tà kọ̀ọ̀kan lè ní ìròyìn ọ̀tọ̀ọ̀tọ̀ àti pé wọ́n lè jẹ́ kíkọ sí èèyàn ọ̀tọ̀ọ̀tọ̀, wọ́n máa lo àgbékalẹ̀ kannáà.

A Django template's format is described in a language called HTML (that's the HTML we mentioned in the first chapter, **How the Internet works**).

## Kíni HTML?

HTML jẹ́ kóòdù kan tí aṣàwákiri ayélujára rẹ - bíi Chrome, Firefox àbí Safari - máa túmọ̀ láti ṣàfihàn ojú-ìwé ayélujára kan fún aṣàmúlò náà.

HTML dúró fún "HyperText Markup Language". **HyperText** túmọ̀ sí pé ó jẹ́ irú ọ̀rọ̀ kan tó n ṣàtìlẹ́yìn fún àwọn ọ̀rọ̀-atọ̀ka láàrín àwọn ojú-ìwé. **Markup** means we have taken a document and marked it up with code to tell something (in this case, a browser) how to interpret the page. HTML code is built with **tags**, each one starting with `<` and ending with `>`. These tags represent markup **elements**.

## Àwòṣe àkọ́kọ́ rẹ!

Ṣíṣẹ̀dá àwòṣe kan túmọ̀ sí ṣíṣẹ̀dá fáìlì àwòṣe kan. Gbogbo nnkan ni fáìlì kan, àbí bẹ́ẹ̀ kọ? Ó ṣeéṣe kí o ti ṣàkíyèsí èyí tẹ́lẹ̀.

A máa n tọ́jú àwọn àwòṣe sínú àkójọpọ̀ fáìlì `blog/templates/blog`. Nítorí náà, kọ́kọ́ ṣẹ̀dá àkójọpọ̀ fáìlì kan tí a n pè ní `templates` sínú àkójọpọ̀ fáìlì blog rẹ. Lẹ́yìn náà, ṣẹ̀dá àkójọpọ̀ fáìlì mìíràn tí a n pè ní `blog` sínú àkójọpọ̀ fáìlì àwọn àwòṣe rẹ:

    blog
    └───templates
        └───blog
    

(You might wonder why we need two directories both called `blog` – as you will discover later, this is a useful naming convention that makes life easier when things start to get more complicated.)

And now create a `post_list.html` file (just leave it blank for now) inside the `blog/templates/blog` directory.

Wo bí ààyè ayélujára rẹ ṣe rí ní báyìí: http://127.0.0.1:8000/

> Tí o bá ṣì ní àṣìṣe kan `TemplateDoesNotExist`, gbìyànjú láti tún server rẹ bẹ̀rẹ̀. Lọ sí ìlà ìpàṣẹ náà, dá server náà dúró nípasẹ̀ títẹ Ctrl+C (àwọn bọ́tìnnì Control àti C papọ̀) kí o sì bẹ̀rẹ̀ rẹ̀ padà nípasẹ̀ lílo àṣẹ `python manage.py runserver` kan.

![Figure 11.1](images/step1.png)

Kò sí àsìṣe mọ́! Kú oríire :) Àmọ́ o, ààyè ayélujára rẹ kò fi bẹ́ẹ̀ ṣàtẹ̀jáde nnkan kan yàtọ̀ sí ojú-ìwé òfìfo kan, nítorí pé àwòṣe rẹ wà ní òfìfo pẹ̀lú. A nílò láti ṣàtúnṣe ìyẹn.

Ṣí fáìlì tuntun náà nínú olóòtú kóòdù náà, kí o sì ṣàfikún èyí tó tẹ̀le yìí:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

Báwo wá ni ààyè ayélujára rẹ ṣe rí ní báyìí? Ṣàbẹ̀wò rẹ láti wádìí: http://127.0.0.1:8000/

![Figure 11.2](images/step3.png)

It worked! Nice work there :)

* The most basic tag, `<html>`, is always the beginning of any web page and `</html>` is always the end. As you can see, the whole content of the website goes between the beginning tag `<html>` and closing tag `</html>`
* `<p>` is a tag for paragraph elements; `</p>` closes each paragraph

## Head and body

Each HTML page is also divided into two elements: **head** and **body**.

* **head** is an element that contains information about the document that is not displayed on the screen.

* **body** is an element that contains everything else that is displayed as part of the web page.

We use `<head>` to tell the browser about the configuration of the page, and `<body>` to tell it what's actually on the page.

For example, you can put a web page title element inside the `<head>`, like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Ola's blog</title>
    </head>
    <body>
        <p>Hi there!</p>
        <p>It works!</p>
    </body>
</html>
```

Save the file and refresh your page.

![Figure 11.3](images/step4.png)

Notice how the browser has understood that "Ola's blog" is the title of your page? It has interpreted `<title>Ola's blog</title>` and placed the text in the title bar of your browser (it will also be used for bookmarks and so on).

Probably you have also noticed that each opening tag is matched by a *closing tag*, with a `/`, and that elements are *nested* (i.e. you can't close a particular tag until all the ones that were inside it have been closed too).

It's like putting things into boxes. You have one big box, `<html></html>`; inside it there is `<body></body>`, and that contains still smaller boxes: `<p></p>`.

You need to follow these rules of *closing* tags, and of *nesting* elements – if you don't, the browser may not be able to interpret them properly and your page will display incorrectly.

## Ṣe àwòṣe rẹ bí o ṣe fẹ́

O lè wá ṣeré díẹ̀ báyìí kí o gbìyànjú láti ṣe àwòṣe rẹ bí o ṣe fẹ́! Díẹ lára àwọn àmì tó wúlò fún ìyẹn nìyí:

* `<h1>Àkọsórí kan</h1>` fún àkọsórí rẹ tó ṣe pàtàkì jù
* `<h2>Ìsọ̀rí orí ọ̀rọ̀ kan</h2>` fún àkọsórí kan ní ìpele tó kàn
* `<h3>Ìsọ̀rí lábẹ́ ìsọ̀rí orí ọ̀rọ̀ kan</h3>` …àti bẹ́ẹ̀ bẹ́ẹ̀ lọ, títí dé `<h6>`
* `<p>Ìpínrọ̀ ọ̀rọ̀ kan</p>`
* `<em>ọ̀rọ̀</em>` yíò ṣàgbéyọ ọ̀rọ̀ rẹ pẹ̀lú lẹ́tà tó dagun
* `<strong>ọ̀rọ̀</strong>` yíò ṣàgbéyọ ọ̀rọ̀ rẹ pẹ̀lú lẹ́tà tó nípọn
* `<br>` yíò lọ sí ìlà mìíràn (o kò lè fi nnkan kan sínú br àti pé kò sí àmì ìparí)
* `<a href="https://djangogirls.org">atọ́ka</a>` yíò ṣẹ̀dá atọ́ka kan
* `<ul><li>first item</li><li>second item</li></ul>` makes a list, just like this one!
* `<div></div>` defines a section of the page

Here's an example of a full template, copy and paste it into `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <div>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My first post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My second post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </div>
    </body>
</html>
```

A ti ṣẹ̀dá àwọn abala `div` mẹ́ta níbí.

* Element `div` àkọ́kọ́ náà kó àkọlé blog wa sínú – ó jẹ́ àkọsórí kan àti atọ́ka kan
* Another two `div` elements contain our blog posts with a published date, `h2` with a post title that is clickable and two `p`s (paragraph) of text, one for the date and one for our blog post.

It gives us this effect:

![Figure 11.4](images/step6.png)

Yaaay! But so far, our template only ever displays exactly **the same information** – whereas earlier we were talking about templates as allowing us to display **different** information in the **same format**.

What we really want to do is display real posts added in our Django admin – and that's where we're going next.

## Ó ṣì ku nnkan kan: ṣàgbékalẹ̀!

Yóò dára láti rí pé gbogbo èyí n ṣiṣẹ́ lórí Íńtánẹ́ẹ̀tì náà, àbí bẹ́ẹ̀ kọ? Jẹ́ ká ṣe àgbékalẹ̀ sí PythonAnywhere mìíràn:

### Commit, and push your code up to GitHub

First off, let's see what files have changed since we last deployed (run these commands locally, not on PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Ri dájú pé o wà nínú àkójọpọ̀ fáìlì `djangogirls` náà kí a sì sọ fún `git` láti ṣàfikún gbogbo àwọn ìyípadà tó wà nínú àkójọpọ̀ fáìlì yìí:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    

> **Note** `--all` means that `git` will also recognize if you've deleted files (by default, it only recognizes new/modified files). Also remember (from chapter 3) that `.` means the current directory.

Before we upload all the files, let's check what `git` will be uploading (all the files that `git` will upload should now appear in green):

{% filename %}command-line{% endfilename %}

    $ git status
    

We're almost there, now it's time to tell it to save this change in its history. We're going to give it a "commit message" where we describe what we've changed. You can type anything you'd like at this stage, but it's helpful to type something descriptive so that you can remember what you've done in the future.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Changed the HTML for the site."
    

> **Note** Make sure you use double quotes around the commit message.

Once we've done that, we upload (push) our changes up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Fa kóòdù tuntun rẹ sí PythonAnywhere, kí o sì ṣe ìmúdójúìwọ̀n ètò ayélujára rẹ

* Ṣí [ojú-ìwé àwọn console PythonAnywhere](https://www.pythonanywhere.com/consoles/) náà kálẹ̀ kí o lọ sí **Bash console** rẹ (tàbí bẹ̀rẹ̀ tuntun kan). Lẹ́yìn náà, ṣe:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

O máa nílò láti rọ́pò `<your-pythonanywhere-domain>` pẹ̀lú orúkọ subdomain PythonAnywhere rẹ gan-an, láìsí àwọn àkámọ́ onígun náà. Orúkọ subdomain rẹ máa n sábà jẹ́ orúkọ aṣàmúlò PythonAnywhere rẹ, ṣùgbọ́n nígbà mìíràn ó lè yàtọ̀ díè (irú bíi tí orúkọ aṣàmúlò rẹ bá ní àwọn lẹ́tà ńlá). Nítorí náà, tí àṣẹ yìí kò bá ṣiṣẹ́, lo àṣẹ `ls` (ṣàkọsílẹ̀ àwọn fáìlì) náà láti wá orúkọ subdomain/fódà rẹ gan-an, lẹ́yìn náà `cd` lọ síbẹ̀.

Ní báyìí, wo bí kóòdù rẹ ṣe n gba gbígbà. Tí o bá fẹ́ ṣàyẹ̀wò bóyá ó ti dé, o lè lọ sí **ojú-ìwé "Àwọn fáìlì"** náà kí o sì wo kóòdù rẹ lórí PythonAnywhere (o lè dé àwọn ojú-ìwé PythonAnywhere mìíràn láti bọ́tìnnì àkójọ àṣàyàn lórí ojú-ìwé console náà).

* Ní ìparí, lọ sí [ojú-ìwé "Ayélujára"](https://www.pythonanywhere.com/web_app_setup/) náà kí o sì tẹ **Reload** lórí ètò ayélujára rẹ.

Ó yẹ kí ìmúdójúìwọ̀n rẹ ti máa ṣiṣẹ́! Tẹ̀síwájú láti ṣe ìmúdójúìwọ̀n ààyè ayélujára rẹ nínú aṣàwákiri náà. Ó yẹ kí àwọn ìyípadà ti fojú hàn. :)