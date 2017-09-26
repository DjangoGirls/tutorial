# Вступ до HTML

Ви можете запитати, що таке шаблон?

A template is a file that we can re-use to present different information in a consistent format – for example, you could use a template to help you write a letter, because although each letter might contain a different message and be addressed to a different person, they will share the same format.

A Django template's format is described in a language called HTML (that's the HTML we mentioned in the first chapter, **How the Internet works**).

## Що таке HTML?

HTML is a simple code that is interpreted by your web browser – such as Chrome, Firefox or Safari – to display a web page for the user.

HTML розшифровується як "Мова розмітки гіпертексту". **Гіпертекст** означає тип тексту, який підтримує гіперпосилання між сторінками. **Markup** (розмітка) означає, що ми отримали документ із розміченим кодом для того, щоб повідомити дещо (у даному випадку, браузер) як треба інтерпретувати сторінку. HTML код побудований за допомогою **тегів**, кожен з яких починається із `<` і закінчується `>`. These tags represent markup **elements**.

## Ваш перший шаблон!

Під створенням шаблону мається на увазі створення файлу шаблону. Будь-що є файлом, чи не так? Ви, напевно, це вже зауважили.

Шаблони зберігаються в папці `blog/templates/blog`. Отже, спершу створіть папку із назвою `templates` всередині вашої папки blog. Далі створіть іншу папку із назвою `blog` всередині вашої папки templates:

    blog
    └───templates
        └───blog
    

(You might wonder why we need two directories both called `blog` – as you will discover later, this is simply a useful naming convention that makes life easier when things start to get more complicated.)

А тепер створіть файл `post_list.html` (просто залиште його поки що пустим) всередині папки `blog/templates/blog`.

Погляньте як тепер виглядає ваш веб сайт: http://127.0.0.1:8000/

> If you still have an error `TemplateDoesNotExist`, try to restart your server. Go into command line, stop the server by pressing Ctrl+C (Control and C keys together) and start it again by running a `python manage.py runserver` command.

![Рисунок 11.1](images/step1.png)

Більше ніяких помилок! Вітання :) Однак, ваш сайт насправді не публікує нічого, окрім пустої сторінки, оскільки ваш шаблон також пустий. Ми маємо це виправити.

Додайте наступне у ваш файл шаблону:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <p>Hi there!</p>
    <p>It works!</p>
</html>
```

So how does your website look now? Visit it to find out: http://127.0.0.1:8000/

![Рисунок 11.2](images/step3.png)

Спрацювало! Гарна робота :)

* The most basic tag, `<html>`, is always the beginning of any web page and `</html>` is always the end. Як бачите, увесь контент сайту розміщений між початковим тегом `<html>` і закриваючим тегом `</html>`
* `<p>` - тег для елементів абзацу; `</p>` закриває кожен абзац

## Head and body

Each HTML page is also divided into two elements: **head** and **body**.

* **head** - елемент, що містить інформацію про документ, яка не відображається на екрані.

* **body** - елемент, що містить усе інше, що відображається як частина веб сторінки.

Ми використовуємо `<head>` щоб повідомити браузер про конфігурацію сторінки, а `<body>` щоб повідомити браузер, що у дійсності знаходиться на сторінці.

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

Збережіть файл і перезавантажте вашу сторінку.

![Рисунок 11.3](images/step4.png)

Зауважте як браузер зрозумів , що "Ola's blog" це заголовок вашої сторінки? Він інтерпретував `<title>Ola's blog</title>` і розмістив текст у рядку заголовка вашого браузера (він також буде використаний для закладок чи інших речей).

Можливо, ви також зауважили, що кожен відкриваючий тег відповідає *закриваючому тегу*, із `/`, і ці елементи є *вкладеними* (тобто ви не можете закрити окремий тег поки усі теги, що містяться всередині не будуть також закриті).

Це щось на кшталт як покласти речі всередину ящиків. You have one big box, `<html></html>`; inside it there is `<body></body>`, and that contains still smaller boxes: `<p></p>`.

