Git je "systém na správu verzií", ktorý využíva množstvo programátorov. Tento softvér sleduje v priebehu času zmeny v tvojich súboroch, takže sa kedykoľvek môžeš vrátiť ku konkrétnej verzii. Niečo ako funkcia "sledovať zmeny" vo Worde, ale oveľa výkonnejšie.

## Inštalácia Gitu

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Git si môžeš stiahnuť z [git-scm.com](https://git-scm.com/). Môžeš bez obáv klikať na "ďalej ďalej ďalej" pri všetkých krokoch okrem jedného. V kroku 5, označenom ako "Nastavenie prostredia PATH", zvoľ "Spustiť Git a príslušné Unixové nástroje z príkazového riadku systému Windows" (spodná možnosť). V ostatných prípadoch sú predvolené nastavenia v poriadku. Možnosť "Checkout Windows-style, commit Unix-style line endings" je OK.

Nezabudni reštartovať príkazový riadok alebo PowerShell po úspešnom dokončení inštalácie. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Stiahni si Git z [git-scm.com](https://git-scm.com/) a riaď sa inštrukciami.

> **Poznámka:** Ak používaš OS X 10.6, 10.7 alebo 10.8, budeš musieť nainštalovať verziu git-tu odtialto: [Git installer for OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

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