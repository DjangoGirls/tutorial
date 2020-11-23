> Fún àwọn òǹkàwé ní ilé: a ti ṣàlàyé àkòrí yìí nínú fídíò [Ṣíṣe àgbékalẹ̀ Python & Olóòtú Kóòdù](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Abala yìí dá lórí àlàyé kan ti Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django gba kíkọ ní Python. A nílò Python láti ṣe ohunkóhun nínú Django. Ẹ jẹ́ ká bẹ̀rẹ̀ nípasẹ̀ ṣíṣe àgbékalẹ̀ rẹ̀! A fẹ́ kí o ṣàgbékalẹ̀ ẹyà tó jáde gbẹ̀yìn ti Python 3, nítorí náà tí o bá ní èyíkéyìí ẹyà tàtijọ́, ìwọ yíò nílò láti ṣe ìmúdójúìwọ̀n rẹ̀. If you already have version {{ book.py_min_version }} or higher you should be fine.

Jọ̀wọ́ ṣàgbékalẹ̀ ojúlówó Python báyìí, kódà nígbà tí o bá ti ṣàgbékalẹ̀ Anaconda tẹ́lẹ̀ sórí kọ̀mpútà rẹ.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Kọ́kọ́ ṣàyẹ̀wò bóyá kọ̀mpútà rẹ n ṣiṣẹ́ pẹ̀lú ẹyà 32-bit kan tàbí ẹyà 64-bit kan ti Windows, lórí ìlà "System type" ti ojú-ìwé System Info náà. Láti dé ojú-ìwé yìí, gbìyànjú ọ̀kan lára àwọn ọ̀nà wọ̀nyí:

* Tẹ bọ́tìnnì Windows àti bọ́tìnnì Pause/Break lẹ́ẹ̀kan náà
* Ṣí Control Panel rẹ láti àkójọ àṣàyàn Windows náà, lẹ́yìn náà lọ sí System & Security, lẹ́yìn náà System
* Tẹ bọ́tìnnì Windows náà, lẹ́yìn náà lọ sí Settings > System > About
* Search the Windows Start menu for "System Information". To do that, click the Start button or press the Windows key, then begin to type `System Information`. It will start making suggestions as soon as you type. You can select the entry once it shows up.

O lè gba Python fún Windows láti ààyè ayélujára náà https://www.python.org/downloads/windows/. Tẹ orí atọ́ka "Latest Python 3 Release - Python x.x.x" náà. Tí kọ̀mpútà rẹ bá n ṣiṣẹ́ pẹ̀lú ẹyà **64-bit** ti Windows kan, gba **Windows x86-64 executable installer** náà. Bí bẹ́ẹ̀ kọ́, gba **Windows x86 executable installer** náà. Lẹ́yìn tí o bá gba aṣàgbékalẹ̀ náà, ó yẹ kí o mú u ṣiṣẹ́ (ṣíra tẹ̀ẹ́ lẹ́ẹ̀mejì) àti tẹ̀lé àwọn ìtọ́sọ́nà tó wà níbẹ̀.

Nnkan kan láti ṣọ́ra fún: Lásìkò ìṣàgbékalẹ̀ náà, ìwọ yíò ṣàkíyèsí fèrèsé kan pẹ̀lú àmì "Setup". Make sure you tick the "Add Python {{ book.py_version }} to PATH" or 'Add Python to your environment variables" checkbox and click on "Install Now", as shown here (it may look a bit different if you are installing a different version):

![Má gbàgbé láti ṣàfikún Python sí Atọ́nà náà](../python_installation/images/python-installation-options.png)

Nígbà tí ìṣàgbékalẹ̀ náà bá parí, o lè rí àpótí ìsọ̀rọ̀gbèsì kan pẹ̀lú atọ́ka kan tí o lè tẹ̀lé láti kẹ́kọ̀ọ́ síi nípa Python tàbí nípa ẹyà tí o ṣàgbékalẹ̀ náà. Pa àpótí ìsọ̀rọ̀gbèsì yẹn dé tàbí fagi lé -- ìwọ yíò ma kẹ́kọ̀ọ́ síi nínú àlàyé yìí!

Note: If you are using an older version of Windows (7, Vista, or any older version) and the Python {{ book.py_version }} installer fails with an error, then install all Windows Updates and try to install Python again. If you still have the error, try installing Python version {{ book.py_min_release }} from [Python.org](https://www.python.org/downloads/windows/).

> Django {{ book.django_version }} needs Python {{ book.py_min_version }} or greater, which does not support Windows XP or earlier versions.

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Note** Before you install Python on OS X, you should ensure your Mac settings allow installing packages that aren't from the App Store. Go to System Preferences (it's in the Applications folder), click "Security & Privacy," and then the "General" tab. If your "Allow apps downloaded from:" is set to "Mac App Store," change it to "Mac App Store and identified developers."

You need to go to the website https://www.python.org/downloads/mac-osx/ and download the latest Python installer:

* Gba fáìlì *Mac OS X 64-bit/32-bit installer* náà,
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