Можешь [пропустить этот раздел](http://tutorial.djangogirls.org/en/installation/#install-python), если ты не используешь Chromebook. Если же у тебя Chromebook, процесс установки будет немного иным. Ты можешь игнорировать остальные инструкции по установке.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE - это инструмент, предоставляющий вам редактор кода и доступ к компьютеру в интернете, на котором вы можете установить, записать и установить программу. На протяжении данного урока Cloud IDE будет использоваться как ваш *локальный компьютер*. Вы будете работать в терминале (так же, как и ваши одноклассники на OS X, Ubuntu или Windows), но ваш терминал будет подключен к компьютеру где-нибудь в Нидерландах или Германии, которых Cloud9 установили специально для вас. Вот инструкции для облачных сред разработки (IDE PaizaCloud облако, AWS Cloud9). Вы можете выбрать одну из облачных IDE. Далее следуйте инструкциям.

#### PaizaCloud Cloud IDE

1. Перейдите на [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Зарегистрируйте аккаунт
3. Нажмите *New Server*
4. Нажмите кнопку запуска (в левой части окна)

Теперь вы должны увидеть интерфейс с боковой панелью, кнопки слева. Нажмите кнопку запуска, чтобы открыть окно терминала со строкой вроде этой:

{% filename %}Terminal{% endfilename %}

    $
    

Терминал на PaizaCloud Cloud IDE готово для ваших инструкций. Вы можете изменить или развернуть это окно, чтобы сделать его немного больше.

#### AWS Cloud9

1. Перейдите на [AWS Cloud9](https://aws.amazon.com/cloud9/)
2. Зарегистрируйте аккаунт
3. Нажмите *Create Environment* (создать окружение)

Теперь вы должны увидеть интерфейс боковой панели, большое главное окно с текстом и небольшое окно в нижней части, которая выглядит примерно так:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

Эта нижняя область является вашим *терминалом*, где вы указываете компьютеру Cloud 9 ваши инструкции. Вы можете изменить размер этого окна, чтобы сделать его немного больше.

### Виртуальное окружение

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

In your terminal at the bottom of the Cloud 9 interface, run the following:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

If this still doesn't work, ask your coach for some help.

Далее запустите:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: ~=).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).