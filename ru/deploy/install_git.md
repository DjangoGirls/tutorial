Git — это "система контроля версий", используемая множеством программистов. Эта программа отслеживает изменения, происходящие с файлами, чтобы впоследствии можно было восстановить состояние кода на нужный момент времени. Немного схоже с функцией "отслеживание изменений" в тестовых процессорах (например, Microsoft Word или LibreOffice Writer), только более мощное.

## Установка Git

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Ты можешь загрузить Git с официального сайта [git-scm.com](https://git-scm.com/). Ты можешь нажимать "дальше дальше дальше" на всех этапах установки за исключением одного: на пятом шаге, который называется "Adjusting your PATH environment" ("Настройка системной переменной PATH"), выберите "Run Git and associated Unix tools from the Windows command-line" ("Запуск Git и соответствующих Unix утилит через командную строку Windows", нижняя опция). Все остальные настройки можно оставить по умолчанию. Опция "Checkout Windows-style, commit Unix-style line endings" будет неплохим выбором.

Не забудьте перезагрузить (закрыть и открыть заново) командную строку или powershell после успешной установки. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Загрузите Git с [git-scm.com](https://git-scm.com/) и следуйте инструкциям.

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