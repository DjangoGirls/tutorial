# Вступ до HTML

Ви можете запитати, що таке шаблон?

A template is a file that we can re-use to present different information in a consistent format – for example, you could use a template to help you write a letter because although each letter might contain a different message and be addressed to a different person, they will share the same format.

A Django template's format is described in a language called HTML (that's the HTML we mentioned in the first chapter, **How the Internet works**).

## Що таке HTML?

HTML is a code that is interpreted by your web browser – such as Chrome, Firefox or Safari – to display a web page for the user.

HTML розшифровується як "Мова розмітки гіпертексту". **Гіпертекст** означає тип тексту, який підтримує гіперпосилання між сторінками. **Markup** (розмітка) означає, що ми отримали документ із розміченим кодом для того, щоб повідомити дещо (у даному випадку, браузер) як треба інтерпретувати сторінку. HTML код побудований за допомогою **тегів**, кожен з яких починається із `<` і закінчується `>`. Теги представляють **елементи розмітки**.

## Ваш перший шаблон!

Під створенням шаблону мається на увазі створення файлу шаблону. Будь-що є файлом, чи не так? Ви, напевно, це вже зауважили.

Шаблони зберігаються в папці `blog/templates/blog`. Отже, спершу створіть папку із назвою `templates` всередині вашої папки blog. Далі створіть іншу папку із назвою `blog` всередині вашої папки templates:

    blog
    └───templates
        └───blog
    

(You might wonder why we need two directories both called `blog` – as you will discover later, this is a useful naming convention that makes life easier when things start to get more complicated.)

А тепер створіть файл `post_list.html` (просто залиште його поки що пустим) всередині папки `blog/templates/blog`.

Погляньте як тепер виглядає ваш веб сайт: http://127.0.0.1:8000/

> If you still have an error `TemplateDoesNotExist`, try to restart your server. Go to the command line, stop the server by pressing Ctrl+C (Control and C keys together) and start it again by running a `python manage.py runserver` command.

![Рисунок 11.1](images/step1.png)

No error anymore! Congratulations! :) However, your website isn't actually publishing anything except an empty page, because your template is empty too. We need to fix that.

Open the new file in the code editor, and add the following:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<!DOCTYPE html>
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

So how does your website look now? Visit it to find out: http://127.0.0.1:8000/

![Рисунок 11.2](images/step3.png)

It worked. Nice work there! :)

