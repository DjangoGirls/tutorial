# インターネットのしくみ

> For readers at home: this chapter is covered in the [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) video.
> 
> This chapter is inspired by the talk "How the Internet works" by Jessica McKellar (http://web.mit.edu/jesstess/www/).

We bet you use the Internet every day. But do you actually know what happens when you type an address like https://djangogirls.org into your browser and press `enter`?

まず最初に理解する必要があるのは、ウェブサイトがちょうどハードディスクで保存されるたくさんのファイルであるということです。 同様に、映画、音楽、または画像。 ただし、web サイトに対して一意である 1 つの部分がある: 彼らは、HTML と呼ばれるコンピューター コードを含まれます。

あなたがプログラミングをよく知っていないならば、最初はHTMLをつかむのは難しいでしょう。しかし、あなたのウェブ・ブラウザ（Chrome、Safari、Firefoxなどのような）はそれが好きです。 ウェブ・ブラウザはこのコードがわかるようになっていて、あなたのウェブサイトのファイルを表示するよう設計されています。

すべてのファイルと同様我々 はどこかハード ディスク上の HTML ファイルを保存する必要があります。 インターネット *サーバー* と呼ばれる特別な強力なコンピューターを使用します。 サーバーの主な目的は、データを格納する事。ですがそれを提供するため、画面、マウスまたはキーボードを持っていません。 That's why they're called *servers* – because they *serve* you data.

OK, but you want to know how the Internet looks, right?

私たちは絵を書きました。

![図 1.1](images/internet_1.png)

混乱しているように見えますか？ In fact it is a network of connected machines (the above-mentioned *servers*). マシンの何千もの何百も! Many, many kilometers of cables around the world! You can visit a Submarine Cable Map website (http://submarinecablemap.com) to see how complicated the net is. Here is a screenshot from the website:

![図 1.2](images/internet_3.png)

It is fascinating, isn't it? But obviously, it is not possible to have a wire between every machine connected to the Internet. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

It looks like this:

![図 1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

Your letter goes to the post office closest to you. Then it goes to another that is a bit nearer to your addressee, then to another, and another until it is delivered at its destination. The only unique thing is that if you send many letters (*data packets*) to the same place, they could go through totally different post offices (*routers*). This depends on how they are distributed at each office.

![図 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Of course, instead of paper and pen you use bytes of data, but the idea is the same!

Instead of addresses with a street name, city, zip code and country name, we use IP addresses. Your computer first asks the DNS (Domain Name System) to translate djangogirls.org into an IP address. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. You also use a language that the receiver understands, right? The same applies to the *data packets* you send to see a website. We use a protocol called HTTP (Hypertext Transfer Protocol).

So, basically, when you have a website, you need to have a *server* (machine) where it lives. When the *server* receives an incoming *request* (in a letter), it sends back your website (in another letter).

Since this is a Django tutorial, you might ask what Django does. When you send a response, you don't always want to send the same thing to everybody. It is so much better if your letters are personalized, especially for the person that has just written to you, right? Django helps you with creating these personalized, interesting letters. :)

Enough talk – time to create!