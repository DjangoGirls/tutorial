Git jest "systemem kontroli wersji", którego używa wielu programistów. Program ten śledzi zmiany w plikach na przestrzeni czasu, dzięki czemu możesz później przywracać wybrane wersje tych plików. Trochę jak funkcja "Śledź zmiany" w programach do edytowania tekstu (np. programu Microsoft Word lub LibreOffice Writer), ale jest o wiele potężniejsza.

## Instalacja Gita

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Możesz ściągnąć Gita z [git-scm.com](https://git-scm.com/). Naciśnij "next" na wszystkich krokach z wyjątkiem dwóch: w kroku, w którym prosi o wybranie edytora, powinnaś wybrać Nano, a w kroku zatytułowanym "Adjusting your PATH environment" wybrać "Use Git and optional Unix tools from the Windows Command Prompt" (dolna opcja). Poza tym domyślne ustawienia są w porządku. Upewnij się jeszcze, że w kroku "Configuring the line ending conversions" wybrana jest opcja "Checkout Windows-style, commit Unix-style line endings".

Do not forget to restart the command prompt or PowerShell after the installation finished successfully. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Ściągnij Gita z [git-scm.com](https://git-scm.com/) i postępuj zgodnie z instrukcją.

> **Uwaga**Jeżeli działasz na OS X 10.6, 10.7 lub 10.8, będziesz musiała zainstalować wersję gita dostępną tutaj: [Git installer for OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

<!--endsec-->

<!--sec data-title="Installing Git: Debian or Ubuntu" data-id="git_install_debian_ubuntu"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
sudo apt install git
```

<!--endsec-->

<!--sec data-title="Installing Git: Fedora" data-id="git_install_fedora"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
sudo dnf install git
```

<!--endsec-->

<!--sec data-title="Installing Git: openSUSE" data-id="git_install_openSUSE"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
sudo zypper install git
```

<!--endsec-->