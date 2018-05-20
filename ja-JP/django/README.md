# ジャンゴってなに？

Django (/ˈdʒæŋɡoʊ/ *jang-goh* ジャンゴ と読みます) 無料でオープンソースとして公開されているPythonを使用したWebアプリケーションフレームワークです。 Web フレームワークは、素早く、簡単にウェブサイトを開発するのに役立つコンポーネントの一式が含まれています。

ほら、Webサイトを構築する時、同じような構造が毎回必要になってきますよね。ユーザー認証（サインアップ、サインイン、サインアウト）、管理者用の画面、フォーム、ファイルのアップロードなど。

開発者たちはサイトを構築する度に同じ問題を抱えたため、みんなで力を合わせてフレームワークを開発しました。（Djangoはフレームワークのひとつです。）幸運なことに、私たちは、開発に必要な要素がすでに含まれているフレームワークを使って開発することができます。

フレームワークを使うことで、私たちは開発をイチから作り直して車輪の再発明をすることを避けられます。また、新しいサイトを構築する際にかかる最初の準備に必要なコストを軽減します。

## なぜフレームワークを必要とするか。

Djangoを本当に理解するために、サーバーの役割についてもう少し考えてみましょう。サーバーにWebページを配信してもらうようにするには、サーバーにその設定をする必要があります。

手紙が届くポストを想像してください。手紙はユーザからWebサーバーに送られるリクエストのことで、ポストはWebサーバーのポートのことです。 Webサーバーが行っています。 Webサーバーはこのポストを監視して、手紙が届くとそれを読み、Webページから返事を送ります。 返事を送ろうとする時、コンテンツが必要ですね。 Djangoは、あなたがそのコンテンツを作る手助けをするものです。

## 誰かがあなたのWEB サイトにリクエストを要求したときどうなりますか。

Webサーバーにリクエストがあると、Djangoに伝えられ、リクエストの内容を把握しようとします。 まずWebページのアドレスを調べ、リクエストに対して何をするか決めます。 これは、Djangoの**urlresolver**が行います。（WebサイトのアドレスはURLと呼ばれます。 Uniform Resource Locator の略です。-resolverとは「解決するもの」という意味ですので、*urlresolver* というのはうなずけますよね。)。 It is not very smart – it takes a list of patterns and tries to match the URL. Djangoは上から下にURLパターンを順に調べていきます。そこで何かがマッチすると、Djangoは*ビュー*と呼ばれる関数にリクエストを送ります。

郵便配達員を思い浮かべてください。 配達員は、通りを歩き、ひとつひとつの家の番地と、手紙に書かれている番地を見比べて行きます。 マッチする番地があったら、手紙をそこに置いていきます。 これがurlresolverがどのように動いているか、です。

In the *view* function, all the interesting things are done: we can look at a database to look for some information. ユーザはデータにおいて何か変更するために尋ねるだろうか？ Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

もちろん、上の説明は少し簡単に書きましたが、まだすべての技術的なことを知る必要はないです。一般的な考え方を持つだけで十分です。

細部に多くの時間を費やすより、Djangoで何かを作ることをはじめましょう、そしてやり方に沿って重要な部分を学びましょう！