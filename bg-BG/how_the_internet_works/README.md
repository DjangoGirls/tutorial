# Как работи интернет

> За читателите у дома: тази глава е разгледана във видеото [Как работи интернет](https://www.youtube.com/watch?v=oM9yAA09wdc).
> 
> Тази глава е вдъхновена от беседата "Как работи Интернет" от Джесика Маккелар (http://web.mit.edu/jesstess/www/).

Обзалагаме се, че използвате интернет всеки ден. Но всъщност знаете ли какво се случва, когато въведете адрес като https://djangogirls.org в браузъра си и натиснете `enter`?

Първото нещо, което трябва да разберете е, че уебсайтът се състои от куп файлове, записани на твърд диск - точно като вашите филми, музика или снимки. Има обаче една част, която е уникална за уебсайтовете: те включват компютърен код, наречен HTML.

Ако не сте запознати с програмирането, в началото може да е трудно да разберете HTML, но вашите уеб браузъри (като Chrome, Safari, Firefox и др.) го харесват. Уеб браузърите са създадени да разбират този код, да следват неговите инструкции и да представят тези файлове, от които е направен уебсайтът ви, точно по начина, по който искате.

Както при всеки файл, ние трябва да съхраняваме HTML файлове някъде на твърд диск. За интернет използваме специални, мощни компютри, наречени *сървъри*. Те нямат екран, мишка или клавиатура, защото основната им цел е да съхраняват данни и да ги предоставят. Ето защо те се наричат *сървъри* - защото те *предоставят* вашите данни.

Добре, но искате да знаете как изглежда интернет, нали?

Нарисувахме ви снимка! Изглежда така:

![Figure 1.1](images/internet_1.png)

Прилича на каша, нали? Всъщност това е мрежа от свързани машини (гореспоменатите *сървъри*). Стотици хиляди машини! Много, много километри кабели по света! Можете да посетите уебсайта на Submarine Cable Map (http://submarinecablemap.com), за да видите колко сложна е мрежата. Here is a screenshot from the website:

![Figure 1.2](images/internet_3.png)

It is fascinating, isn't it? But it is not possible to have a wire between every machine connected to the Internet. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

It looks like this:

![Figure 1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

Your letter goes to the post office closest to you. Then it goes to another that is a bit nearer to your addressee, then to another, and another until it is delivered at its destination. The only unique thing is that if you send many letters (*data packets*) to the same place, they could go through totally different post offices (*routers*). This depends on how they are distributed at each office.

![Figure 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Instead of paper and pen you use bytes of data, but the idea is the same!

Instead of addresses with a street name, city, zip code and country name, we use IP addresses. Your computer first asks the DNS (Domain Name System) to translate djangogirls.org into an IP address. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. You also use a language that the receiver understands, right? The same applies to the *data packets* you send to see a website. We use a protocol called HTTP (Hypertext Transfer Protocol).

So, basically, when you have a website, you need to have a *server* (machine) where it lives. When the *server* receives an incoming *request* (in a letter), it sends back your website (in another letter).

Since this is a Django tutorial, you might ask what Django does. When you send a response, you don't always want to send the same thing to everybody. It is so much better if your letters are personalized, especially for the person that has just written to you, right? Django helps you with creating these personalized, interesting letters. :)

Enough talk – time to create!