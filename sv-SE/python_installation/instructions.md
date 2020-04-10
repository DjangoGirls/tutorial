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

![Glöm inte att lägga till Python till Path](../python_installation/images/python-installation-options.png)

När installationen är klar kan det komma upp en dialogruta med en länk som du kan följa för att lära dig mer om Python eller om ersionen du installerade. Stäng eller avbryt den dialogen -- du kommer att lära dig mer i den här handledningen!

Obs: Om du använder en äldre version av Windows (7, Vista, eller någon äldre version) och Python 3.6.x installationen misslyckas med ett felmeddelande, kan du försöka att antingen:

1. installera alla Windows uppdateringar och försöka att installera Python igen; eller
2. installera en [äldre version av Python](https://www.python.org/downloads/windows/), som [3.4.6](https://www.python.org/downloads/release/python-346/).

Om du installerar en äldre version av Python så kan installationsskärmen se annorlunda ut än vad som visas ovan. Se till att du skrollar ned för att se "Add python.exe to Path", klicka sedan på knappen till vänster och välj "Will be installed on local hard drive":

![Lägg till Python till Path, äldre versioner](../python_installation/images/add_python_to_windows_path.png)

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
    

Om du har en annan version av Python installerad, minst 3.4.0 (t.ex 3.6.0), då behöver du inte uppgradera. Om du inte har Python installerad, eller om mdu vill ha en annan version, kolla först vilken Linux-distribution du använder med följande kommando:

{% filename %}command-line{% endfilename %}

    $ grep '^NAME=' /etc/os-release
    

Efteråt, beroende på resultatet, följ en av följande installationsguider under detta avsnitt.

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Skriv in följande kommando i konsolen:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Använd det här kommandot i din konsol:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

Om du använder en äldre Fedora version så kan du få ett felmeddelande som säger att kommandot `dnf` inte hittades. I det fallet, behöver du använda `yum` istället.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Använd det här kommandot i din konsol:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Verifiera att installation var lyckad genom att öppna en kommandotolk och använd `python3` kommandot:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

Versionen som visas kan skilja sig från 3.6.1 -- den bör matcha den version du installerat.

**Obs:** Om du är på Windows och det står att `python3` inte hittades, försök använda `python` (utan `3`) och kolla om det fortfarande är en version som är 3.4.0 eller högre. Om det inte heller fungerar, kan du öppna en ny kommandotolk och försöka igen; det här händer om du använder en kommandotolk kvar öppen från innan en Python installation.

* * *

Om du tvivlar på något eller om något gick fel och du inte vet vad du ska göra, fråga din coach! Ibland går inte saker så lätt och det är bättre att fråga någon som har mer erfarenhet.