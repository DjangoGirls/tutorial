Можеш да [пропуснеш този раздел](http://tutorial.djangogirls.org/en/installation/#install-python), ако не използваш Chromebook. If you are, your installation experience will be a little different. You can ignore the rest of the installation instructions.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE е инструмент който ти дава редактор на код и достъп до компютър, работещ по Интернет, където ти можеш да инсталираш, пишеш и пускаш софтуер. За продължителността на ръководството, cloud IDE ще ти служи като твоя *локална машина*. Все пак ще пишеш команди в терминал, също като твоите съученици на OS X, Ubuntu или Windows, но той ще бъде свързан с компютър, работещ някъде другаде, който cloud IDE прави за теб. Here is the instructions for cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9). You can choose one of the cloud IDEs, and follow the instruction of the cloud IDE.

#### PaizaCloud Cloud IDE

1. Отиди на [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Направи акаунт
3. Натисни *New Server* и избери Django приложение
4. Натисни бутон на Терминал (от лявата страна на прозореца)

Сега трябва да виждаш интерфейс със сайдбар, бутони наляво. Натисни бутона "Терминал" с такъв надпис:

{% filename %}Terminal{% endfilename %}

    $
    

Терминалът на PaizaCloud Cloud IDE е готов за твоите инструции. Можеш да увеличиш прозореца за да го направиш малко по-голям.

#### AWS Cloud9

Понастоящем, Cloud 9 изисква от теб да се регистрираш с AWS и да въведеш информация за кредитната си карта.

1. Инсталирай Cloud 9 от [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Отиди на [c9.io](https://c9.io) и натисни *Get started with AWS Cloud9*
3. Регистрирай се за AWS акаунт (изисква информация за кредитна карта, но можеш да го използваш безплатно)
4. В AWS Dashboard, напиши *Cloud9* в поисковата линия и я натисни
5. В Cloud 9 табло, натисни *Create environment*
6. Нареки го *django-girls*
7. Конфигурирайки настройките, избери *Create a new instance for environment (EC2)* за "Environment Type" и *t2.micro* "Instance type" (трябва да пише "Free-tier eligible."). Нормалната намаляваща разходи настройка е добре, можеш и да оставиш други.
8. Натисни *Next step*
9. Натисни *Create environment*

Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your terminal. You can use the terminal to send instructions to the remote Cloud 9 computer. You can resize that window to make it a bit bigger.

### Виртуална среда

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

Пусни:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Направи [GitHub](https://github.com) акаунт.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).