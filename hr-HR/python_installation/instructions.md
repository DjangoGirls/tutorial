> Za čitatelje kod kuće: ovo poglavlje je pokriveno u videu [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Ovaj odjeljak je napisan prema tutorijalu Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django je pisan u Pythonu. Trebat ćemo Python ako želimo išta napraviti u Djangu. Počnimo sa instaliranjem! Želimo da instaliraš Python 3.6, pa ako imaš bilo kakvu raniju inačicu, nadogradi ju.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Prva provjeri imaš li na računalu 32-bitnu inačicu ili 64-bitnu inačicu Windowsa, pritiskanjem Windows + Pause/Break kombinacije, koja će otvoriti Sustav info, pa pogledaj na liniju u kojoj piše "Tip sustava". Možeš preuzeti Python za Windows sa stranice https://www.python.org/downloads/windows/. Klikni na link "Latest Python 3 Release - Python x.x.x". Ako na računalu imaš **64-bitnu** inačicu Windowsa, preuzmi **Windows x86-64 executable installer**. Ako imaš 32-bitnu, preuzmi **Windows x86 executable installer**. Nakon što se datoteka preuzme, pokreni ju (dvostrukim klikom) i prati te upute.

Pripazi na jednu stvar: tijekom instalacije, u prozoru na kojem piše "Setup" mora biti kvačica pored opcije "Add Python 3.6 to PATH". Ako je nema, stavi ju, a zatim klikni na "Install Now", kao što možeš vidjeti:

![Don't forget to add Python to the Path](../python_installation/images/python-installation-options.png)

U nadolazećim koracima, koristit ćeš Windows naredbeni redak (o kojem ćemo ti također pričati). Za sada, ako trebaš upisati neke naredbe, idi na Start → Windows System → Command Prompt. Također možeš pritisnuti Windows tipku zajedno sa tipkom "R" sve dok se ne pojavi prozorčić "Run". Da bi se otvorio naredbeni redak, upiši "cmd" i pritisni enter u "Run" prozorčiću. (Na novijim Windowsima, možda ćeš morati potražiti "Command Prompt" pošto je ponekad skriveno.)

![Type "cmd" in the "Run" window](../python_installation/images/windows-plus-r.png)

Note: if you are using an older version of Windows (7, Vista, or any older version) and the Python 3.6.x installer fails with an error, you can try either:

1. install all Windows Updates and try to install Python 3.6 again; or
2. install an [older version of Python](https://www.python.org/downloads/windows/), e.g., [3.4.6](https://www.python.org/downloads/release/python-346/).

If you install an older version of Python, the installation screen may look a bit different than shown above. Make sure you scroll down to see "Add python.exe to Path", then click the button on the left and pick "Will be installed on local hard drive":

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Note** Before you install Python on OS X, you should ensure your Mac settings allow installing packages that aren't from the App Store. Go to System Preferences (it's in the Applications folder), click "Security & Privacy," and then the "General" tab. If your "Allow apps downloaded from:" is set to "Mac App Store," change it to "Mac App Store and identified developers."

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
    

If you have a different 'micro version' of Python installed, e.g. 3.6.0, then you don't have to upgrade. If you don't have Python installed, or if you want a different version, you can install it as follows:

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Type this command into your console:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3.6
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Use this command in your console:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

If you're on older Fedora versions you might get an error that the command `dnf` is not found. In that case, you need to use yum instead.

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
    

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python 3.6.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.