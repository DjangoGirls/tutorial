> За читателите у дома: тази глава е разгледана във видеото [Инсталиране на Python & Редактор на код](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Този раздел е базиран на урок от Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django е написан на Python. Имаме нужда от Python, за да направим нещо в Django. Нека започнем с инсталирането му! Искаме да инсталирате най-новата версия на Python 3, така че ако имате някоя по-ранна версия, ще трябва да я актуализирате. Ако вече имате версия 3.4 или по-нова, трябва да се оправите.

Моля, инсталирайте нормален Python по следния начин, дори когато на вашия компютър е инсталиран Anaconda.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Първо проверете дали вашият компютър използва 32-битова версия или 64-битова версия на Windows, в реда "Тип система" на страницата Информация за системата. За да стигнете до тази страница, опитайте един от следните методи:

* Натиснете едновременно клавиша Windows и клавиша за Пауза/Прекъсване
* Отворете контролния панел от менюто на Windows, след което отворете Система & Сигурност, след това Система
* Натиснете бутона на Windows, след това отворете Настройки> Система> Информация

Можете да изтеглите Python за Windows от уебсайта https://www.python.org/downloads/windows/. Кликнете върху връзката "Последно издание на Python 3 - Python x.x.x“. Ако вашият компютър работи с **64-битова** версия на Windows, изтеглете **изпълнителния инсталатор Windows x86-64**. В противен случай изтеглете **изпълнителния инсталатор Windows x86**. След като изтеглите инсталатора, трябва да го стартирате (щракнете двукратно върху него) и следвайте инструкциите там.

Едно нещо, за което трябва да внимавате: По време на инсталацията ще забележите прозорец с надпис „Настройка“. Уверете се, че поставете отметка в квадратчето „Добавяне на Python 3.6 към PATH“ или „Добавяне на Python към променливите на вашата среда“ и кликнете върху „Инсталиране сега“, както е показано тук (може да изглежда малко по-различно, ако инсталирате друга версия):

![Don't forget to add Python to the Path](../python_installation/images/python-installation-options.png)

Когато инсталацията приключи, може да видите диалогов прозорец с връзка, която можете да следвате, за да научите повече за Python или за версията, която сте инсталирали. Затворете или отменете този диалог - в този урок ще научите повече!

Забележка: Ако използвате по-стара версия на Windows (7, Vista или някоя по-стара версия) и инсталатора на Python 3.6.x не успее с грешка, можете да опитате или:

1. да инсталирате всички актуализации на Windows и да опитате отново да инсталирате Python; или
2. да инсталирате [по-стара версия на Python](https://www.python.org/downloads/windows/), например, [3.4.6](https://www.python.org/downloads/release/python-346/).

Ако инсталирате по-стара версия на Python, екранът за инсталиране може да изглежда малко по-различно от показаното по-горе. Уверете се, че превъртете надолу, за да видите „Добавяне на python.exe към Path“, след това щракнете върху бутона вляво и изберете „Ще бъде инсталиран на локален твърд диск“:

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Забележка** Преди да инсталирате Python в OS X, трябва да се уверите, че настройките ви за Mac позволяват инсталиране на пакети, които не са от App Store. Отидете на System Preferences (това е в папката Applications), щракнете върху "Сигурност & Поверителност," и след това върху раздела "General". If your "Allow apps downloaded from:" is set to "Mac App Store," change it to "Mac App Store and identified developers."

You need to go to the website https://www.python.org/downloads/release/python-361/ and download the Python installer:

* Download the *Mac OS X 64-bit/32-bit installer* file,
* Double click *python-3.6.1-macosx10.6.pkg* to run the installer.

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

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is 3.4.0 or higher. If that doesn't work either, you may open a new command prompt and try again; this happens if you use a command prompt left open from before the Python installation.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.