You need to follow these rules of *closing* tags, and of *nesting* elements – if you don't, the browser may not be able to interpret them properly and your page will display incorrectly.

## Налаштуйте ваш шаблон

А тепер можете трохи побавитися і спробувати налаштувати ваш шаблон! Тут наведено декілька корисних тегів для цього:

* `<h1>A heading</h1>` for your most important heading
* `<h2>Підзаголовок</h2>` для заголовків наступного рівня
* `<h3>A sub-sub-heading</h3>` …and so on, up to `<h6>`
* `<p>A paragraph of text</p>`
* `<em>текст</em>` робить акцент на вашому тексті
* `<strong>текст</strong>` робить сильний акцент на вашому тексті
* `<br />` переходить на наступну лінію (ви не можете нічого розмістити всередині br)
* `<a href="https://djangogirls.org">link</a>` creates a link
* `<ul><li>перший елемент</li><li>другий елемент</li></ul>` створює список, такий як цей!
* `<div></div>` визначає блок сторінки

Here's an example of a full template, copy and paste it into `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <div>
            <h1><a href="">Django Girls Blog</a></h1>
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

Тут було створено три блоки `div`.

* The first `div` element contains the title of our blog – it's a heading and a link
* Два інших `div` елементи містять наші пости із датою публікації, `h2` із заголовком поста, який можна клікнути і два `p` (абзаци) тексту, один для дати, а інший для нашого блог посту.

Отримуємо наступний ефект:

![Рисунок 11.4](images/step6.png)

Йой! But so far, our template only ever displays exactly **the same information** – whereas earlier we were talking about templates as allowing us to display **different** information in the **same format**.

What we really want to do is display real posts added in our Django admin – and that's where we're going next.

## Ще одна річ: розгортання!

Було б добре побачити все це в Інтернеті, правда? Давайте зробимо ще одне розгортання на PythonAnywhere:

### Фіксування (commit) і завантаження (push) коду на GitHub

По-перше, давайте подивимося які файли були змінені після розгортання (виконайте ці команди локально, не на PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Переконайтеся, що ви перебуваєте в директорії `djangogirls`, далі давайте скажемо для `git` включити всі зміни в рамках цього каталогу:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    

> **Note** `--all` means that `git` will also recognize if you've deleted files (by default, it only recognizes new/modified files). Також пам'ятайте (з розділу 3), що `.` означає поточну директорію.

Перед тим як завантажити усі файли, давайте перевіримо що ж буде завантажувати `git` (усі файли, які буде завантажувати `git` повинні тепер з'явитися і бути позначеними зеленим кольором):

{% filename %}command-line{% endfilename %}

    $ git status
    

Майже на місці, а тепер час повідомити йому про те, що треба зберегти ці зміни в його історії. Ми збираємося задати "commit message" що ж ми змінили. На цьому етапі можна набрати будь-що, що вважатимете за потрібне, однак, має сенс надрукувати щось дійсно зрозуміле, щоб, таким чином, ви могли згадати що ви зробили у майбутньому.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Changed the HTML for the site."
    

> **Зауваження** Переконайтеся, що ви використали подвійні лапки навколо повідомлення про здійснену фіксацію.

Once we've done that, we upload (push) our changes up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Завантаження (pull) нового коду на PythonAnywhere і перезапуск веб-додатку

* Відкрийте [сторінку з терміналами на PythonAnywhere](https://www.pythonanywhere.com/consoles/) і переключіться на вже запущений **Bash термінал** (або запустіть новий). Далі, наберіть команди:

{% filename %}command-line{% endfilename %}

    $ cd ~/my-first-blog
    $ git pull
    [...]
    

Подивіться, що ваш код почав завантажуватись. Якщо ви хочете перевірити успішність процедури, відкрийте вкладку **Files** і подивіться на свій код на PythonAnywhere.

* Під кінець, переключіться на вкладку [Web](https://www.pythonanywhere.com/web_app_setup/) і натисніть **Reload**.

Your update should be live! Go ahead and refresh your website in the browser. Changes should be visible. :)