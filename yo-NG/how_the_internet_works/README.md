# Bí Íńtánẹ́ẹ̀tì ṣé n ṣiṣẹ́

> Fún àwọn òǹkàwé ní ilé: a ti ṣàlàyé àkòrí yìí nínú fídíò [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc).
> 
> Ọ̀rọ̀ àsọyé "How the Internet works" ti Jessica McKellar (http://web.mit.edu/jesstess/www/) ló gbà wá níyànjú láti kọ àkòrí yìí.

We bet you use the Internet every day. But do you actually know what happens when you type an address like https://djangogirls.org into your browser and press `enter`?

Nnkan àkọ́kọ́ tí o nílò láti mọ̀ ni pé ààyè ayélujára kan jẹ́ àpapọ̀ àwọn fáìlì kan tí a tọ́jú sórí ibi ìpamọ́ kan. Gẹ́gẹ́ bí àwọn fídíò, orin, tàbí àwòrán rẹ. Àmọ́ o, apá kan wà tó jẹ́ àkànṣe fún àwọn ààyè ayélujára: wọ́n kó kóòdù kọ̀mpútà tí a n pè ní HTML sínú.

Tí ìwọ kò bá fi bẹ́ẹ̀ mọ̀ nípa kóòdù kíkọ ó lè ṣòro láti mọ HTML lákọ̀ọ́kọ́, ṣùgbọ́n àwọn aṣàwákiri ayélujára rẹ (bíi Chrome, Safari, Firefox, àti bẹ́ẹ̀ bẹ́ẹ̀ lọ) nífẹ̀ẹ́ sí i. A ṣètò àwọn aṣàwákiri ayélujára láti lóye kóòdù yìí, tẹ̀lé àwọn ìtọ́sọ́nà rẹ̀, àti ṣàgbékalẹ̀ àwọn fáìlì wọ̀nyí tí ààyè ayélujára rẹ kó sínú, bí o ṣe fẹ́ kó rí gan-an.

Gẹ́gẹ́ bí ó ti rí pẹ̀lú gbogbo fáìlì, a nílò láti tọ́jú àwọn fáìlì HTML sí ibìkan lórí ibi ìpamọ́ kan. Fún Íńtánẹ́ẹ̀tì náà, a má n lo àwọn àkànṣe kọ̀mpútà tó lágbára púpọ̀ tí a n pè ní àwọn *server*. Wọn kò ní ojú àwòrán kan, atọ́ka tàbí pẹpẹ bọ́tìnnì kan, nítorí pé ìdí pàtàkì wọn ní láti tọ́jú dátà àti pèsè rẹ̀. Ìdí nìyẹn tí a fí n pè wọ́n ní àwọn *server* – nítorí pé wọ́n *pèsè (serve)* dátà fún ẹ.

Ó dáa, ṣùgbọ́n o fẹ́ mọ bí Íńtánẹ́ẹ̀tì náà ṣe rí, àbí bẹ́ẹ̀ kọ?

A ya àwòrán kan fún ọ! Ó rí báyìí:

![Figure 1.1](images/internet_1.png)

Looks like a mess, right? In fact it is a network of connected machines (the above-mentioned *servers*). Hundreds of thousands of machines! Many, many kilometers of cables around the world! You can visit a Submarine Cable Map website (http://submarinecablemap.com) to see how complicated the net is. Here is a screenshot from the website:

![Figure 1.2](images/internet_3.png)

It is fascinating, isn't it? But it is not possible to have a wire between every machine connected to the Internet. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

It looks like this:

![Figure 1.3](images/internet_2.png)

Wòye pé nígbà tí o bá tẹ https://djangogirls.org, o fi lẹ́tà kan ránṣẹ́ tó sọ wípé: "Django Girls Ọ̀wọ́n, Mo fẹ́ rí ààyè ayélujára djangogirls.org náà. Fi ránṣẹ́ sí mi, jọ̀wọ́!"

Lẹ́tà rẹ yíò lọ sí ilé iṣẹ́ ìfìwéránṣẹ́ tó súnmọ́ ẹ jù. Lẹ́yìn náà yíò lọ sí òmíràn tó tún súnmọ́ díẹ̀ sí olùgbà lẹ́tà rẹ, lẹ́yìn náà sí òmíràn, àti òmíràn títí dìgbà tí yíò fi dé ibi tó n lọ. The only unique thing is that if you send many letters (*data packets*) to the same place, they could go through totally different post offices (*routers*). This depends on how they are distributed at each office.

![Figure 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Instead of paper and pen you use bytes of data, but the idea is the same!

Instead of addresses with a street name, city, zip code and country name, we use IP addresses. Your computer first asks the DNS (Domain Name System) to translate djangogirls.org into an IP address. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. You also use a language that the receiver understands, right? The same applies to the *data packets* you send to see a website. We use a protocol called HTTP (Hypertext Transfer Protocol).

So, basically, when you have a website, you need to have a *server* (machine) where it lives. When the *server* receives an incoming *request* (in a letter), it sends back your website (in another letter).

Torí pé èyí jẹ́ àlàyé Django kan, o lè béèrè ohun tí Django n ṣe. Nígbà tí o bá fi ìdáhùn kan ránṣẹ́, ìwọ kò ní fẹ́ fi ohun kannáà ránṣẹ́ sí gbogbo èèyàn ní gbogbo ìgbà. It is so much better if your letters are personalized, especially for the person that has just written to you, right? Django helps you with creating these personalized, interesting letters. :)

Ọ̀rọ̀ tí a sọ ti tó – àkọ́kọ́ láti ṣẹ̀dá!