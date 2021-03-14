# Ի՞նչ է Django- ն:

Django (/ ˈdʒæŋɡoʊ / * jang-goh *) ազատ և բաց կոդով վեբ հավելվածների շրջանակ է, որը գրված է Python- ում: Վեբ շրջանակը բաղկացուցիչ մաս է կազմում, որն օգնում է ձեզ կայքերն ավելի արագ և հեշտ զարգացնել:

Երբ կայք եք կառուցում, ձեզ միշտ անհրաժեշտ է բաղադրիչների նմանատիպ շարք. Օգտագործողի վավերացումը կարգավորելու միջոց (գրանցվել, մուտք գործել, դուրս գալ), ձեր կայքի կառավարման վահանակ, ձևաթղթեր, ֆայլեր վերբեռնելու միջոց և այլն:

Բարեբախտաբար ձեզ համար, այլ մարդիկ վաղուց էին նկատել, որ վեբ մշակողները նման խնդիրներ են ունենում նոր կայք կառուցելիս, այնպես որ նրանք միավորվել և ստեղծել են շրջանակներ (դրանցից մեկը Django- ն է), որոնք ձեզ տալիս են պատրաստի բաղադրիչներ օգտագործման համար:

Շրջանակները (Frameworks) գոյություն ունեն, որպեսզի փրկեն ձեզ անիվը նորից գյուտելուց և օգնելու թեթեւացնել որոշ վերերկրյա գումարներ, երբ նոր կայք եք կառուցում:

## Ինչու՞ է ձեզ անհրաժեշտ շրջանակ:

To understand what Django is actually for, we need to take a closer look at the servers. The first thing is that the server needs to know that you want it to serve you a web page.

Imagine a mailbox (port) which is monitored for incoming letters (requests). This is done by a web server. The web server reads the letter and then sends a response with a webpage. But when you want to send something, you need to have some content. And Django is something that helps you create the content.

## What happens when someone requests a website from your server?

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Imagine a mail carrier with a letter. She is walking down the street and checks each house number against the one on the letter. If it matches, she puts the letter there. This is how the urlresolver works!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Maybe the user asked to change something in the data? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

The description above is a little bit simplified, but you don't need to know all the technical things yet. Having a general idea is enough.

So instead of diving too much into details, we will start creating something with Django and we will learn all the important parts along the way!