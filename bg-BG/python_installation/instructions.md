> За читателите у дома: тази глава е разгледана във видеото [Инсталиране на Python & Редактор на код](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Част от този раздел е базирана на ръководства от Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django е написан на Python. Имаме нужда от Python, за да направим нещо в Django. Нека започнем с инсталирането му! Искаме да инсталирате най-новата версия на Python 3, така че ако имате някоя по-ранна версия, ще трябва да я актуализирате. If you already have version {{ book.py_min_version }} or higher you should be fine.

Моля, инсталирайте нормален Python по следния начин, дори когато на вашия компютър е инсталиран Anaconda.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Първо проверете дали вашият компютър използва 32-битова версия или 64-битова версия на Windows, в реда "Тип система" на страницата Информация за системата. За да стигнете до тази страница, опитайте един от следните методи:

* Натиснете едновременно клавиша Windows и клавиша за Пауза/Прекъсване
* Отворете контролния панел от менюто на Windows, след което отворете Система & Сигурност, след това Система
* Натиснете бутона на Windows, след това отворете Настройки> Система> Информация
* Потърсете в менюто "Старт" на Windows "Система информация" За целта щракнете върху бутона Старт или натиснете клавиша Windows, след което започнете да въвеждате `Информация за системата`. То ще започне да прави предложения веднага щом въведете. Изберете правилното, след като се появи.

Можете да изтеглите Python за Windows от уебсайта https://www.python.org/downloads/windows/. Кликнете върху връзката "Последно издание на Python 3 - Python x.x.x“. Ако вашият компютър работи с **64-битова** версия на Windows, изтеглете **изпълнителния инсталатор Windows x86-64**. В противен случай изтеглете **изпълнителния инсталатор Windows x86**. След като изтеглите инсталатора, трябва да го стартирате (щракнете двукратно върху него) и следвайте инструкциите там.

Едно нещо, за което трябва да внимавате: По време на инсталацията ще забележите прозорец с надпис „Настройка“. Make sure you tick the "Add Python {{ book.py_version }} to PATH" or 'Add Python to your environment variables" checkbox and click on "Install Now", as shown here (it may look a bit different if you are installing a different version):

![Не забравяйте да добавите Python към Path](../python_installation/images/python-installation-options.png)

Когато инсталацията приключи, може да видите диалогов прозорец с връзка, която можете да следвате, за да научите повече за Python или за версията, която сте инсталирали. Затворете или отменете този диалог - в това ръководство ще научите повече!

Note: If you are using an older version of Windows (7, Vista, or any older version) and the Python {{ book.py_version }} installer fails with an error, then install all Windows Updates and try to install Python again. If you still have the error, try installing Python version {{ book.py_min_release }} from [Python.org](https://www.python.org/downloads/windows/).

> Django {{ book.django_version }} needs Python {{ book.py_min_version }} or greater, which does not support Windows XP or earlier versions.

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Note** Before you install Python on OS X, you should ensure your Mac settings allow installing packages that aren't from the App Store. Go to System Preferences (it's in the Applications folder), click "Security & Privacy," and then the "General" tab. If your "Allow apps downloaded from:" is set to "Mac App Store," change it to "Mac App Store and identified developers."

You need to go to the website https://www.python.org/downloads/mac-osx/ and download the latest Python installer:

* Изтеглете *Mac OS X 64-битов/32-битов инсталатор* файл,
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