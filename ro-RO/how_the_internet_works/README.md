# Cum funcționează Internetul

> For readers at home: this chapter is covered in the [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) video.
> 
> This chapter is inspired by the talk "How the Internet works" by Jessica McKellar (http://web.mit.edu/jesstess/www/).

We bet you use the Internet every day. But do you actually know what happens when you type an address like https://djangogirls.org into your browser and press `enter`?

The first thing you need to understand is that a website consists of a bunch of files saved on a hard disk. Just like your movies, music, or pictures. Totuși, paginile web au ceva special: conțin un cod numit HTML.

If you're not familiar with programming it can be hard to grasp HTML at first, but your web browsers (like Chrome, Safari, Firefox, etc.) love it. Web browsers are designed to understand this code, follow its instructions, and present these files that your website is made of, exactly the way you want.

Ca orice fișier, și cele care conțin HTML trebuie stocate undeva, pe un hard disk. În cazul internetului, folosim computere speciale foarte puternice numite *servere*. Ele nu au monitor, mouse sau tastatură pentru că principalul lor scop e să stocheze și să livreze date. That's why they're called *servers* – because they *serve* you data.

OK, but you want to know how the Internet looks, right?

Ți-am desenat o schemă! Arată așa:

![Figura 1.1](images/internet_1.png)

Cam haos, nu? In fact it is a network of connected machines (the above-mentioned *servers*). Sute de mii de computere! Mulți, mulți kilometri de cabluri în toată lumea! You can visit a Submarine Cable Map website (http://submarinecablemap.com) to see how complicated the net is. Uite un screenshot de pe site:

![Figura 1.2](images/internet_3.png)

E fascinant, nu-i așa? But it is not possible to have a wire between every machine connected to the Internet. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

Arată așa:

![Figura 1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

Scrisoarea ta ajunge la oficiul poștal cel mai apropiat. Then it goes to another that is a bit nearer to your addressee, then to another, and another until it is delivered at its destination. The only unique thing is that if you send many letters (*data packets*) to the same place, they could go through totally different post offices (*routers*). This depends on how they are distributed at each office.

![Figura 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Instead of paper and pen you use bytes of data, but the idea is the same!

În loc de adrese cu numele străzii, oraș, cod și numele țării, folosim adrese IP. Computerul tău cere de la DNS (Domain Name System) să traducă djangogirls.org într-o adresă IP. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. De asemeni, folosești un limbaj pe care destinatarul îl înțelege, nu? The same applies to the *data packets* you send to see a website. We use a protocol called HTTP (Hypertext Transfer Protocol).

So, basically, when you have a website, you need to have a *server* (machine) where it lives. When the *server* receives an incoming *request* (in a letter), it sends back your website (in another letter).

Since this is a Django tutorial, you might ask what Django does. Când trimiți un răspuns, nu vrei întotdeauna să trimiți același lucru tuturor. E mult mai bine dacă scrisorile tale sunt personalizate special pentru persoana care tocmai ți-a scris, nu? Django te ajută să creezi aceste scrisori personalizate și interesante. :)

Enough talk – time to create!