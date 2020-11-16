# HTML 簡介

你可能會問什麼是範本 (template)？

A template is a file that we can re-use to present different information in a consistent format – for example, you could use a template to help you write a letter because although each letter might contain a different message and be addressed to a different person, they will share the same format.

A Django template's format is described in a language called HTML (that's the HTML we mentioned in the first chapter, **How the Internet works**).

## 什麼是 HTML？

HTML is a code that is interpreted by your web browser – such as Chrome, Firefox or Safari – to display a web page for the user.

HTML 代表 "超文字標記語言 (HyperText Markup Language)"。 **超文字 (HyperText)** 是指它是一種支援網頁之間的超連結的文字。 **標記 (Markup)** 意味著我們接收文件並標示上程式碼來告訴某個東西（在這裡是指瀏覽器）如何解譯成網頁。 HTML 程式碼是由**標記 (tags)** 構成，每一程式碼以 `<` 開始，且以 `>` 結束。 這些標籤 (tags) 表示標記 (markup) **元素 (elements)**.

## 你第一個範本 (template)！

建立一個範本 (template) 是指建立一個範本檔 (template file)，一切都是一個檔，對吧？你可能已經注意到這點了。

範本 (templates) 儲存在 `blog/templates/blog` 目錄中。 所以，先建立一個名稱為 `templates` 目錄 在你的 blog 目錄裡。 然後建立另一個稱為 `blog` 的目錄在你的 templates 目錄裡：

    blog
    └───templates
        └───blog
    

(You might wonder why we need two directories both called `blog` – as you will discover later, this is a useful naming convention that makes life easier when things start to get more complicated.)

現在，在 `blog/templates/blog` 目錄裡面，建立一個 `post_list.html` 檔（現在讓它保留空白） 。

看看你的網站現在是什麼樣子：http://127.0.0.1:8000/

> If you still have an error `TemplateDoesNotExist`, try to restart your server. Go to the command line, stop the server by pressing Ctrl+C (Control and C keys together) and start it again by running a `python manage.py runserver` command.

![圖 11.1](images/step1.png)

No error anymore! Congratulations! :) However, your website isn't actually publishing anything except an empty page, because your template is empty too. We need to fix that.

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

![圖 11.2](images/step3.png)

It worked. Nice work there! :)

* The most basic tag, `<html>`, is always the beginning of any web page and `</html>` is always the end. 正如你可看到的，整個網站的內容是在開始標籤 `<html>` 和結束標籤 `</html>` 之間。
* `<p>` 是一種用於段落元素的標籤；`</p>` 結束每個段落。

## Head and body

每個 HTML 頁面也分為兩個元素︰**head** 和 **body**.

* **head** 是一個元素，它包含不顯示在螢幕上的有關於文件的資訊。

* **body** 是一個元素。它包含一切顯示在網頁的東西。

我們使用 `<head>` 告訴瀏覽器有關網頁的設定，和 `<body>` 來告訴它網頁上究竟有什麼。

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

存檔並更新你的網頁。

![圖 11.3](images/step4.png)

注意瀏覽器如何瞭解 "Ola's blog" 是你的網頁的標題？ 它已經轉譯 `<title>Ola's blog</title>` 並把文字內容放在你的瀏覽器的標題列上（它將被用於書籤 (bookmarks)，.. 等等）。

你可能也注意到每個開始標籤都搭配一個 `/` 和 *結束標籤 (closing tag)*，且元素是*嵌套的 (nested)*(即是你必需結束特定標籤內所有標籤後，才能結束這個特定標籤）。

這就像把東西放進盒子裡。 你有一個大箱子 `<html></html>`，在它裡面有 `<body></body>`，並包含了更小的箱子：`<p></p>`.

You need to follow these rules of *closing* tags, and of *nesting* elements – if you don't, the browser may not be able to interpret them properly and your page will display incorrectly.

## 自訂您的範本 (template)

現在，你可以有點樂趣和試著自訂您的範本！這裡是幾個有用的標籤︰

* `<h1>A heading</h1>` for your most important heading
* `<h2>A sub-heading</h2>` 為下一級標題。
* `<h3>A sub-sub-heading</h3>` …and so on, up to `<h6>`
* `<p>A paragraph of text</p>`
* `<em>text</em>` 強調文字。
* `<strong>text</strong>` 強烈強調你的文字。
* `<br>` goes to another line (you can't put anything inside br and there's no closing tag)
* `<a href="https://djangogirls.org">link</a>` 建一個連結。
* `<ul><li>first item</li><li>second item</li></ul>` 製作一個清單，就像這個一樣。
* `<div></div>` 定義網頁的一個區域。

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
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut
fermentum massa justo sit amet risus.</p>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My second post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut
f.</p>
        </div>
    </body>
</html>
```

我們已經建立三個 `div` 區域在這裡。

* The first `div` element contains the title of our blog – it's a heading and a link
* Another two `div` elements contain our blog posts with a published date, `h2` with a post title that is clickable and two `p`s (paragraph) of text, one for the date and one for our blog post.

它給了我們這樣的效果：

![圖 11.4](images/step6.png)

Yaaay! But so far, our template only ever displays exactly **the same information** – whereas earlier we were talking about templates as allowing us to display **different** information in the **same format**.

What we really want to do is display real posts added in our Django admin – and that's where we're going next.

## 還有一件事：部署！

看到這一切在網際網路上是一件很美好的事，對吧？讓我們做另一個 PythonAnywhere 部署：

### Commit, and push your code up to GitHub

首先，讓我們看看自上次部署後我們修改了那些檔案（執行這些命令在你電腦上，不是在 PythonAnywhere）：

{% filename %}command-line{% endfilename %}

    $ git status
    

Make sure you're in the `djangogirls` directory and let's tell `git` to include all the changes in this directory:

{% filename %}command-line{% endfilename %}

    $ git add .
    

在我們上傳的所有檔之前，讓我們檢查 `git` 將上傳那些檔案（所有 `git` 將上傳的檔案現在都應以綠色顯示）：

{% filename %}command-line{% endfilename %}

    $ git status
    

我們差不多完成工作了，現在是時候告訴它把這次改變儲存在它的歷史紀錄中。 我們將給它 "提交訊息"，在裡面我們描述我們已經做了什麼改變。 在這階段，你可以鍵入任何你想要的東西，但鍵入一些描述性的東西更有幫助的，如此，在將來你能想起你做了什麼。

{% filename %}command-line{% endfilename %}

    $ git commit -m "Changed the HTML for the site."
    

> **Note** Make sure you use double quotes around the commit message.

Once we've done that, we upload (push) our changes up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### 拉取我們新的程式碼到 PythonAnywhere 上，並重新載入你的網站應用程式 (web app)

* 打開 [PythonAnywhere 主控台頁面](https://www.pythonanywhere.com/consoles/)，並到你的 **Bash 主控台 (console)**（或者啟動一個新的）。然後，執行：

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

You'll need to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain name, without the angle-brackets. Your subdomain name is normally your PythonAnywhere user name, but in some cases it might be a bit different (such as if your user name contains capital letters). So if this command doesn't work, use the `ls` (list files) command to find your actual subdomain/folder name, and then `cd` to there.

Now watch your code get downloaded. If you want to check that it's arrived, you can hop over to the **"Files" page** and view your code on PythonAnywhere (you can reach other PythonAnywhere pages from the menu button on the console page).

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app.

Your update should be live! Go ahead and refresh your website in the browser. Changes should be visible. :)