# Как работает Интернет

> For readers at home: this chapter is covered in the [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) video.
> 
> This chapter is inspired by the talk "How the Internet works" by Jessica McKellar (http://web.mit.edu/jesstess/www/).

We bet you use the Internet every day. But do you actually know what happens when you type an address like https://djangogirls.org into your browser and press `enter`?

The first thing you need to understand is that a website consists of a bunch of files saved on a hard disk. Так же, как твои фильмы, музыка или фотографии. Тем не менее, есть одна особенность, которая является уникальной для сайтов: они содержат компьютерный код, называемый HTML.

Если ты не знакома с программированием, то сначала может быть трудно понять HTML, но твой веб-браузер (например, Chrome, Safari, Firefox, и т. д.) обожает его. Веб-браузеры созданы для того чтобы понимать этот код, следовать его указаниям и представлять файлы, из которых состоит твой веб-сайт, именно так, как ты этого хочешь.

Как и с любым файлом, нам нужно хранить HTML файлы где-то на жестком диске. Для Интернета мы используем специальные мощные компьютеры, называемые *серверами*. У них нет экрана, мыши или клавиатуры, потому что их основной целью является хранение и обслуживание данных. That's why they're called *servers* – because they *serve* you data.

OK, but you want to know how the Internet looks, right?

Мы нарисовали тебе картинку! Он выглядит вот так:

![Рисунок 1.1](images/internet_1.png)

Довольно беспорядочно, правда? In fact it is a network of connected machines (the above-mentioned *servers*). Сотен тысяч машин! Много, много километров кабелей по всему миру! Ты можешь посетить веб-сайт с картой подводных кабелей (http://submarinecablemap.com/), чтобы увидеть, насколько сложной является сеть. Вот скриншот с сайта:

![Рисунок 1.2](images/internet_3.png)

Поразительно, не так ли? But it is not possible to have a wire between every machine connected to the Internet. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

Это выглядит приблизительно так:

![Рисунок 1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

Твое письмо отправляется в ближайшее почтовое отделение. Затем оно направляется в другое, которое немного ближе к адресату, а затем в следующее и так далее до его доставки в пункт назначения. Единственное отличие в том, что при отправке множества писем (*пакетов данных*) по одному адресу, каждое из них может пойти через совершенно разные почтовые отделения (*маршрутизаторы*). Это зависит от того, как они были распределены в каждом отделении.

![Рисунок 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Instead of paper and pen you use bytes of data, but the idea is the same!

Вместо адресов с названием улицы, города, почтового индекса и названия страны мы используем IP-адреса. Твой компьютер сначала просит DNS (Domain Name System) перевести djangogirls.org в IP-адрес. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. Ты также используешь язык, который понимает получатель, верно? То же самое относится к *пакетам данных*, которые ты отправляешь, чтобы увидеть веб-сайт. Мы используем протокол под названием HTTP (англ. HyperText Transfer Protocol, протокол передачи гипертекста).

Поэтому, в принципе, когда у тебя есть веб-сайт, то необходимо иметь и *сервер* (машину), где он находится. Когда *сервер* получает входящий *запрос* (в письме), он отправляет обратно твой веб-сайт (в другом письме).

Since this is a Django tutorial, you might ask what Django does. Когда ты отправляешь ответ, то ты не всегда хочешь отправлять одно и то же письмо всем получателям. Намного лучше, если твои письма являются персонифицированными, особенно для человека, который только что сам тебе написал, правильно? Django помогает нам с созданием этих персонализированных, интересных писем. :)

Enough talk – time to create!