# Введение в HTML

Так что же это за шаблон, ты можешь спросить.

A template is a file that we can re-use to present different information in a consistent format – for example, you could use a template to help you write a letter, because although each letter might contain a different message and be addressed to a different person, they will share the same format.

A Django template's format is described in a language called HTML (that's the HTML we mentioned in the first chapter, **How the Internet works**).

## Что такое HTML?

HTML is a simple code that is interpreted by your web browser – such as Chrome, Firefox or Safari – to display a web page for the user.

HTML (от англ. "HyperText Markup Language") - язык гипертекстовой разметки. **Гипертекст** - это тип текста, поддерживающий гиперссылки между страницами. Под **разметкой** понимается введение в текст документа кода, который будет говорить браузеру (в нашем случае) как интерпретировать веб-страницу. HTML код строится при помощи **тегов**, каждый из которых должен начинаться с `<` и заканчиваться `>`. These tags represent markup **elements**.

## Твой первый шаблон!

Создание шаблона означает создание файла шаблона. Все есть файл, верно? Ты уже заметила это, наверно.

Шаблоны сохраняются в директории `blog/templates/blog`. Для начала создай директорию `templates` внутри папки blog. Затем создай другую директорию `blog` внутри папки templates:

    blog
    └───templates
        └───blog
    

(You might wonder why we need two directories both called `blog` – as you will discover later, this is simply a useful naming convention that makes life easier when things start to get more complicated.)

Теперь создай файл `post_list.html` (для начала оставь его пустым) внутри директории `blog/templates/blog`.

Посмотри как выглядит твой веб-сайт после этого: http://127.0.0.1:8000/

> If you still have an error `TemplateDoesNotExist`, try to restart your server. Go into command line, stop the server by pressing Ctrl+C (Control and C keys together) and start it again by running a `python manage.py runserver` command.

![Рисунок 11.1](images/step1.png)

Ошибки больше не! Поздравляем :) Однако, твой веб-сайт все равно ничего не отображает, кроме пустой страницы, поскольку твой шаблон пуст. Нам нужно это исправить.

Добавь следующий код в файл шаблона:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <p>Hi there!</p>
    <p>It works!</p>
</html>
```

So how does your website look now? Visit it to find out: http://127.0.0.1:8000/

![Рисунок 11.2](images/step3.png)

Заработало! Хорошая работа :)

* The most basic tag, `<html>`, is always the beginning of any web page and `</html>` is always the end. Как ты можешь заметить, основной контент веб-сайта находится между тегами `<html>` и `</html>`
* `<p>` - это тег для параграфов; `</p>`, соответственно, закрывает каждый параграф

## Head and body

Each HTML page is also divided into two elements: **head** and **body**.

* **head** -- это элемент, содержащий информацию о документе, которая не отображается на экране.

* **body** -- это элемент, который содержит все, что будет отражено на веб-странице.

Мы используем тег `<head>` чтобы сообщить браузеру о настройках страницы и тег `<body>` - о её содержимом.

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

Сохрани файл и обнови страницу.

![Рисунок 11.3](images/step4.png)

Видишь, как браузер понял, что "Ola's blog" -- это заголовок страницы? Он понял `<title>Ola's blog</title>` и разместил текст в заголовке вкладки в твоем браузере (заголовок также будет использоваться при сохранении закладок и т.п.).

Вероятно, ты уже заметила, что каждый открывающий тег имеет пару -- *закрывающий*, с символом `/`, элементы таким образом становятся *вложенными* (ты не можешь закрыть тег, пока остаются открытыми теги внутри него).

Это как складывать вещи в коробки. You have one big box, `<html></html>`; inside it there is `<body></body>`, and that contains still smaller boxes: `<p></p>`.

You need to follow these rules of *closing* tags, and of *nesting* elements – if you don't, the browser may not be able to interpret them properly and your page will display incorrectly.

## Настраиваем шаблон

Ты можешь немного повеселиться сейчас и попробовать настроить шаблон по своему вкусу! Вот несколько полезных тегов:

* `<h1>A heading</h1>` for your most important heading
* `<h2>Подзаголовок</h2>` для заголовков второго уровня
* `<h3>A sub-sub-heading</h3>` …and so on, up to `<h6>`
* `<p>A paragraph of text</p>`
* `<em>текст</em>` подчеркивает твой текст
* `<strong>текст</strong>` - жирный шрифт
* `<br />` переход на следующую строку (внутрь br тега нельзя ничего поместить)
* `<a href="https://djangogirls.org">link</a>` creates a link
* `<ul><li>первый элемент</li><li>второй элемент</li></ul>` создает список, такой же как этот!
* `<div></div>` определяет раздел страницы

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

Мы создали три `div` элемента.

* The first `div` element contains the title of our blog – it's a heading and a link
* Два других `div` элемента содержат текст записи и дату публикации, `h2` тег с заголовком записи, который также является ссылкой, и два `p` (параграфа) с текстом, один для даты и другой для самого текста записи.

Это даст нам следующий эффект:

![Рисунок 11.4](images/step6.png)

Ура! But so far, our template only ever displays exactly **the same information** – whereas earlier we were talking about templates as allowing us to display **different** information in the **same format**.

What we really want to do is display real posts added in our Django admin – and that's where we're going next.

## Еще одно: развертывание!

Хотелось бы увидеть все это в живую в интернете, согласна? Давай проведем еще одно развертывание веб-сайта на PythonAnywhere:

### Commit и push кода в репозиторий Github

Во-первых, давай посмотрим, какие файлы были изменены с момента последнего развертывания (выполни эти команды локально, не на PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Убедись, что находишься в директории `djangogirls` и сообщи `git` выбрать все изменения в пределах папки:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    

> **Note** `--all` means that `git` will also recognize if you've deleted files (by default, it only recognizes new/modified files). Также помни (из третьей главы), что `.` означает текущую директорию.

Прежде чем мы загрузим файлы, давай проверим, что именно `git` будет загружать (все файлы, который `git` готов отправить на сервер отмечаются шрифтом зеленого цвета):

{% filename %}command-line{% endfilename %}

    $ git status
    

Мы почти у цели, пришло время сохранить изменения в истории. К сохраняемой версии мы приложим небольшое сообщение, в котором кратко опишем изменения. Можешь набрать в качестве сообщения все что захочешь, однако, полезно выбирать информативную запись, так будет проще вспомнить внесенные изменения в будущем.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Changed the HTML for the site."
    

> **Примечание**: Убедись что используешь двойные кавычки вокруг комментария.

Once we've done that, we upload (push) our changes up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Загружаем новый код на PythonAnywhere и перезапускаем веб-приложение

* Открой вкладку ["терминалы"](https://www.pythonanywhere.com/consoles/) на PythonAnywhere и переключись на уже запущенную **консоль Bash** (или новую). Затем набери следующую команду:

{% filename %}command-line{% endfilename %}

    $ cd ~/my-first-blog
    $ git pull
    [...]
    

Можешь обратить внимание как твой код будет загружаться на сервер. Если хочешь проверить успешность процедуры - открой вкладку **Файлы** и просмотри свой код на PythonAnywhere.

* Наконец, переключись на вкладку [Web](https://www.pythonanywhere.com/web_app_setup/) и нажми кнопку **Reload**.

Your update should be live! Go ahead and refresh your website in the browser. Changes should be visible. :)