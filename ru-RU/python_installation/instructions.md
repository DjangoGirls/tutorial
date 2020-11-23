> Для тех, кто занимается дома: эта глава описывается в видео [Установка Python и текстового редактора](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Этот подраздел основан на руководстве Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django написан на Python. Нам нужен Python, чтобы сделать что-нибудь в Django. Давай начнем с его установки! Мы хотим, чтобы ты установила самую свежую версию Python 3, поэтому, если у тебя уже есть более ранняя версия, то её придется обновить. If you already have version {{ book.py_min_version }} or higher you should be fine.

Пожалуйста, установи обычный Python даже если Anaconda установлена на твоем компьютере.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Для начала проверь, какая версия Windows у тебя на компьютере — 32-битная или 64-битная. Это будет указано в строке «Тип системы» на странице «Сведения о системе». Чтобы попасть туда, попробуй один из этих способов:

* Нажмите одновременно клавишу Windows и клавишу Pause/Break
* Откройте панель управления из меню Windows, затем перейдите в Система & Безопасность, затем перейдите в Система
* Нажми клавишу Windows, затем перейди по разделам Настройки > Система > О системе
* Найдите пункт "Информация о системе" в меню Windows Start. Для этого нажмите на кнопку "Старт" на экране или кнопку со значком "Windows" на клавиатуре - и начните вводить "Информация о системе". По мере ввода на экране будут появляться подсказки. Как только в подсказке появится пункт "Информация о системе", нажмите на него. 

Ты можешь загрузить Python для Windows с официального веб-сайта: https://www.python.org/downloads/windows/. Перейди по ссылке "Latest Python 3 Release - Python x.x.x". Если у тебя установлена **64-битная** версия Windows, скачай **Windows x86-64 executable installer**. Если нет — скачай **Windows x86 executable installer**. После загрузки дистрибутива ты должна запустить его (двойным щелчком) и следовать инструкциям.

Обрати внимание на экран мастера установки, который называется "Setup" (Настройка). Make sure you tick the "Add Python {{ book.py_version }} to PATH" or 'Add Python to your environment variables" checkbox and click on "Install Now", as shown here (it may look a bit different if you are installing a different version):

![Не забудьте добавить Python в системную переменную Path](../python_installation/images/python-installation-options.png)

Когда установка закончится, ты можешь увидеть предложение узнать больше о Python или об установленной тобой версии. Закрой это окно — ты узнаешь намного больше в этом руководстве!

Note: If you are using an older version of Windows (7, Vista, or any older version) and the Python {{ book.py_version }} installer fails with an error, then install all Windows Updates and try to install Python again. If you still have the error, try installing Python version {{ book.py_min_release }} from [Python.org](https://www.python.org/downloads/windows/).

> Django {{ book.django_version }} needs Python {{ book.py_min_version }} or greater, which does not support Windows XP or earlier versions.

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Note** Before you install Python on OS X, you should ensure your Mac settings allow installing packages that aren't from the App Store. Go to System Preferences (it's in the Applications folder), click "Security & Privacy," and then the "General" tab. If your "Allow apps downloaded from:" is set to "Mac App Store," change it to "Mac App Store and identified developers."

You need to go to the website https://www.python.org/downloads/mac-osx/ and download the latest Python installer:

* Скачай файл *Mac OS X 64-bit/32-bit installer*,
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

    $ sudo apt install python3.6
    

<!--endsec-->

Verify the installation was successful by opening a command prompt and running the `python3` command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python {{ book.py_release }}
    

The version shown may be different from {{ book.py_release }} -- it should match the version you installed.

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is {{ book.py_min_version }} or higher. If that doesn't work either, you may open a new command prompt and try again; this happens if you use a command prompt left open from before the Python installation.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.