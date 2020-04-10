> För läsare hemifrån: det här kapitlet täcks i [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA) videon.
> 
> Den här sektionen är baserad på en handledning av Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django är skrivet i Python. Vi behöver Python för att göra något i Django. Låt oss börja genom att installera det! Vi vill att du installerar den senaste versionen av Python 3, så om du har någon tidigare version, så behöver du uppgradera den. Om du redan har version 3.4 eller högre så borde du vara okej.

Installera normala Python som följande, även om du har Anaconda installerad på din dator.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Först kolla om din dator kör en 32-bit version eller en 64-bit version av Windows, på "System typ" raden i System Info sidan. För att nå denna sida, försök en av dessa metoder:

* Tryck ned Windows-tangenten och Pause/Break-tangenten samtidigt
* Öppna Kontrollpanelen från Windows-menyn och navigera sedan till System & Säkerhet, sen System
* Tryck på Windows-knappen och navigera sedan till Inställningar > System > Om

Du kan ladda ned Python till Windows från deras hemsida https://www.python.org/downloads/windows/. Klicka på länken "Latest Python 3 Release - Python x.x.x". Om din dator kör en **64-bit** version av Windows, ladda ned **Windows x86-64 executable installer**. Ladda annars ned **Windows x86 executable installer**. Kör installationsfilen efter att du har laddat ned den genom att dubbelklicka på den.

En sak att se upp för: Under installation kommer du se ett fönster markerat "Setup". Se till att markera kryssrutorna "Add Python 3.6 to PATH" eller "Add Python to your environment variables" och klicka sedan på "Install Now", som visas här (det kan se olika ut om du installerar en annan version):

![Don't forget to add Python to the Path](../python_installation/images/python-installation-options.png)

När installationen är klar kan det komma upp en dialogruta med en länk som du kan följa för att lära dig mer om Python eller om ersionen du installerade. Stäng eller avbryt den dialogen -- du kommer att lära dig mer i den här handledningen!

Obs: Om du använder en äldre version av Windows (7, Vista, eller någon äldre version) och Python 3.6.x installationen misslyckas med ett felmeddelande, kan du försöka att antingen:

1. installera alla Windows uppdateringar och försöka att installera Python igen; eller
2. installera en [äldre version av Python](https://www.python.org/downloads/windows/), som [3.4.6](https://www.python.org/downloads/release/python-346/).

Om du installerar en äldre version av Python så kan installationsskärmen se annorlunda ut än vad som visas ovan. Se till att du skrollar ned för att se "Add python.exe to Path", klicka sedan på knappen till vänster och välj "Will be installed on local hard drive":

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Obs** Innan du installerar Python på OS X, bör du se till att din Macs inställningar tillåter installationer som inte är från App Store. Gå till System Preferenser (det är i Program mappen), klicka på "Säkerhet & Sekretess," och sen på fliken "Allmänt". Om din "Tillåt appar nedladdade från:" är satt till "Mac App Store," ändra det till "Mac App Store och identifierade utvecklare."

Du behöver gå till webbsidan https://www.python.org/downloads/release/python-361/ och ladda ned Python installeraren:

* Ladda ned *Mac OS X 64-bit/32-bit installer* filen,
* Dubbelklicka på *python-3.6.1-macosx10.6.pkg* för att köra installeraren.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

Troligen har du redan Python installerat. För att kolla om det är installerat (och vilken version), öppna en terminal och skriv in följande kommando:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

Om du har en annan version av Python installerad, minst 3.4.0 (t.ex 3.6.0), då behöver du inte uppgradera. If you don't have Python installed, or if you want a different version, first check what Linux distribution you are using with the following command:

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
    Python 3.6.1
    

The version shown may be different from 3.6.1 -- it should match the version you installed.

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is 3.4.0 or higher. If that doesn't work either, you may open a new command prompt and try again; this happens if you use a command prompt left open from before the Python installation.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.