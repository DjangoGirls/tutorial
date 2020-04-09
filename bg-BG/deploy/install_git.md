Git е "система за контрол на версиите", използвана от много програмисти. Този софтуер може да проследява промените във файловете с течение на времето, така че да можете да заредите конкретни версии по-късно. Нещо като функцията „проследяване на промените“ в програми за текстообработка (например, Microsoft Word или LibreOffice Writer), но много по-мощна.

## Инсталиране на Git

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Можете да свалите Git от [git-scm.com](https://git-scm.com/). Можете да натиснете „ next“ на всички стъпки, с изключение на две: в стъпката, където се изисква да изберете вашия редактор, трябва да изберете Nano, и в стъпката, озаглавена „Настройка на вашата PATH среда“, изберете „Използване на Git и незадължителни инструменти на Unix от командния ред на Windows " (най-долната опция). Освен това, настройките по подразбиране са добре. Разгледайте Windows стил, Unix стил за окончанията на редовете е добре.

Не забравяйте да рестартирате командния ред или powershell, след като инсталацията приключи успешно. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Свалете Git от [git-scm.com](https://git-scm.com/) и следвайте инструкцията.

> **Забележка** Ако използвате OS X 10.6, 10.7 или 10.8, ще трябва да инсталирате версията на git от тук: [Инсталатор на Git за OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

<!--endsec-->

<!--sec data-title="Installing Git: Debian or Ubuntu" data-id="git_install_debian_ubuntu"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
$ sudo apt install git
```

<!--endsec-->

<!--sec data-title="Installing Git: Fedora" data-id="git_install_fedora"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
$ sudo dnf install git
```

<!--endsec-->

<!--sec data-title="Installing Git: openSUSE" data-id="git_install_openSUSE"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
$ sudo zypper install git
```

<!--endsec-->