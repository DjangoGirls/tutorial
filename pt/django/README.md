# O que é Django?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) is a free and open source web application framework, written in Python. Um web framework é um conjunto de componentes que ajuda você a desenvolver sites de forma mais rápida e fácil.

Quando você está construindo um site, você sempre precisa de um conjunto similar de componentes: uma maneira de lidar com a autenticação do usuário (inscrever-se, realizar login, realizar logout), um painel de gerenciamento para o seu site, formulários, uma forma de upload de arquivos, etc.

Luckily for you, other people long ago noticed that web developers face similar problems when building a new site, so they teamed up and created frameworks (Django being one of them) that give you ready-made components to use.

Frameworks exist to save you from having to reinvent the wheel and to help alleviate some of the overhead when you’re building a new site.

## Por que você precisa de um framework?

To understand what Django is actually for, we need to take a closer look at the servers. The first thing is that the server needs to know that you want it to serve you a web page.

Imagine uma caixa de correio (porta) que é monitorada por cartas recebidas (requisição). Isso é feito por um servidor web. The web server reads the letter and then sends a response with a webpage. Mas, quando você quer enviar alguma coisa você precisa ter um conteúdo. E o Django é aquilo que vai lhe ajudar a criar esse conteúdo.

## O que acontece quando alguém solicita um site do seu servidor?

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Imagine um carteiro com uma carta. Ela está andando pela rua e verifica cada número de casa com a que está na carta. Se ele corresponder, ela coloca a carta lá. É assim que funciona o urlresolver!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Talvez o usuário queira mudar algo nos dados? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

Claro, a descrição acima é muito simplificada, mas você não precisa saber detalhes técnicos ainda. Ter uma ideia geral já é suficiente.

Então em vez de mergulhar em muitos detalhes, nós simplesmente vamos começar criando algo com o Django e aprenderemos toda as partes importantes ao longo do caminho!