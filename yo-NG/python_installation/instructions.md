> Fún àwọn òǹkàwé ní ilé: a ti ṣàlàyé àkòrí yìí nínú fídíò [Ṣíṣe àgbékalẹ̀ Python & Olóòtú Kóòdù](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Abala yìí dá lórí àlàyé kan ti Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django gba kíkọ ní Python. A nílò Python láti ṣe ohunkóhun nínú Django. Ẹ jẹ́ ká bẹ̀rẹ̀ nípasẹ̀ ṣíṣe àgbékalẹ̀ rẹ̀! A fẹ́ kí o ṣàgbékalẹ̀ ẹyà tó jáde gbẹ̀yìn ti Python 3, nítorí náà tí o bá ní èyíkéyìí ẹyà tàtijọ́, ìwọ yíò nílò láti ṣe ìmúdójúìwọ̀n rẹ̀. Tí o bá ti ní ẹyà 3.4 tàbí jù bẹ́ẹ̀ lọ tẹ́lẹ̀, ó yẹ kó ṣiṣẹ́ dáadáa.

Jọ̀wọ́ ṣàgbékalẹ̀ ojúlówó Python báyìí, kódà nígbà tí o bá ti ṣàgbékalẹ̀ Anaconda tẹ́lẹ̀ sórí kọ̀mpútà rẹ.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Kọ́kọ́ ṣàyẹ̀wò bóyá kọ̀mpútà rẹ n ṣiṣẹ́ pẹ̀lú ẹyà 32-bit kan tàbí ẹyà 64-bit kan ti Windows, lórí ìlà "System type" ti ojú-ìwé Ìròyìn Ètò náà. Láti dé ojú-ìwé yìí, gbìyànjú ọ̀kan lára àwọn ọ̀nà wọ̀nyí:

* Tẹ bọ́tìnnì Windows àti bọ́tìnnì Pause/Break lẹ́ẹ̀kan náà
* Ṣí Control Panel rẹ láti àkójọ àṣàyàn Windows náà, lẹ́yìn náà lọ sí System & Security, lẹ́yìn náà System
* Tẹ bọ́tìnnì Windows náà, lẹ́yìn náà lọ sí Settings > System > About

O lè gba Python fún Windows láti ààyè ayélujára náà https://www.python.org/downloads/windows/. Tẹ orí atọ́ka "Latest Python 3 Release - Python x.x.x" náà. Tí kọ̀mpútà rẹ bá n ṣiṣẹ́ pẹ̀lú ẹyà **64-bit** ti Windows kan, gba **Windows x86-64 executable installer** náà. Bí bẹ́ẹ̀ kọ́, gba **Windows x86 executable installer** náà. Lẹ́yìn tí o bá gba aṣàgbékalẹ̀ náà, ó yẹ kí o mú u ṣiṣẹ́ (ṣíra tẹ̀ẹ́ lẹ́ẹ̀mejì) àti tẹ̀lé àwọn ìtọ́sọ́nà tó wà níbẹ̀.

One thing to watch out for: During the installation, you will notice a window marked "Setup". Make sure you tick the "Add Python 3.6 to PATH" or 'Add Python to your environment variables" checkbox and click on "Install Now", as shown here (it may look a bit different if you are installing a different version):

![Don't forget to add Python to the Path](../python_installation/images/python-installation-options.png)

When the installation completes, you may see a dialog box with a link you can follow to learn more about Python or about the version you installed. Close or cancel that dialog -- you'll be learning more in this tutorial!

Note: if you are using an older version of Windows (7, Vista, or any older version) and the Python 3.6.x installer fails with an error, you can try either:

1. ṣàgbékalẹ̀ gbogbo àwọn Ìmúdójúìwọ̀n Windows kí o gbìyànjú láti tún ṣàgbékalẹ̀ Python lẹ́ẹ̀kan si; tàbí
2. ṣàgbékalẹ̀ [ẹyà tàtijọ́ ti Python](https://www.python.org/downloads/windows/) kan, fún àpẹẹrẹ, [3.4.6](https://www.python.org/downloads/release/python-346/).

Tí o bá ṣàgbékalẹ̀ ẹyà tàtijọ́ ti Python kan, ojú àwòrán ìṣàgbékalẹ̀ náà le yàtọ̀ díẹ̀ sí èyí tí a ṣàfihàn lókè. Make sure you scroll down to see "Add python.exe to Path", then click the button on the left and pick "Will be installed on local hard drive":

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Note** Before you install Python on OS X, you should ensure your Mac settings allow installing packages that aren't from the App Store. Go to System Preferences (it's in the Applications folder), click "Security & Privacy," and then the "General" tab. If your "Allow apps downloaded from:" is set to "Mac App Store," change it to "Mac App Store and identified developers."

O ní láti lọ sórí ààyè ayélujára https://www.python.org/downloads/release/python-361/ àti gba aṣàgbékalẹ̀ Python náà:

* Gba fáìlì *Mac OS X 64-bit/32-bit installer* náà,
* Tẹ *python-3.6.1-macosx10.6.pkg* lẹ́ẹ̀mejì láti mú aṣàgbékalẹ̀ náà ṣiṣẹ́.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

It is very likely that you already have Python installed out of the box. To check if you have it installed (and which version it is), open a console and type the following command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

If you have a different version of Python installed, at least 3.4.0 (e.g. 3.6.0), then you don't have to upgrade. If you don't have Python installed, or if you want a newer version, you can install it as follows:

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Tẹ àṣẹ yìí sínú console rẹ:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Lo àṣẹ yìí nínú console rẹ:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

Tí o bá wà lórí àwọn ẹyà Fedora tàtijọ́, o lè rí àṣìṣe kan wípé àṣẹ `dnf` náà kò sí. Tó bá rí bẹ́ẹ̀, o nílò láti lo `yum` dípò.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Lo àṣẹ yìí nínú console rẹ:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Ri dájú pé ìṣàgbékalẹ̀ náà jẹ́ àṣeyọrí nípasẹ̀ ṣíṣí command prompt kan àti lílo àṣẹ `python3` náà:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

Ẹyà tó fihàn náà lè yàtọ̀ sí 3.6.1 -- ó yẹ kó dọ́gba pẹ̀lú ẹyà tí o ṣàgbékalẹ̀.

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is 3.4.0 or higher.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.