Можешь [пропустить этот раздел](http://tutorial.djangogirls.org/en/installation/#install-python), если ты не используешь Chromebook. Если же у тебя Chromebook, процесс установки будет немного иным. Ты можешь игнорировать остальные инструкции по установке.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE - это инструмент, предоставляющий тебе редактор кода и доступ к компьютеру в интернете, на котором ты можешь установить, записать и выполнить программу. На протяжении данного урока Cloud IDE будет использоваться как твой *локальный компьютер*. Ты будешь работать в терминале (так же, как и твои одноклассники на OS X, Ubuntu или Windows), но твой терминал будет подключен к компьютеру где-нибудь в Нидерландах или Германии, который Cloud9 установили специально для тебя. Вот инструкции для облачных сред разработки (IDE PaizaCloud облако, AWS Cloud9). Ты можешь выбрать одну из облачных IDE. Далее следуй инструкциям.

#### PaizaCloud Cloud IDE

1. Перейди на [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Зарегистрируй аккаунт
3. Нажми *New Sever* и выбери *Django app*
4. Нажмите кнопку запуска (в левой части окна)

Теперь ты должна увидеть интерфейс с боковой панелью, кнопки слева. Нажми кнопку запуска, чтобы открыть окно терминала со строкой вроде этой:

{% filename %}Terminal{% endfilename %}

    $
    

Терминал на PaizaCloud Cloud IDE готов для твоих инструкций. Ты можешь изменить или развернуть это окно, чтобы сделать его немного больше.

#### AWS Cloud9

Currently Cloud 9 requires you to sign up with AWS and enter credit card information.

1. Установи Cloud 9 из [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Перейди на [c9.io](https://c9.io) и нажми *Get started with AWS Cloud9*
3. Войди при помощи аккаунта AWS (необходимы данные кредитной карты, но ты можешь пользоваться бесплатно)
4. На дашборде AWS введи *Cloud9* в поисковой строке и кликни
5. In the Cloud 9 dashboard, click *Create environment*
6. Name it *django-girls*
7. While configuring settings, select *Create a new instance for environment (EC2)* for "Environment Type" and the *t2.micro* "Instance type" (it should say "Free-tier eligible."). The default cost-saving setting is fine and you can keep the other defaults.
8. Click *Next step*
9. Click *Create environment*

Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your terminal. You can use the terminal to send instructions to the remote Cloud 9 computer. You can resize that window to make it a bit bigger.

### Виртуальное окружение

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

Run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).