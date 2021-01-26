Git — это «система управления версиями», используемая множеством программистов. Эта программа отслеживает изменения, происходящие с файлами, чтобы впоследствии можно было восстановить состояние кода на нужный момент времени. Это немного похоже на функцию отслеживания изменений в Microsoft Word, но куда мощнее.

## Установка Git

<!--sec data-title="Windows" data-id="git_install_windows"
data-collapse=true ces-->

Ты можешь загрузить Git с официального сайта [git-scm.com](https://git-scm.com/). Ты можешь нажимать "дальше, дальше, дальше" на всех этапах установки за исключением одного: на пятом шаге, который называется "Adjusting your PATH environment" (Настройка системной переменной Path), выбери "Use Git and optional Unix tools from the Windows Command Prompt" (Запуск Git и соответствующих Unix утилит через командную строку Windows, нижняя опция). Все остальные настройки можно оставить по умолчанию. Также неплохо будет выбрать опцию "Checkout Windows-style, commit Unix-style line endings".

После окончания установки не забудь перезапустить командную строку или PowerShell.
<!--endsec-->

<!--sec data-title="OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Загрузи Git с официального сайта [git-scm.com](https://git-scm.com/) и просто следуй инструкциям по установке.

> **Примечание:** если ты используешь OS X 10.6, 10.7 или 10.8, тебе придётся установить git отсюда: [Установка Git для OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

<!--endsec-->

<!--sec data-title="Debian и Ubuntu" data-id="git_install_debian_ubuntu"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```bash
$ sudo apt install git
```

<!--endsec-->

<!--sec data-title="Fedora" data-id="git_install_fedora"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```bash
$ sudo dnf install git
```

<!--endsec-->

<!--sec data-title="openSUSE" data-id="git_install_openSUSE"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```bash
$ sudo zypper install git
```

<!--endsec-->
