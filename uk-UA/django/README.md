# Що таке Django?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) is a free and open source web application framework, written in Python. Веб фреймворк - набір компонентів, які допомагають розробляти веб-сайти швидше і простіше.

При побудові веб-сайту, ви завжди потребуєте схожого набору компонентів: способу управління авторизацією користувача (створення акаунту, вхід, вихід), панелі управління, форм, способу завантажити файли, тощо.

Luckily for you, other people long ago noticed that web developers face similar problems when building a new site, so they teamed up and created frameworks (Django being one of them) that give you ready-made components to use.

Frameworks exist to save you from having to reinvent the wheel and to help alleviate some of the overhead when you’re building a new site.

## Навіщо вам потрібен фреймворк?

To understand what Django is actually for, we need to take a closer look at the servers. The first thing is that the server needs to know that you want it to serve you a web page.

Уявіть собі поштову скриньку (порт), котра моніториться на вхідні листи (запити). Це здійснюється веб сервером. The web server reads the letter and then sends a response with a webpage. Але коли ви бажаєте відправити дещо, вам потрібно мати деякий вміст. І Django є інструментом, котрий допомагає вам створити цей контент.

## Що трапляється коли хтось надсилає запит на веб-сайт з вашого серверу?

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Уявіть листоношу з листом. Вона йде по вулиці і звіряє номер кожного будинку з тим що вказаний в адресі отримувача. Якщо номер співпадає, вона кладе листа в скриньку. Аналогічним чином працює urlresolver!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Можливо, користувач може попросити зробити певні зміни даних? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

The description above is a little bit simplified, but you don't need to know all the technical things yet. Having a general idea is enough.

So instead of diving too much into details, we will start creating something with Django and we will learn all the important parts along the way!