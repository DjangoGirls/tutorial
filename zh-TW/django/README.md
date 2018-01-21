# Django 是什麼?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) is a free and open source web application framework, written in Python. Web 框架是一組可以説明您制定網站更快和更容易的元件。

當你建立一個網站時，你總是需要一套類似的組件: 一種方式來處理使用者身份驗證 (註冊、登入、登出)、管理小組為您的網站、 表格、 一種方式來上傳檔等。

Luckily for you, other people long ago noticed that web developers face similar problems when building a new site, so they teamed up and created frameworks (Django being one of them) that give you ready-made components to use.

Frameworks exist to save you from having to reinvent the wheel and to help alleviate some of the overhead when you’re building a new site.

## 你為什麼需要一個框架?

To understand what Django is actually for, we need to take a closer look at the servers. The first thing is that the server needs to know that you want it to serve you a web page.

想像一個信箱(埠 port) 會偵測寄來的信的郵箱 (請求 request)。 web 伺服器就是在做這件事 。 The web server reads the letter and then sends a response with a webpage. 但是當你想要寄出某個東西，你需要一些內容 而 Django 就是在幫你產生相對應的內容。

## 當某個人向你的伺服器請求的時候發生了什麼事？

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

想像一個帶著信的郵差。 她在街上遊走，確認每家的地址把信送給他們。 如果地址對了，她就把信放進去。 這就是 urlresolver 在做的事情！

In the *view* function, all the interesting things are done: we can look at a database to look for some information. 萬一使用者要求要更改某些資料呢？ Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

當然了，以上的敘述已經簡化了很多，但你也不需要知道所有技術上的細節。有一個簡單的概念即可。

所以不糾結在太多細節敘述上，我們打算就簡單的開始用 Django 做點事，就可以從中學習到更多了。