# インターネットのしくみ

> 家で１人でこのチャプターに挑戦している方へ：このチャプターは、動画（英語）もあるので参考にしてください。 [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc)
> 
> この章は、ジェシカ・マッケラー（http://web.mit.edu/jesstess/www/）による「インターネットの仕組み」を参照しています。

私達は、毎日インターネットを使っています。でも、ブラウザのアドレス欄に https://djangogirls.org のようなアドレスを入力して `Enter` キーを押すと何が起こるかあなたは実際に知っていますか？

まず最初に理解する必要があるのは、Webサイトはハードディスクに保存されたたくさんのファイルであるということです。 あなたが自分のパソコンのハードディスクに動画や音楽や画像を保存しているのと同じということです。 しかし、Webサイトは動画や音楽、写真のようなデータとは違ってHTMLというコンピュータのコードを持っているのです。

もし、あなたがプログラミングに精通していなかったら、最初はHTMLも難しく感じるでしょう。でも、あなたがよく使うWebブラウザ（ChromeやSafariやFirefox等々）はHTMLのコードが大好きです。 Webブラウザはこのコードがわかるようになっていて、コードの指示に従います。そして、あなたのウェブサイトのファイルをあなたが望む方法で表示するのです。

あなたのパソコンへファイルを保存するのと同じで、私達はHTMLをハードディスクに保存する必要があります。 インターネットの場合、*サーバー* と呼ばれるパワフルなコンピュータを使い、そのハードディスクに保存します。 サーバーの主な目的は、データを保存し、それを供給することなので、サーバーは画面やマウス、キーボードを持っていません。 サーバーはデータを供給する（*サーブ* する）役割を持っているので、*サーバー* と呼ばれるのです。

はい、では、どのようにインターネットが見えるかを知りたいですよね？

私たちは絵を描いてみました。

![図 1.1](images/internet_1.png)

上記の絵は混乱しているように見えますよね？ 接続されたマシン（*サーバー*）のネットワークは実際こんな感じです。 数十万台のマシン！ 世界中はりめぐらされたケーブル！ Submarine Cable MapのWebサイト（http://submarinecablemap.com）にアクセスすれば、ネットの複雑さを知ることができます。 ここにウェブサイトからのスクリーンショットがあります：

![図 1.2](images/internet_3.png)

すばらしいですね。 でも、インターネットに接続されているすべてのマシンとマシンの間にワイヤを置くことは不可能です。 したがって、マシン（例えば http://djangogirls.org が保存されているマシン）に到達するためには、多くの異なるマシンを介してリクエストを渡す必要があります。

こんな感じですね。

![図 1.3](images/internet_2.png)

あなたが http://djangogirls.org と入力すると、「親愛なるDjango Girlsへ。私はdjangogirls.orgのWebサイトが見たいです」とリクエスト（手紙）を送ることになります。

あなたの手紙（リクエスト）は、まずあなたの一番近くの郵便局にいきますよね。 そしてそこから、もう少し宛先に少し近い別の郵便局に行き、またそこからもう少し近い郵便局に行って・・そしてあなたの目的地まで届きます。 特別なことが一つあります。同じ場所に多くの手紙（*データパケット*）を送ると、まったく別の郵便局（*ルーター*）を通過して届く可能性があるということです。 This depends on how they are distributed at each office.

![図 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Of course, instead of paper and pen you use bytes of data, but the idea is the same!

Instead of addresses with a street name, city, zip code and country name, we use IP addresses. Your computer first asks the DNS (Domain Name System) to translate djangogirls.org into an IP address. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. You also use a language that the receiver understands, right? The same applies to the *data packets* you send to see a website. We use a protocol called HTTP (Hypertext Transfer Protocol).

So, basically, when you have a website, you need to have a *server* (machine) where it lives. When the *server* receives an incoming *request* (in a letter), it sends back your website (in another letter).

Since this is a Django tutorial, you might ask what Django does. When you send a response, you don't always want to send the same thing to everybody. It is so much better if your letters are personalized, especially for the person that has just written to you, right? Django helps you with creating these personalized, interesting letters. :)

Enough talk – time to create!