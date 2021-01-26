Git je "kontrolni sistem za ažuriranje programa" koji koristi veliki broj programera. Ovaj softver može da prati promene u fajlovima tako da u nekom trenutku možete da pozovete neku od prošlih verzija programa. To je slično opciji "praćenja promena" u programima za obradu teksta (kao što su npr. Microsoft Word ili LibreOffice Writer), samo što je mnogo moćnije.

## Instaliranje Git-a

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Možete da preuzmete Git sa [git-scm.com](https://git-scm.com/). Možete da kliknete na "next" (sledeći korak) tokom svakog koraka, osim u dva slučaja: u koraku gde treba da izaberete editor (potrebno je da izaberete Nano) i u koraku koji se zove "Adjusting your PATH environment" (prilagođavanje Vašeg PATH okruženja), gde treba da izaberete opciju na dnu - "Use Git and optional Unix tools from the Windows Command Prompt" (Koristite Git i Unix alate iz Windows komandne linije). Osim toga, podrazumevane opcije su u redu. Opcija "Checkout Windows-style, commit Unix-style line endings" je dobra.

Do not forget to restart the command prompt or PowerShell after the installation finished successfully. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Preuzmite Git sa linka [git-scm.com](https://git-scm.com/) i pratite instrukcije.

> **Napomena** Ukoliko imate operativni sistem X 10.6, 10.7 ili 10.8, potrebno je da preuzmete verziju sa ovog linka: [Git installer for OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

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