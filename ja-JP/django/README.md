# ジャンゴってなに？

Django (/ˈdʒæŋɡoʊ/ *jang-goh* ジャンゴ と読みます) 無料でオープンソースとして公開されているPythonを使用したWebアプリケーションフレームワークです。 Web フレームワークは、素早く、簡単にウェブサイトを開発するのに役立つコンポーネントの一式が含まれています。

ほら、Webサイトを構築する時、同じような構造が毎回必要になってきますよね。ユーザー認証（サインアップ、サインイン、サインアウト）、管理者用の画面、フォーム、ファイルのアップロードなど。

開発者たちはサイトを構築する度に同じ問題を抱えたため、みんなで力を合わせてフレームワークを開発しました。（Djangoはフレームワークのひとつです。）幸運なことに、私たちは、開発に必要な要素がすでに含まれているフレームワークを使って開発することができます。

フレームワークを使うことで、私たちは開発をイチから作り直して車輪の再発明をすることを避けられます。また、新しいサイトを構築する際にかかる最初の準備に必要なコストを軽減します。

## なぜフレームワークを必要とするか。

To understand what Django is actually for, we need to take a closer look at the servers. The first thing is that the server needs to know that you want it to serve you a web page.

やってくるメールを監視するメール受信箱を想像してみてください。 これはWEBサーバによってです。 The web server reads the letter and then sends a response with a webpage. しかし、何かをレスポンスを返す場合は、いくつかのコンテンツを持っている必要があります。 Djangoは、コンテンツを作成することができます。

## 誰かがあなたのWEB サイトにリクエストを要求したときどうなりますか。

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

配達人と手紙を想像してみてください。 彼女は通りを歩き、各家の番号をチェックします。 手紙とマッチすると、手紙を配達します。 これがurlresolverがどのように動いているか、です。

In the *view* function, all the interesting things are done: we can look at a database to look for some information. ユーザはデータにおいて何か変更するために尋ねるだろうか？ Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

もちろん、上の説明は少し簡単に書きましたが、まだすべての技術的なことを知る必要はないです。一般的な考え方を持つだけで十分です。

細部に多くの時間を費やすより、Djangoで何かを作ることをはじめましょう、そしてやり方に沿って重要な部分を学びましょう！