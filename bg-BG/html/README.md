# Въвeдение в HTML

Може би се питате какво е шаблон (template)?

Шаблонът е файл който, можем да използваме неколкократно за да представим различна информация в последователен формат -- например, можете да използвате шаблон, който да ви помага да напишете писмо, защото макар че всяко писмо да може да съдържа различно съобщение и да бъде адресирано до различен човек, те ще споделят същия формат.

Django формат шаблона е описан в език наречен HTML (Това е HTML, който споменахме в главата **Как работи Internet**).

## Какво е HTML?

HTML е код, който се интерпретира от търсачките -- като Chrome, Firefox, Safari -- за да покаже на екран страницата на потребителя.

HTML идва от "HyperText Markup Language". **HyperText** означава, че е тип от текст който подпомага хипервръзки между страници. **Markup** означава, че сме взели документа и сме го означили с код за да кажем нещо (в този случай, търсачка) как да подразбира страницата. HTML кода е изграден от **tags** (етикети), всеки от които стартира с `<` и завършва с `>`. Тези етикети представляват маркирани елементи (**elements**).

## Първият ви шаблон!

Създаване на шаблон означава създаване на шаблонен файл. Всичко е файл, нали? Може би вече забелязахте това.

Шаблоните се запазват в директория `blog/templates/blog`. Така че, първо създайте директория наречена `templates` в директорията на блога ви. След това създайте друга директория наречена `blog` вътре при вашите шаблони:

    blog
    └───templates
        └───blog
    

(Може би се чудите защо са ни нужни две директории наречени `blog` -- както ще откриете по-късно, това е много лесно установена практика, която прави живота ни по-лесен, когато нещата започват да стават по-сложни.)

И сега създайте файл `post_list.html` (оставете го празен засега) в директорията `blog/templates/blog`.

Вижте как изглежда сайта ви: http://127.0.0.1:8000/

> Ако все още имате грешка `TemplateDoesNotExist`, опитайте се да заредите сървъра си отново. Отидете в конзолата си, спрете сървъра като натиснете едновременно Ctrl+C и го стартирате отново като напишете команда `python manage.py runserver` .

![Figure 11.1](images/step1.png)

Вече нямаме грешка! Поздравления :) Въпреки това, сайта ви всъщност не публикува нищо освен празна страница, защото шаблонът ви също е празен. Можем да оправим това.

Отворете новият файл в редактора и добавете следното:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

Така, как изглежда уебсайта ви в момента? Отиде на: http://127.0.0.1:8000/ за да разберете

![Figure 11.2](images/step3.png)

Работи! Добра работа :)

* Най-простия етикет `<html>` е винаги в началото на една страница и `</html>` е винаги в края и. Както може да видите, цялото съдържание на страницата е между отварящият `<html>` и затварящият етикет `</html>`
* `<p>` е етикет за абзацни елементи; `</p>` затваря всеки един абзац

## Глава и тяло на страницата (head и body)

Всяка HTML страница е разделена на два елемена: **head** и **body**.

* **head** е елемент, който съдържа информация относно документа, който е показан на екрана.

* **body** е елемент, който съдържа всичко, което е показано като част от уеб страницата.

Използваме `<head>` за да кажем на търсачката за конфигурацията на страницата и `<body>` какво точно е на страницата.

Например, може да сложите заглавие на елемента вътре в `<head>` ето така: 

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

Запазете файла и презаредете страницата.

![Figure 11.3](images/step4.png)

Забелязахте ли как търсачката ви разбра, че заглавието на блога е "Ola's blog"? Тълкува `<title>Ola's blog</title>` и показва текст с името на заглавието в лентата на търсачката (също така ще се използва за отметка (bookmarks) и т.н.).

Вероятно забелязахте и, че отварящия етикет съвпада със затварящия с `/`, като тези елементи са вложени (например не можете да затворите определен етикет, докато не затворите всички, които са преди него).

Също като да слагаме неща в кутии. Имате една голяма кутия, `<html></html>`; в нея е `<body></body>` и това съдържа други по-малки кутии: `<p></p>`.

Трябва да следвате тези правила със затварящите етикети и вложените елементи - ако ли не, търсачката ви може и да не ги представи както трябва и страницата ви ще изглежда неправилно.

## Персонализиране на шаблон

Може малко да се позабавлявате и да опитате да направите свой шаблон! Ето няколко полезни етикета за целта:

* `<h1>Заглавие</h1>` за най-важното ви заглавие
* `<h2>Подзаглавие</h2>` за заглавие от следващо ниво
* `<h3>Под-подзаглавие</h3>` …и т.н. до `<h6>`
* `<p>Абзац</p>`
* `<em>текст</em>` набляга на текста 
* `<strong>текст</strong>` удебелява текста
* `<br>` отива на нов ред (не може да сложите нищо в br, както и няма затварящ етикет )
* `<a href="https://djangogirls.org">връзка</a>` създава връзка 
* `<ul><li>първи елемент</li><li>втори елемент</li></ul>` прави лист, точно като този! 
* `<div></div>` дефинира секция от страницата

Ето пример на пълен шаблон, копирайте и пренесете в `blog/templates/blog/post_list.html`:

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

Създадохме три `div` секции тук.

* Първият `div` елемент съдържа името на блога -- неговото заглавие и връзката
* Другите два `div` елемента съдържат нашите блог постове с датата на публикуване, `h2` със заглавието, на което може да се кликне и два `p`s (абзаца) от текст, единия за датата, а другия за нашия пост.

Дава ни този ефект:

![Figure 11.4](images/step6.png)

Ихаа! But so far, our template only ever displays exactly **the same information** – whereas earlier we were talking about templates as allowing us to display **different** information in the **same format**.

What we really want to do is display real posts added in our Django admin – and that's where we're going next.

## One more thing: deploy!

It'd be good to see all this out and live on the Internet, right? Let's do another PythonAnywhere deploy:

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

* Open up the [PythonAnywhere consoles page](https://www.pythonanywhere.com/consoles/) and go to your **Bash console** (or start a new one). Then, run:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

You'll need to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain name, without the angle-brackets. Your subdomain name is normally your PythonAnywhere user name, but in some cases it might be a bit different (such as if your user name contains capital letters). So if this command doesn't work, use the `ls` (list files) command to find your actual subdomain/folder name, and then `cd` to there.

Now watch your code get downloaded. If you want to check that it's arrived, you can hop over to the **"Files" page** and view your code on PythonAnywhere (you can reach other PythonAnywhere pages from the menu button on the console page).

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app.

Your update should be live! Go ahead and refresh your website in the browser. Changes should be visible. :)