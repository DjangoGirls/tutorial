# ジャンゴってなに？

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) is a free and open source web application framework, written in Python. Web フレームワークは、素早く、簡単にウェブサイトを開発するのに役立つコンポーネントの一式が含まれています。

Web サイトを構築するとき常に同じような一連のコンポーネントを必要があります: ユーザー認証 (登録、サインイン、サインアウト) を処理する方法、あなたのウェブサイト、フォーム、ファイルなどをアップロードする方法の管理パネルです。

Luckily for you, other people long ago noticed that web developers face similar problems when building a new site, so they teamed up and created frameworks (Django being one of them) that give you ready-made components to use.

Frameworks exist to save you from having to reinvent the wheel and to help alleviate some of the overhead when you’re building a new site.

## なぜフレームワークを必要とするか。

To understand what Django is actually for, we need to take a closer look at the servers. The first thing is that the server needs to know that you want it to serve you a web page.

やってくるメールを監視するメール受信箱を想像してみてください。 これはWEBサーバによってです。 The web server reads the letter and then sends a response with a webpage. しかし、何かをレスポンスを返す場合は、いくつかのコンテンツを持っている必要があります。 Djangoは、コンテンツを作成することができます。

## 誰かがあなたのWEB サイトにリクエストを要求したときどうなりますか。

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

配達人と手紙を想像してみてください。 彼女は通りを歩き、各家の番号をチェックします。 手紙とマッチすると、手紙を配達します。 これがurlresolverがどのように動いているか、です。

In the *view* function, all the interesting things are done: we can look at a database to look for some information. ユーザはデータにおいて何か変更するために尋ねるだろうか？ Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

もちろん、上の説明は少し簡単に書きましたが、まだすべての技術的なことを知る必要はないです。一般的な考え方を持つだけで十分です。

細部に多くの時間を費やすより、Djangoで何かを作ることをはじめましょう、そしてやり方に沿って重要な部分を学びましょう！