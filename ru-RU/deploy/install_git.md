Git — это "система управления версиями", используемая множеством программистов. Эта программа отслеживает изменения, происходящие с файлами, чтобы впоследствии можно было восстановить состояние кода на нужный момент времени. Это немного похоже на функцию отслеживания изменений в Microsoft Word, но куда мощнее.

## Установка Git

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Ты можешь загрузить Git с официального сайта [git-scm.com](https://git-scm.com/). You can hit "next" on all steps except for one; in the step entitled "Adjusting your PATH environment", choose "Use Git and optional Unix tools from the Windows Command Prompt" (the bottom option). Все остальные настройки можно оставить по умолчанию. Опция "Checkout Windows-style, commit Unix-style line endings" будет неплохим выбором.

Не забудьте перезагрузить (закрыть и открыть заново) командную строку или powershell после успешной установки. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Загрузи Git с официального сайта [git-scm.com](https://git-scm.com/) и просто следуй инструкциям по установке.

> **Заметка** Если вы используете OS X 10.6, 10.7, or 10.8, вам необходимо установить версию git, расположенную здеесь: [Git installer for OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

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