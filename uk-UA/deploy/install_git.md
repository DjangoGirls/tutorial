Git - це "система контролю версій", яка використовується багатьма розробниками. Ця програма дозволяє відслідковувати зміни до файлів з часом так, що ви можете повернутись до певних версій пізніше. Схоже на функцію "слідкувати за змінами" в Microsoft Word, але набагато потужніше.

## Встановлення Git

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Ви можете завантажити Git з [git-scm.com](https://git-scm.com/). You can hit "next" on all steps except for one; in the step entitled "Adjusting your PATH environment", choose "Use Git and optional Unix tools from the Windows Command Prompt" (the bottom option). Крім цього, стандартні налаштування добрі. Вимкніть закінчення рядків в стилі Windows, ввімкніть в стилі Unix, вони кращі.

Do not forget to restart the command prompt or powershell after the installation finished successfully. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Download Git from [git-scm.com](https://git-scm.com/) and follow the instructions.

> **Note** If you are running OS X 10.6, 10.7, or 10.8, you will need to install the version of git from here: [Git installer for OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

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