# Hur Internet fungerar

> For readers at home: this chapter is covered in the [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) video.
> 
> This chapter is inspired by the talk "How the Internet works" by Jessica McKellar (http://web.mit.edu/jesstess/www/).

We bet you use the Internet every day. But do you actually know what happens when you type an address like https://djangogirls.org into your browser and press `enter`?

The first thing you need to understand is that a website consists of a bunch of files saved on a hard disk. Precis som dina filmklipp, musik och bilder. Men det finns en sak som är unikt för hemsidor: de innehåller programkod som kallas HTML.

Om du inte är van vid programmering kan det vara svårt att förstå HTML till en början, men din webbläsare (t.ex. Chrome, Safari, Firefox, etc.) älskar det. Webbläsare är designade för att förstå denna kod, följa dess instruktioner och presentera alla filer som din hemsida är gjord av precis på det sättet som du vill att de ska presenteras.

Precis som med alla filer måste vi lagra HTML-filer någonstans på en hårddisk. För Internet använder vi speciella kraftfulla datorer som kallas *servrar*. De har ingen skärm, mus eller tangentbord, för deras huvudsyfte är att lagra data och göra den åtkomlig. That's why they're called *servers* – because they *serve* you data.

OK, but you want to know how the Internet looks, right?

Vi har ritat en bild åt dig! Så här ser det ut:

![Figur 1.1](images/internet_1.png)

Visst ser det stökigt ut? In fact it is a network of connected machines (the above-mentioned *servers*). Hundratusentals datorer! Många, många mil av kabel runt världen! Du kan besöka en karta över undervattenskablar (http://submarinecablemap.com) som visar hur komplicerat nätet är. Här är en skärmdump från hemsidan:

![Figur 1.2](images/internet_3.png)

Visst är det fascinerande? But it is not possible to have a wire between every machine connected to the Internet. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

Så här ser det ut:

![Figur 1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

Ditt brev går till postkontoret närmast dig. Sen skickas det vidare till ett kontor som är lite närmare adressaten, och så vidare tills det når sin destination. Det unika är att även om du skickar många brev (*datapaket*) till samma plats kan de transporteras via helt olika postkontor (*routrar*). Det beror på hur de distribueras vid varje kontor.

![Figur 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Instead of paper and pen you use bytes of data, but the idea is the same!

Istället för adresser med gatunamn, ort, postnummer och land, använder vi IP-adresser. Din dator ber en DNS-server (Domain Name System) att översätta djangogirls.org till en IP-adress. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. Du använder även ett språk som mottagaren förstår, eller hur? Detsamma gäller de *datapaket* som du skickar till en webbplats. Vi använder ett protokoll som kallas HTTP (Hypertext Transfer Protocol).

Så när du har en hemsida måste du helt enkelt ha en *server* där den bor. När *servern* tar emot en inkommande *begäran* (i ett brev), skickar den tillbaka din webbplats (i ett annat brev).

Since this is a Django tutorial, you might ask what Django does. När du skickar ett svar, vill du inte alltid skicka samma sak till alla. Det är mycket bättre om dina brev är personliga till personen som precis har skrivit till dig, eller hur? Django hjälper dig att skapa dessa personliga, intressanta brev. :)

Enough talk – time to create!