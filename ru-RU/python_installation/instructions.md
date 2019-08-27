> Для тех читателей, кто занимается дома: эта глава описывается в видео [Установка Python и текстового редактора](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Этот подраздел основан на руководстве Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django написан на Python. Нам нужен Python, чтобы сделать что-нибудь в Django. Давай начнем с его установки! Мы хотим, чтобы ты установила самую свежую версию Python 3, поэтому, если у тебя уже есть более ранняя версия, то её придется обновить. Если у тебя уже установлена версия 3.4 или более высокая, она должна подойти.

Please install normal Python as follows, even when you have Anaconda installed on your computer.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Для начала проверь, какая версия Windows у тебя на компьютере — 32-битная или 64-битная. Это будет указано в строке «Тип системы» на странице «Сведения о системе». Чтобы попасть туда, попробуй один из этих способов:

* Нажмите одновременно клавишу Windows и клавишу Pause/Break
* Откройте панель управления из меню Windows, затем перейдите в Система & Безопасность, затем перейдите в Система
* Нажми клавишу Windows, затем перейди по разделам Настройки > Система > О системе

Ты можешь загрузить Python для Windows с официального веб-сайта: https://www.python.org/downloads/windows/. Перейди по ссылке "Latest Python 3 Release - Python x.x.x". If your computer is running a **64-bit** version of Windows, download the **Windows x86-64 executable installer**. Otherwise, download the **Windows x86 executable installer**. After downloading the installer, you should run it (double-click on it) and follow the instructions there.

One thing to watch out for: During the installation, you will notice a window marked "Setup". Make sure you tick the "Add Python 3.6 to PATH" or 'Add Python to your environment variables" checkbox and click on "Install Now", as shown here (it may look a bit different if you are installing a different version):

![Don't forget to add Python to the Path](../python_installation/images/python-installation-options.png)

When the installation completes, you may see a dialog box with a link you can follow to learn more about Python or about the version you installed. Close or cancel that dialog -- you'll be learning more in this tutorial!

Note: if you are using an older version of Windows (7, Vista, or any older version) and the Python 3.6.x installer fails with an error, you can try either:

1. установить все обновления Windows и попытайтесь установить Python заново; или
2. установите [более старую версию Python](https://www.python.org/downloads/windows/), например, [3.4.6](https://www.python.org/downloads/release/python-346/).

If you install an older version of Python, the installation screen may look a bit different than shown above. Make sure you scroll down to see "Add python.exe to Path", then click the button on the left and pick "Will be installed on local hard drive":

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Примечание** Прежде чем установить Python на OS X, следует убедиться, что ваш Mac параметры позволяют устанавливать пакеты, которые не из App Store. Перейди к System Preferences (они находится в папке «Приложения»), нажмите «Безопасность & amp; конфиденциальности», а затем вкладку «Общие». Если настройка "Позволить приложения загруженные с " установлена как "Mac App Store", то измените ее на "Mac App Store and identified developers."

You need to go to the website https://www.python.org/downloads/release/python-361/ and download the Python installer:

* Скачай файл *Mac OS X 64-bit/32-bit installer*,
* Сделай двойной щелчок на *python-3.4.3-macosx10.6.pkg* для запуска установщика.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

It is very likely that you already have Python installed out of the box. To check if you have it installed (and which version it is), open a console and type the following command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

If you have a different version of Python installed, at least 3.4.0 (e.g. 3.6.0), then you don't have to upgrade. If you don't have Python installed, or if you want a different version, first check what Linux distribution you are using with the following command:

{% filename %}command-line{% endfilename %}

    $ grep ^NAME= /etc/os-release
    

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
    Python 3.6.1
    

The version shown may be different from 3.6.1 -- it should match the version you installed.

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is 3.4.0 or higher.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.