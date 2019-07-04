# Ìfihàn sí HTML

Kíni àwòṣe (template) kan, o lè béèrè?

Àwòṣe kan jẹ́ fáìlì kan tí a lè tún lò láti ṣàfihàn ìròyìn ọ̀tọ̀ọ̀tọ̀ ni àgbékalẹ̀ tó báramu kan – fún àpẹẹrẹ, o lè lo àwòṣe kan láti ràn ọ́ lọ́wọ́ lórí kíkọ lẹ́tà kan nítorí bó tilẹ̀ jẹ́ pé lẹ́tà kọ̀ọ̀kan lè ní ìròyìn ọ̀tọ̀ọ̀tọ̀ àti pé wọ́n lè jẹ́ kíkọ sí èèyàn ọ̀tọ̀ọ̀tọ̀, wọ́n máa lo àgbékalẹ̀ kannáà.

A Django template's format is described in a language called HTML (that's the HTML we mentioned in the first chapter, **How the Internet works**).

## Kíni HTML?

HTML jẹ́ kóòdù kan tí aṣàwákiri ayélujára rẹ - bíi Chrome, Firefox àbí Safari - máa túmọ̀ láti ṣàfihàn ojú-ìwé ayélujára kan fún aṣàmúlò náà.

HTML dúró fún "HyperText Markup Language". **HyperText** means it's a type of text that supports hyperlinks between pages. **Markup** means we have taken a document and marked it up with code to tell something (in this case, a browser) how to interpret the page. HTML code is built with **tags**, each one starting with `<` and ending with `>`. These tags represent markup **elements**.

## Your first template!

Creating a template means creating a template file. Everything is a file, right? You have probably noticed this already.

Templates are saved in `blog/templates/blog` directory. So first create a directory called `templates` inside your blog directory. Then create another directory called `blog` inside your templates directory:

    blog
    └───templates
        └───blog
    

(You might wonder why we need two directories both called `blog` – as you will discover later, this is a useful naming convention that makes life easier when things start to get more complicated.)

And now create a `post_list.html` file (just leave it blank for now) inside the `blog/templates/blog` directory.

See how your website looks now: http://127.0.0.1:8000/

> If you still have an error `TemplateDoesNotExist`, try to restart your server. Go to the command line, stop the server by pressing Ctrl+C (Control and C keys together) and start it again by running a `python manage.py runserver` command.

![Figure 11.1](images/step1.png)

No error anymore! Congratulations :) However, your website isn't actually publishing anything except an empty page, because your template is empty too. We need to fix that.

Open the new file in the code editor, and add the following:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

So how does your website look now? Visit it to find out: http://127.0.0.1:8000/

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

## Customize your template

You can now have a little fun and try to customize your template! Here are a few useful tags for that:

* `<h1>A heading</h1>` for your most important heading
* `<h2>A sub-heading</h2>` for a heading at the next level
* `<h3>A sub-sub-heading</h3>` …and so on, up to `<h6>`
* `<p>A paragraph of text</p>`
* `<em>text</em>` emphasizes your text
* `<strong>text</strong>` strongly emphasizes your text
* `<br>` goes to another line (you can't put anything inside br and there's no closing tag)
* `<a href="https://djangogirls.org">link</a>` creates a link
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
    

Make sure you're in the `djangogirls` directory and let's tell `git` to include all the changes in this directory:

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
    

### Pull your new code down to PythonAnywhere, and reload your web app

* Ṣí [ojú-ìwé àwọn console PythonAnywhere](https://www.pythonanywhere.com/consoles/) náà kálẹ̀ kí o lọ sí **Bash console** rẹ (tàbí bẹ̀rẹ̀ tuntun kan). Lẹ́yìn náà, ṣe:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

O máa nílò láti rọ́pò `<your-pythonanywhere-domain>` pẹ̀lú orúkọ subdomain PythonAnywhere rẹ gan-an, láìsí àwọn àkámọ́ onígun náà. Orúkọ subdomain rẹ máa n sábà jẹ́ orúkọ aṣàmúlò PythonAnywhere rẹ, ṣùgbọ́n nígbà mìíràn ó lè yàtọ̀ díè (irú bíi tí orúkọ aṣàmúlò rẹ bá ní àwọn lẹ́tà ńlá). Nítorí náà, tí àṣẹ yìí kò bá ṣiṣẹ́, lo àṣẹ `ls` (ṣàkọsílẹ̀ àwọn fáìlì) náà láti wá orúkọ subdomain/fódà rẹ gan-an, lẹ́yìn náà `cd` lọ síbẹ̀.

Now watch your code get downloaded. If you want to check that it's arrived, you can hop over to the **"Files" page** and view your code on PythonAnywhere (you can reach other PythonAnywhere pages from the menu button on the console page).

* Ní ìparí, lọ sí [ojú-ìwé "Ayélujára"](https://www.pythonanywhere.com/web_app_setup/) náà kí o sì tẹ **Reload** lórí ètò ayélujára rẹ.

Ó yẹ kí ìmúdójúìwọ̀n rẹ ti máa ṣiṣẹ́! Tẹ̀síwájú láti ṣe ìmúdójúìwọ̀n ààyè ayélujára rẹ nínú aṣàwákiri náà. Ó yẹ kí àwọn ìyípadà ti fojú hàn. :)