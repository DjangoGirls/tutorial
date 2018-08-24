# 網際網路是如何運作的

> For readers at home: this chapter is covered in the [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) video.
> 
> This chapter is inspired by the talk "How the Internet works" by Jessica McKellar (http://web.mit.edu/jesstess/www/).

We bet you use the Internet every day. But do you actually know what happens when you type an address like https://djangogirls.org into your browser and press `enter`?

The first thing you need to understand is that a website consists of a bunch of files saved on a hard disk. 就像是你電腦裡的眾多影片、音樂和照片。 即便如此，網站的組成中還是有一部分是獨一無二的：他們都含有一種叫做「HTML」的程式碼。

如果你還不熟悉編程，你一開始可能會有點難理解什麼叫做 HTML，但是你的網站瀏覽器(像是 Chrome, Safari, Firefox 等等) 超愛它。 網站瀏覽器就是設計出來讀懂 Html 的，遵循它的架構及切切實實地展示你希望瀏覽器展示的所有檔案。

我們需要將 HTML 檔案們，及其所包含的所有檔案存在硬碟的某處。 為了放上網際網路，我們使用了特別且強悍的電腦 -- 稱為 伺服器 *server* 。 這些伺服器不需要螢幕、滑鼠甚至是鍵盤，因為這些電腦的主要目的就是儲存這些資料並且提供服務。 That's why they're called *servers* – because they *serve* you data.

OK, but you want to know how the Internet looks, right?

我們為你畫了張示意圖，它看起來像是這樣:

![Figure 1.1](images/internet_1.png)

看起來真是一團亂吧？ In fact it is a network of connected machines (the above-mentioned *servers*). 成千上萬台的機器啊！ 非常、非常多公里長的電纜存在在這整個世界上！ 你可以訪問一個叫做 Submarine 纜線地圖 (http://submarinecablemap.com/) 的網站，去看看這個連結有多複雜。 這是網站中的一個截圖：

![Figure 1.2](images/internet_3.png)

這真是無法想像，對吧？ But it is not possible to have a wire between every machine connected to the Internet. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

這件事看起來就像是這樣：

![Figure 1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

你的信會先送到最近的郵局。 然後再送到下一個離你的收件地址更近一點的，然後再下一個，直到這封信被傳遞到目的地為止。 唯一一件比較特別的事是如果你送了頻繁的信(*封包 data packets*) 到同一個地址，每一封信都會經由完全不同的郵局(*路由 routers*)。 這是依據他們如何被分散到各個郵局。

![Figure 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Instead of paper and pen you use bytes of data, but the idea is the same!

除了有國家、郵遞區號、城市與街道名稱所組成的地址，我們也使用 IP 作為地址。 你的電腦會先要求網域系統 (DNS - Domain Name System) 將 djangogirls.org 這個網域轉換為 IP。 It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. 你也需要使用收件者可以理解的語言，對吧？ 這與你依順序送出的 *封包* 要求觀看一個網站其實是同一件事。 你使用一個被稱為 HTTP (超文本轉換協定) 的協定。

所以呢，基本上，當你有了一個網站程式你也需要有一個 *伺服器* (機器) 讓你的網站活起來。 這個 *伺服器* 一直在等待來自各方的 *要求 request* (這個詞意思是要求伺服器傳回你的網站資料)，然後伺服器會就回應你你要求的網站 (response) 。

Since this is a Django tutorial, you might ask what Django does. 當你需要回傳一個回應，你並不想總是對所有人回傳同一個回應。 你的信是更加個人化的、更加特別針對某個人只為你量身打造的，豈不是更好嗎？ Django 可以説明您創建這些個人化的、 有趣的信. :)

Enough talk – time to create!