* The line `<!DOCTYPE html>` is not a HTML tag. It only declares the document type. Here, it informs the browser that document type is [HTML5](https://html.spec.whatwg.org/#the-doctype). This is always the beginning of any HTML5 file.
* The most basic tag, `<html>`, is always the beginning of html content and `</html>` is always the end. As you can see, the whole content of the website goes between the beginning tag `<html>` and closing tag `</html>`
* `<p>` is a tag for paragraph elements; `</p>` closes each paragraph

## Head and body

Кожну сторінку HTML також можна поділити на два елементи: **head** - (голова) і **body** - (тіло.

* **head** - елемент, що містить інформацію про документ, яка не відображається на екрані.

* **body** - елемент, що містить усе інше, що відображається як частина веб сторінки.

Ми використовуємо `<head>` щоб повідомити браузер про конфігурацію сторінки, а `<body>` щоб повідомити браузер, що у дійсності знаходиться на сторінці.

For example, you can put a web page title element inside the `<head>`, like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<!DOCTYPE html>
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

Збережіть файл і перезавантажте вашу сторінку.

![Рисунок 11.3](images/step4.png)

Зауважте як браузер зрозумів , що "Ola's blog" це заголовок вашої сторінки? Він інтерпретував `<title>Ola's blog</title>` і розмістив текст у рядку заголовка вашого браузера (він також буде використаний для закладок чи інших речей).

Можливо, ви також зауважили, що кожен відкриваючий тег відповідає *закриваючому тегу*, із `/`, і ці елементи є *вкладеними* (тобто ви не можете закрити окремий тег поки усі теги, що містяться всередині не будуть також закриті).

Це щось на кшталт як покласти речі всередину ящиків. У вас є один великий ящик, `<html></html>`; всередині цього ящика є `<body></body>`, що містить ще менші ящики: `<p></p>`.

You need to follow these rules of *closing* tags, and of *nesting* elements – if you don't, the browser may not be able to interpret them properly and your page will display incorrectly.

## Налаштуйте ваш шаблон

А тепер можете трохи побавитися і спробувати налаштувати ваш шаблон! Тут наведено декілька корисних тегів для цього:

* `<h1>A heading</h1>` for your most important heading
* `<h2>Підзаголовок</h2>` для заголовків наступного рівня
* `<h3>A sub-sub-heading</h3>` …and so on, up to `<h6>`
* `<p>A paragraph of text</p>`
* `<em>текст</em>` робить акцент на вашому тексті
* `<strong>текст</strong>` робить сильний акцент на вашому тексті
* `<br>` goes to another line (you can't put anything inside br and there's no closing tag)
* `<a href="https://djangogirls.org">link</a>` створює посилання
* `<ul><li>перший елемент</li><li>другий елемент</li></ul>` створює список, такий як цей!
* `<div></div>` визначає блок сторінки
* `<nav></nav>` defines a set of navigation links
* `<article></article>` specifies independent, self-contained content
* `<section></section>` defines a section in a document
* `<header></header>` specifies a header for a document or section
* `<main></main>` specifies the main content of a document
* `<aside></aside>` defines some content aside from the content it is placed in (like a sidebar)
* `<footer></footer>` defines a footer for a document or section
* `<time></time>` defines a specific time (or datetime)

Here's an example of a full template, copy and paste it into `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<!DOCTYPE html>
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <header>
            <h1><a href="/">Django Girls Blog</a></h1>
        </header>

        <article>
            <time>published: 14.06.2014, 12:14</time>
            <h2><a href="">My first post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </article>

        <article>
            <time>published: 14.06.2014, 12:14</time>
            <h2><a href="">My second post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </article>
    </body>
</html>
```

We've created one `header` section and two `article` section here.

* The `header` element contains the title of our blog – it's a heading and a link
* Another two `article` elements contain our blog posts with a published date in `time` element, `h2` with a post title that is clickable and a `p` (paragraph) of text for our blog post.

Отримуємо наступний ефект:

![Рисунок 11.4](images/step6.png)

Йой! But so far, our template only ever displays exactly **the same information** – whereas earlier we were talking about templates as allowing us to display **different** information in the **same format**.

What we really want to do is display real posts added in our Django admin – and that's where we're going next.

## Ще одна річ: розгортання!

Було б добре побачити все це в Інтернеті, правда? Давайте зробимо ще одне розгортання на PythonAnywhere:

### Commit, and push your code up to GitHub

По-перше, давайте подивимося які файли були змінені після розгортання (виконайте ці команди локально, не на PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Make sure you're in the `djangogirls` directory and let's tell `git` to include all the changes in this directory:

{% filename %}command-line{% endfilename %}

    $ git add .
    

Перед тим як завантажити усі файли, давайте перевіримо що ж буде завантажувати `git` (усі файли, які буде завантажувати `git` повинні тепер з'явитися і бути позначеними зеленим кольором):

{% filename %}command-line{% endfilename %}

    $ git status
    

Майже на місці, а тепер час повідомити йому про те, що треба зберегти ці зміни в його історії. Ми збираємося задати "commit message" що ж ми змінили. На цьому етапі можна набрати будь-що, що вважатимете за потрібне, однак, має сенс надрукувати щось дійсно зрозуміле, щоб, таким чином, ви могли згадати що ви зробили у майбутньому.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Changed the HTML for the site."
    

> **Note** Make sure you use double quotes around the commit message.

Once we've done that, we upload (push) our changes up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Завантаження (pull) нового коду на PythonAnywhere і перезапуск веб-додатку

* Відкрийте [сторінку з терміналами на PythonAnywhere](https://www.pythonanywhere.com/consoles/) і переключіться на вже запущений **Bash термінал** (або запустіть новий). Далі, наберіть команди:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

You'll need to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain name, without the angle-brackets. Your subdomain name is normally your PythonAnywhere user name, but in some cases it might be a bit different (such as if your user name contains capital letters). So if this command doesn't work, use the `ls` (list files) command to find your actual subdomain/folder name, and then `cd` to there.

Now watch your code get downloaded. If you want to check that it's arrived, you can hop over to the **"Files" page** and view your code on PythonAnywhere (you can reach other PythonAnywhere pages from the menu button on the console page).

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app.

Your update should be live! Go ahead and refresh your website in the browser. Changes should be visible. :)