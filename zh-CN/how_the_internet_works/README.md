# 互联网是如何工作的？

> For readers at home: this chapter is covered in the [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) video.
> 
> This chapter is inspired by the talk "How the Internet works" by Jessica McKellar (http://web.mit.edu/jesstess/www/).

We bet you use the Internet every day. But do you actually know what happens when you type an address like https://djangogirls.org into your browser and press `enter`?

The first thing you need to understand is that a website consists of a bunch of files saved on a hard disk. 就像你的电影、 音乐或图片一样。 然而，网站的唯一的不同之处是： 网站包含一种称为 HTML 的代码。

如果你不熟悉编程，一开始你会很难理解HTML。你的浏览器 (如Chrome、 Safari、 Firefox 等) 却很喜欢它。 Web浏览器懂得这些代码，遵循它的指令并如你所想的那样展示这些文件。

就像我们对待每个电脑文件一样，我们需要把HTML文件存储在硬盘的某个位置。 对于互联网，我们使用特定而功能强大的电脑，我们称之为*服务器*。 它们没有屏幕、鼠标或者键盘，因为它们的主要目的是存储数据，并用它来提供服务。 That's why they're called *servers* – because they *serve* you data.

OK, but you want to know how the Internet looks, right?

我们给你画了一幅画！它看起来像这样：

![图1.1](images/internet_1.png)

看起来很糟糕，对吗？ In fact it is a network of connected machines (the above-mentioned *servers*). 数以十万计的机器！ 很多，很多数以公里长的电缆分布在全世界！ 你能访问一个海底电缆地图网站（http://submarinecablemap.com/）来看这个网络有多么复杂。 这是一个网站上的截屏：

![图1.2](images/internet_3.png)

它很迷人，对吧？ But it is not possible to have a wire between every machine connected to the Internet. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

它看起来像这样：

![图1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

你的信件去了离你最近的邮局。 然后它去离你的收件人稍近一点的邮局，然后再去另一个，以此类推地到达它的目的地。 唯一的事情是，如果你将许多信件 (*数据包*) 发送到同一个地方，他们可以通过完全不同邮政局 (*路由器*)。 这取决于每个办公室的分布情况。

![图1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Instead of paper and pen you use bytes of data, but the idea is the same!

我们使用的地址叫做IP地址，这种地址却不包含街道、城市、邮编和城市。 你的电脑首先要求DNS（域名服务器）去解析djangogirls.org成为IP地址。 It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. 你使用一种接收者同样能够理解的语言，对吗？ 你送到网站的*数据包*也类似如此。 我们使用一个名为 HTTP (Hypertext Transfer Protocol：超文本传输协议) 的协议。

所以，基本上，当你有一个网站你需要有一台*服务器*用于网站的托管。 当*服务器*接收到一个访问*请求*（一封信），它把网站内容发送回去（回信）。

Since this is a Django tutorial, you might ask what Django does. 当你发送一个响应时，你通常不会发送同样的东西给每一个人。 如果你信件的内容是个性化的必然更好，尤其是对于那个刚刚给你写信的人，对吗？ Django帮助你创建这些个性化，有趣的信件. :)

Enough talk – time to create!