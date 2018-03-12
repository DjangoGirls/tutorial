> Para sa mga magbabasa sa bahay: ang kabanatang ito ay kalakip sa [Installing Python& Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA) na video.
> 
> Ang bahaging ito ay naka-base sa isang tutorial ng Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Ang Django ay nakasulat sa Python. Kinakailangan natin ang Python upang gumawa ng kahit na ano sa Django. Magsimula tayo sa pag-install nito! Gusto namin na i-install mo ang Python 3.6, kaya kung mayroon kang mas naunang bersyon, kakailanganin mong i-upgrade ito.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Una, i-check kung ang iyong computer ay gumagamit ng isang 32-bit na bersyon o isang 64-bit na bersyon ng Windows, sa pamamagitan ng pagpindot ng Windows key + Pause/Break key na magbubukas sa impormasyon ng iyong System, at tingnan ang "System type" na linya. Maaari kang mag-download ng Python para sa Windows mula sa website na https://www.python.org/downloads/windows/. Pindutin ang "Latest Python 3 Release - Python x.x.x" na link. Kung ang iyong computer ay gumagamit ng isang **64-bit** na bersyon ng Windows, i-download ang **Windows x86-64 executable installer**. Kung hindi man, i-download ang **Windows x86 executable installer**. Pagkatapos i-download ang installer, dapat mo itong gamitin (i-double click ito) at sundin ang mga tagubilin doon.

One thing to watch out for: During the installation, you will notice a window marked "Setup". Make sure you tick the "Add Python 3.6 to PATH" checkbox and click on "Install Now", as shown here:

![Huwag kalimutan na idagdag ang Python sa Path](../python_installation/images/python-installation-options.png)

Sa mga susunod na hakbang, ikaw ay gagamit ng Windows Command Line (na sasabihin namin sa iyo ang tungkol dito). Sa ngayon, kung kailangan mong mag-type ng ilang mga pag-uutos, pumunta sa Start menu → Windows System → Command Prompt. Maaari mo rin na panatilihing hawak ang Windows key at pindutin ang "R" -key hanggang ang "Run" na window ay lumabas. Upang buksan ang Command Line, i-type ang "cmd" at pindutin ang enter sa "Run" na window. (Sa bagong bersyon ng Windows, maaaring kailangan mong maghanap ng "Command Prompt" dahil minsan ito ay nakatago.)

![Mag-type ng "cmd" sa "Run" na window](../python_installation/images/windows-plus-r.png)

Paalala: Kung ikaw ay gumagamit ng lumang bersyon ng Windows (7, Vista, o kahit anung lumang bersyon) at ang Python 3.6.x na installer ay nag-fail na may error, maaring mong subukan ang kahit saan sa:

1. mag-install ng lahat ng Windows Updates at subukang mag-install ng Python 3.6 ulit; o
2. mag-install ng [lumang bersyon ng Pything](https://www.python.org/downloads/windows/), e.g., [3.4.6](https://www.python.org/downloads/release/python-346/).

Kung ikaw ay nag-install ng lumang bersyon ng Python, ang installation screen ay maaring kakaiba ang screen mo kung ihambing sa ipinakita sa taas. Siguraduhing na scroll down mo para makita ang "Add python.exe to Path", pagkatapos i-click ang button sa kaliwa at piliin ang "Will be installed on local hard drive":

![Magdagdag ng Python sa Path, mga lumang bersyon](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Paalala** Bago mag-install ng Python sa OS X, dapat siguraduhin mo na ang Mac settings ay nagpahintulot na mag-install ng mga packages na hindi galing sa App Store. Pumunta sa System Preferences (nasa loob ng Applications na folder), i-click ang "Security & Privacy," at pagkatapos ang "General" na tab. Kung ang iyong "Allow apps downloaded from:" ay naka-set sa "Mac App Store," baguhin ito sa "Mac App Store and identified developers."

Kailangan pumunta ka sa website na https://www.python.org/downloads/release/python-361/ at mag-download ng installer ng Python:

* Mag-download ng *Mac OS X 64-bit/32-bit installer* na file,
* I-double click ang *python-3.6.1-macosx10.6.pkg* para mapatakbo ang installer.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

Malamang na nainstall mo na ang Python out of of the box. Para masuri kung nainstall mo ito (at ano ang bersyon nito), buksan ang console at mag-type sa sumusunod na command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

Kung mayroon kang ibang 'micro version' ng Python na naka-install, e.g. 3.6.0, hindi mo na kailangang mag-upgrade. Kung wala kang Python na naka-install, o kung gusto mo ng ibang bersyon, maari mong i-install ito gamit ang sumusunod:

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

I-type ang command na ito sa iyong console:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3.6
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Gamitin ang command na ito sa iyong console:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

If you're on older Fedora versions you might get an error that the command `dnf` is not found. In that case, you need to use yum instead.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Gamitin ang command na ito sa iyong console:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Suriin kung ang pag-install ay matagumpay sa pamamagitan ng pagbukas ng command prompt at pagpapatakbo ng `python3` na command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

**PAALALA:** Kung ikaw ay nasa Windows at nakakuha ka ng error message na ang `python3` ay hindi nakita, subukang gumamit ng `python` (na walang `3`) at suriin kung ito ba ay bersyon na Python 3.6.

* * *

Kung may mga bagay na hindi sigurado, o kung may problema at wala kang ideya kung ano ang sunod na gagawin, magtanong sa inyong coach! Minsan mahihirapan ka sa mga bagay-bagay at mas mabuting humingi ng tulong sa may karanasan dito.