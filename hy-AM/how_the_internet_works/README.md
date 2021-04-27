# Ինչպես է աշխատում ինտերնետը

> Ընթերցողների համար տանը. Այս գլուխն ընդգրկված է [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) տեսանյութում
> 
> Այս գլուխը ներշնչված է Howեսիկա ՄաքՔելարի (http://web.mit.edu/jesstess/www/) "How the Internet works"(«Ինչպես է աշխատում ինտերնետը») զրույցից:

Մենք գրազ ենք գալիս, որ դուք ամեն օր ինտերնետ եք օգտագործում: Բայց գիտե՞ք իրականում, թե ինչ է պատահում, երբ ձեր զննարկչի մեջ մուտքագրում եք https://djangogirls.org- ի նման հասցե և սեղմում ` enter `:

Առաջին բանը, որ դուք պետք է հասկանաք, այն է, որ կայքը բաղկացած է կոշտ սկավառակի/ hard disk -ի վրա պահված մի շարք ֆայլերից, ինչպես ձեր ֆիլմերը, երաժշտությունը կամ նկարները: Այնուամենայնիվ, կա մեկ առանձնահատկություն, որը հատուկ է միայն կայքերին. Դրանք պարունակում են համակարգչային կոդ, որը կոչվում է HTML:

Եթե ​​դուք ծանոթ չեք ծրագրավորմանը, սկզբում դժվար կլինի հասկանալ HTML- ը, բայց ձեր վեբ բրաուզերները (օրինակ ՝ Chrome, Safari, Firefox և այլն) սիրում են այն: Վեբ բրաուզերները նախատեսված են հասկանալու այս կոդը, հետևելու նրա հրահանգներին և ներկայացնելու այն ֆայլերը, որոնցից կազմված է ձեր կայքը, ճիշտ այնպես, ինչպես ցանկանում եք:

Ինչպես ցանկացած ֆայլ, HTML ֆայլերը նույնպես պետք է պահենք ինչ-որ տեղ մեր կոշտ սկավառակի/hard disk-ի վրա: Ինտերնետի համար մենք օգտագործում ենք հատուկ հզոր համակարգիչներ, որոնք կոչվում են *servers/սերվերներ*: Նրանք չունեն էկրան, մկնիկ կամ ստեղնաշար, քանի որ նրանց հիմնական նպատակը տվյալների պահպանումն ու սպասարկումն է: Այդ պատճառով նրանց անվանում են *servers/սերվեր* , քանի որ դրանք ձեզ ծառայություն են *մատուցում*:

Շատ լավ, բայց ուզում եք իմանալ, թե ինչ տեսք ունի ինտերնետը, ճի՞շտ է:

Մենք նկարեցինք նկար ձեզ համար: Այն այսպիսի տեսք ունի.

![Figure 1.1](images/internet_1.png)

Կարծես խառնաշփոթ է, չէ՞: Իրականում դա միացված մեքենաների ցանց է (վերոհիշյալ *servers/սերվերները*): Հարյուր հազարավոր մեքենաներ: Շատ ու շատ կիլոմետրեր ճոպաններ/cables ամբողջ աշխարհում: Կարող եք այցելել սուզանավերի մալուխային քարտեզի/Submarine Cable Map կայք (http://submarinecablemap.com/) ՝ տեսնելու, թե որքան բարդ է ցանցը: Ահա կայքի սքրինշոթը.

![Figure 1.2](images/internet_3.png)

Դա զարմանալի է, այնպես չէ՞: Այնուամենայնիվ, հասկանալի է, որ հնարավոր չէ յուրաքանչյուր մեքենա մետաղալարով միացնել ինտերնետին: So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

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