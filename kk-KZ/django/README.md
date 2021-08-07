# Джанго деген не?

Django (/ˈdʒæŋɡoʊ/ *джэн-го*) ол бос және веб қосымша фреймворгы. Джангоның коды ашық және ол Питонда жазылған. Веб фреймворк - вебсайттарды тезірек және оңайырақ құруға көмектесетін компоненттердің жинағы.

Вебсайт құрғанда сізге әрдайым ұқсас компонентер керек. Мысалы: пайдаланушыны анықтап тануының өңдеу жолы (тіркелу, кіру, шығу), сайтты өзгертетін басқару тақтасы, форма, файлдарды жүктеу жолы және басқалары.

Қуанышқа орай, басқа адамдар бұрында веб дамытушылар жаңа сайт құрғанда бірдей мәселелерді кездесетінің байқаған. Сонда олар жиналды және фреймворктарды құрды (Джанго солардың қатарына кіреді). Фреймворк іске дайын компонентерді сізге қолдануға береді.

Дөнгелекті жаңадан құрудан сақтау ушін фреймворктар бар. Жәнеде жаңа сайт құрып жатқанда басты ауыртпау үшін.

## Фреймворк сізге не үшін керек?

Джанго не үшін керек екенің түсіну үшін, біз сервермен жақынырақ танысу керекпіз. Ең бастысы, сервер қандай вебпарақша орналастыру керек екенің білу керек.

Кіріс хаттарды бақылауға (сұраныс) арналған электрондық жәшікті елесте (порт). Соны бақылап тұратын веб-cервер. Веб сервер хатты оқиды, содан кейін вебпарақша түрінде жауапты жібереді. Бірақ сіз бір нәрсе жібергіңіз келсе, сізде бір контент болу керек. Джанго сол контентті құру үшін көмектеседі.

## Егер біреу сіздің серверінізде вебсайтқа сұраныс жасаса не болады? 

Егер веб серверге сұраныс келсе, онда ол Джангоға барады. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Imagine a mail carrier with a letter. She is walking down the street and checks each house number against the one on the letter. If it matches, she puts the letter there. This is how the urlresolver works!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Maybe the user asked to change something in the data? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

The description above is a little bit simplified, but you don't need to know all the technical things yet. Having a general idea is enough.

So instead of diving too much into details, we will start creating something with Django and we will learn all the important parts along the way!