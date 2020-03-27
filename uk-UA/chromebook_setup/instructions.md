Ви можете [перейти у цей розділ](http://tutorial.djangogirls.org/en/installation/#install-python), якщо ви не використовуєте Chromebook. Якщо ви використовуєте Chromebook, процес встановлення може відрізнятись. Ви можете ігнорувати інші інструкції з установки.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE це інструмент який надає вам редактор коду та доступ до комп'ютера в мережі Інтернет де ви можете встановлювати, писати та запускати програми. Протягом курсу, сloud IDE буде виконувати функцію вашого *локального ком'ютера*. Ви будете запускати команди в терміналі як і ваші одногрупники на OS X, Ubuntu або Windows, але ваш термінал буде керувати комп'ютером виділеним для вас Cloud IDE. Тут ви знайдете інструкції для Сloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9). Ви можете обрати одне з cloud IDE і використовувати інструкції для нього.

#### PaizaCloud Cloud IDE

1. Перейдіть на [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Зареєструйтесь
3. Клікніть «*New Server*» та виберіть «Django app»
4. Натисніть на кнопку Terminal (в лівій частині вікна)

Тепер ви маєте побачити інтерфейс з боковою панеллю так кнопками зліва. Натисніть кнопку Terminal щоб відкрити вікно терміналу з наступним виводом:

{% filename %}Terminal{% endfilename %}

    $
    

The terminal on the PaizaCloud Cloud IDE is prepared for your instructions. You can resize or maximize that window to make it a bit bigger.

#### AWS Cloud9

В даний час Cloud 9 вимагає зареєструватися за допомогою AWS і ввести інформацію кредитної карти.

1. Встановити Cloud 9 з [веб-магазину Chrome](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Перейдіть до [c9.io](https://c9.io) та натисніть *Get started with AWS Cloud9*
3. Створіть обліковий запис AWS (потрібна інформація про кредитну картку, але ви можете користуватись цим безкоштовно)
4. В AWS-Dashboard, введіть *Cloud9* в рядку пошуку і клацніть на ньому
5. У панелі Cloud9 натисніть *Create environment*
6. Назвіть його *django-girls*
7. Під час налаштування параметрів виберіть *Create a new instance for environment (EC2)* для "Environment Type" та *t2.micro* для "Instance type" (він має сказати "Free-tier eligible."). Економне налаштування за замовчуванням задовільне, а ви можете залишити інші значення також без змін.
8. Натисніть *Next step*
9. Натисніть *Create environment*

Тепер ви повинні побачити інтерфейс із бічною панеллю, великим основним вікном з деяким текстом, і маленьке вікно внизу, що виглядає приблизно так:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

Ця нижня область є вашим терміналом. Ви можете використовувати термінал, щоб відправляти інструкції на віддалений комп'ютер Cloud9. Ви можете змінити розмір вікна, щоб зробити його трохи більшим.

### Віртуальне середовище

Віртуальне середовище (також зване virtualenv) - це як приватна скриня, яку ми можемо наповнювати корисним комп'ютерним кодом для проекту, над яким ми працюємо. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

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