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
4. На панели управления AWS введи *Cloud9* в поисковой строке и кликни
5. На панели управления Cloud 9 нажми *Create environment*
6. Назови его *django-girls*
7. При конфигурировании настроек выбери *Create a new instance for environment (EC2)* в "Environment Type" и *t2.micro* "Instance type" (он должен вернуть тебе ответ "Free-tier eligible."). Все настройки по умолчанию в порядке, и ты также можешь выставлять по умолчанию и остальные настройки.
8. Нажми *Next step*
9. Нажми *Create environment*

Теперь ты должна увидеть интерфейс боковой панели, большое главное окно с текстом и небольшое окно в нижней части, которая выглядит примерно так:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

Эта нижняя область - твой терминал. Терминал можно использовать для отправки инструкций на удаленный компьютер Cloud 9. Ты можешь изменить размер этого окна, чтобы увеличить терминал.

### Виртуальное окружение

Виртуальное окружение (также называемое virtualenv или venv) является "коробкой", куда мы можем сложить полезные для нашей программы вещи. Мы используем его, чтобы держать различные биты кода, которые мы хотим использовать для нашего проекта отдельно, не смешивая с другими проектами.

Запусти:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(обрати внимание, что в последней строке мы используем знак равенства после знака тильды: `~=`).

### GitHub

Создайте аккаунт на [GitHub](https://github.com).

### PythonAnywhere

Django Girls пособие включает в себя раздел о "развертывании". Это процесс взятия кода, на котором работает ваше новой веб-приложение, и перемещения его на общедоступный компьютер (называемый сервером), чтобы другие люди могли видеть вашу работу.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).