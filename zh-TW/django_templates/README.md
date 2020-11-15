# Django 範本 (templates)

是時候顯示一些資料了！為此，Django 提供我們一些有用的內建**範本標籤 (template tags)**。

## 範本標籤是什麼？

You see, in HTML, you can't really write Python code, because browsers don't understand it. They know only HTML. We know that HTML is rather static, while Python is much more dynamic.

**Django template tags** allow us to transfer Python-like things into HTML, so you can build dynamic websites faster. Cool!

## 顯示文章清單範本

在前一章中我們在 `posts` 變數中給我們的範本文章清單，現在我們將在 HTML 中顯示它。

若要刊載 Django 範本中的變數，我們把變數放在兩個雙大括弧裡面，像這樣︰

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

在你的 `blog/templates/blog/post_list.html` 範本中，試試這個。 Open it up in the code editor, and replace everything from the second `<div>` to the third `</div>` with `{{ posts }}`. 存檔，並更新網頁 (refresh) 以查看結果︰

![圖 13.1](images/step1.png)

如你所看到的，我們得到是這樣︰

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

這表示 Django 瞭解它是物件清單。 還記得在 **Python 簡介** 中我們可以如何顯示清單嗎？ 是的，用迴圈 (loop)！ 在 Django 範本中你這樣做︰

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

在你的範本中試試這些。

![圖 13.2](images/step2.png)

成功了！ But we want the posts to be displayed like the static posts we created earlier in the **Introduction to HTML** chapter. 你可以混合使用 HTML 和範本標籤。 我們的 `body` 將像這樣︰

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

{% raw %}你放在 `{% for %}` 和 `{% endfor %}` 之間的程式碼將重複清單中的每個物件。更新你的網頁︰{% endraw %}

![圖 13.3](images/step3.png)

Have you noticed that we used a slightly different notation this time (`{{ post.title }}` or `{{ post.text }}`)? 我們存取定義在我們 `Post` 模型中每個欄位的資料。 Also, the `|linebreaksbr` is piping the posts' text through a filter to convert line-breaks into paragraphs.

## 還有一件事

It'd be good to see if your website will still be working on the public Internet, right? Let's try deploying to PythonAnywhere again. Here's a recap of the steps…

* First, push your code to GitHub

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* 然後，登錄 [PythonAnywhere](https://www.pythonanywhere.com/consoles/) 並到你的 **Bash 主控台**（或啟動一個新的），然後，執行︰

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd <your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app. (To reach other PythonAnywhere pages from the console, use the menu button in the upper right corner.) Your update should be live on https://subdomain.pythonanywhere.com -- check it out in the browser! If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. The databases on your local computer and Python Anywhere don't sync with the rest of your files.

Congrats! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://subdomain.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![Figure 13.4](images/donut.png)