# Як працює Інтернет

> For readers at home: this chapter is covered in the [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) video.
> 
> This chapter is inspired by the talk "How the Internet works" by Jessica McKellar (http://web.mit.edu/jesstess/www/).

We bet you use the Internet every day. But do you actually know what happens when you type an address like https://djangogirls.org into your browser and press `enter`?

The first thing you need to understand is that a website consists of a bunch of files saved on a hard disk -- just like your movies, music, or pictures. However, there is one part that is unique for websites: they include computer code called HTML.

If you're not familiar with programming, it can be hard to grasp HTML at first, but your web browsers (like Chrome, Safari, Firefox, etc.) love it. Веб-браузери пристосовані для того, щоб розуміти цей код, виконувати його інструкції та показувати файли, з яких складається ваш сайт, саме так як ви хочете.

Як і з кожним файлом, нам потрібно зберігати HTML файли в певному місці на жорсткому диску. В Інтернеті ми використовуємо спеціальні потужні комп'ютери, що називаються *серверами*. Вони не мають екрану, мишки чи клавіатури тому, що їхня основна ціль -- зберігати і обробляти дані. That's why they're called *servers* – because they *serve* you data.

OK, but you want to know how the Internet looks, right?

Ми намалювали для вас картинку! Вона виглядає наступним чином:

![Figure 1.1](images/internet_1.png)

Виглядає як суцільний безлад, чи не так? In fact it is a network of connected machines (the above-mentioned *servers*). Сотні тисяч машин! Багато-багато кілометрів кабелю по усьому світу! Можете відвідати веб сайт Submarine Cable Map (http://submarinecablemap.com/), щоб побачити, наскільки складною є мережа. Тут наведено скріншот з веб-сайту:

![Figure 1.2](images/internet_3.png)

Вражаюче, чи не так? But it is not possible to have a wire between every machine connected to the Internet. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

Це виглядатиме так:

![Figure 1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

Ваш лист надійде до найближчого поштового віділення. Далі він надходить до іншого, що знаходиться трохи ближче до вашого адресата, далі до іншого і так далі, поки не буде досягнуто остаточного пункту призначення. Єдина відмінність в тому, що при відправці багатьох листів (*пакетів даних*) в однакове місце, кожен з них може піти через абсолютно різні поштові відділення (*маршрутизатори*). Це залежить від того, як їх розподілили в кожному відділенні.

![Figure 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Instead of paper and pen you use bytes of data, but the idea is the same!

Замість адрес із назвами вулиці, міста, індексом і назвою країни, ми використовуємо IP адреси. Ваш комп'ютер спочатку запитує про DNS (англ. Domain Name System - Система доменних імен) для переводу djangogirls.org в IP адресу. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

Коли ви відправляєте листа, це потребує наявності певних властивостей для коректної доставки: адреса, штамп тощо. Також ви використовуєте мову, котру розуміє отримувач, правда ж? Те ж саме стосується і *пакетів даних*, які ви відправляєте, щоб побачити веб-сайт. Ми використовуємо протокол, який називається HTTP (англ. Hypertext Transfer Protocol, протокол передачі гіпер-текстових документів).

Отже, по суті, коли у вас є веб сайт вам треба мати *сервер* (машину), де він житиме. Коли *сервер* отримує вхідний *запит* (в листі), він відправляє назад ваш веб-сайт (в іншому листі).

Оскільки це є навчальний посібник з Django, ви запитаєте що ж робить Django. Коли ви відправляєте відповідь, то не завжди бажаєте відправляти одне й те саме кожному. Набагато краще якщо ваші листи є персоналізованими, особливо для осіб, які щойно вам написали, правда ж? Django допомагає вам зі створенням цих персоналізованих, цікавих листів. :)

Досить говорити - час творити!