> Для читачів вдома: відеоверсія цього розділу - [Встановлення Python та редактора коду](https://www.youtube.com/watch?v=pVTaqzKZCdA) (англ.).
> 
> Цей розділ базується на навчальних матеріалах Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django написаний на Python. Нам потрібен Python, щоб робити на Django усе, що заманеться. Почнемо з його інсталяції! Ми хочемо, щоб ви встановили останню версію Python 3, отже якщо у вас встановлена більш рання версія, вам потрібно її оновити. Якщо у вас вже є версія {{ book.py_min_version }} або вище, то у вас має бути все гаразд.

Будь ласка, встановіть звичайний Python, навіть якщо на вашому комп’ютері встановлена Анаконда.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Спочатку перевірте, яка версія Windows встановлена на вашому комп'ютері (64- чи 32-розрядна) у рядку "Тип системи" сторінки налаштувань "Система". Щоб відкрити цю сторінку, оберіть один з цих способів:

* Натисніть на клавіатурі комбінацію клавіш Win + Pause/Break
* Відкрийте панель керування у меню Windows, потім перейдіть до категорії "Системи й безпека", і звідти - до "Система"
* Натисніть клавішу Windows, а потім перейдіть до Настройки > Система > Про систему
* Знайдіть у меню "Пуск" розділ "Система". Для цього натисніть кнопку «Пуск» (або клавішу Windows), а потім почніть набирати `Система`. Посилання на сторінку "Система" з'явиться одразу, як тільки ви почнете набирати. І ви можете одразу обрати його.

Python для Windows можна завантажити з сайту https://www.python.org/downloads/windows/. Натисніть на посилання "Latest Python 3 Release - Python 3.x.x". Якщо ваш комп'ютер працює з **64-розрядною** версією Windows, завантажте **Windows installer (64-bit)** (посилання шукайте у самому низу). Інакше завантажте **Windows installer (32-bit)**. Після завантаження інсталятора запустіть його (двічі клацніть на ньому) і виконайте усі подальші інструкції.

Зверніть увагу на одну річ: під час встановлення з'явиться вікно з заголовком "Setup". Переконайтесь, що ви поставили галочку "Add Python {{ book.py_version }} to PATH" або "Add Python to your environment variables", і натисніть "Install Now", як показано тут (це може виглядати трохи інакше, якщо ви встановлюєте іншу версію):

![Don't forget to add Python to the Path](../python_installation/images/python-installation-options.png)

Коли встановлення завершиться, ви можете побачити діалогове вікно з посиланням, щоб дізнатись більше про Python або про версію, яку ви встановили. Закрийте або скасуйте цей діалог: у цьому посібнику ви дізнаєтесь значно більше!

Примітка: Якщо ви використовуєте стару версію Windows (7, Vista, або будь-яка стара версія) і встановлення Python {{ book.py_version }} зазнає помилки, то встановіть усі оновлення для Windows і спробуйте встановити Python знову. Якщо помилка залишилась, спробуйте встановити версію Python {{ book.py_min_release }} з [Python.org](https://www.python.org/downloads/windows/).

> Django {{ book.django_version }} потребує Python {{ book.py_min_version }} або вище: ці версії не підтримують Windows XP або більш ранні версії Windows.

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Note** Before you install Python on OS X, you should ensure your Mac settings allow installing packages that aren't from the App Store. Go to System Preferences (it's in the Applications folder), click "Security & Privacy," and then the "General" tab. If your "Allow apps downloaded from:" is set to "Mac App Store," change it to "Mac App Store and identified developers."

You need to go to the website https://www.python.org/downloads/mac-osx/ and download the latest Python installer:

* Download the *Mac OS X 64-bit/32-bit installer* file,
* Double click *python-{{ book.py_release }}-macosx10.9.pkg* to run the installer.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

It is very likely that you already have Python installed out of the box. To check if you have it installed (and which version it is), open a console and type the following command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python {{ book.py_release }}
    

If you have a different version of Python installed, at least {{ book.py_min_version }} (e.g. {{ book.py_min_release }}), then you don't have to upgrade. If you don't have Python installed, or if you want a different version, first check what Linux distribution you are using with the following command:

{% filename %}command-line{% endfilename %}

    $ grep '^NAME=' /etc/os-release
    

Afterwards, depending on the result, follow one of the following installation guides below this section.

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Type this command into your console:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Use this command in your console:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

If you're on older Fedora versions you might get an error that the command `dnf` is not found. In that case, you need to use `yum` instead.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Use this command in your console:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Verify the installation was successful by opening a command prompt and running the `python3` command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python {{ book.py_release }}
    

The version shown may be different from {{ book.py_release }} -- it should match the version you installed.

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is {{ book.py_min_version }} or higher. If that doesn't work either, you may open a new command prompt and try again; this happens if you use a command prompt left open from before the Python installation.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.