Git je "systém na správu verzií", ktorý využíva množstvo programátoriek a programátorov. Tento softvér sleduje v priebehu času zmeny v tvojich súboroch, takže sa kedykoľvek môžeš vrátiť ku konkrétnej verzii. Je to v podstate niečo ako nástroj na nasledovanie zmien v programoch na spracovanie textu (napr. Microsoft Word alebo LibreOffice Writer), ale omnoho mocnejšie.

## Inštalácia Gitu

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Git si môžeš stiahnuť z [git-scm.com](https://git-scm.com/). Môžeš bez obáv klikať na "ďalej" pri všetkých krokoch okrem jedného. V kroku, kde to od teba bude chcieť, aby si si vybrala svoj editor, by si si mala vybrať Nano, a v kroku "Adjusting your PATH environment" zvoľ "Use Git and optional Unix tools from the Windows Command Prompt" (spodná možnosť). V ostatných prípadoch sú predvolené nastavenia v poriadku. Možnosť "Checkout Windows-style, commit Unix-style line endings" je OK.

Ak ti bude počas inštalácie ponúknutá možnosť "Adjusting the name of the initial branch in new repositories", prosím, zvoľ "Override the default" a použi "main". Týmto bude tvoja inštalácia Gitu v súlade so všeobecným smerovaním globálnej programátorskej komunity. Vetvu "main" budeme používať v celom tomto tutoriáli. Pozri, prosím, na https://sfconservancy.org/news/2020/jun/23/gitbranchname/ a https://github.com/github/renaming pre viac detailov o tejto téme.

Nezabudni reštartovať príkazový riadok alebo PowerShell po úspešnom dokončení inštalácie. <!--endsec-->

<!--sec data-title="Installing Git: macOS" data-id="git_install_OSX"
data-collapse=true ces-->

Stiahni si Git z [git-scm.com](https://git-scm.com/) a riaď sa inštrukciami.

Ak ti bude počas inštalácie ponúknutá možnosť "Adjusting the name of the initial branch in new repositories", prosím, zvoľ "Override the default" a použi "main". Týmto bude tvoja inštalácia Gitu v súlade so všeobecným smerovaním globálnej programátorskej komunity. Vetvu "main" budeme používať v celom tomto tutoriáli. Pozri, prosím, na https://sfconservancy.org/news/2020/jun/23/gitbranchname/ a https://github.com/github/renaming pre viac detailov o tejto téme.

> **Poznámka** Ak používaš OS X 10.6, 10.7 alebo 10.8, budeš musieť nainštalovať verziu Gitu odtiaľto: [Git installer for OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

<!--endsec-->

<!--sec data-title="Installing Git: Debian or Ubuntu" data-id="git_install_debian_ubuntu"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
$ sudo apt install git
```

### Upravenie prednastaveného názvu vetvy

Týmto bude tvoja inštalácia Gitu v súlade so všeobecným smerovaním globálnej programátorskej komunity. Vetvu "main" budeme používať v celom tomto tutoriáli. Pozri, prosím, na https://sfconservancy.org/news/2020/jun/23/gitbranchname/ a https://github.com/github/renaming pre viac detailov o tejto téme.

{% filename %}command-line{% endfilename %}

    $ git config --global --add init.defaultBranch main
    

<!--endsec-->

<!--sec data-title="Installing Git: Fedora" data-id="git_install_fedora"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
$ sudo dnf install git
```

### Upravenie prednastaveného názvu vetvy

Týmto bude tvoja inštalácia Gitu v súlade so všeobecným smerovaním globálnej programátorskej komunity. Vetvu "main" budeme používať v celom tomto tutoriáli. Pozri, prosím, na https://sfconservancy.org/news/2020/jun/23/gitbranchname/ a https://github.com/github/renaming pre viac detailov o tejto téme.

{% filename %}command-line{% endfilename %}

    $ git config --global --add init.defaultBranch main
    

<!--endsec-->

<!--sec data-title="Installing Git: openSUSE" data-id="git_install_openSUSE"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
$ sudo zypper install git
```

### Upravenie prednastaveného názvu vetvy

Týmto bude tvoja inštalácia Gitu v súlade so všeobecným smerovaním globálnej programátorskej komunity. Vetvu "main" budeme používať v celom tomto tutoriáli. Pozri, prosím, na https://sfconservancy.org/news/2020/jun/23/gitbranchname/ a https://github.com/github/renaming pre viac detailov o tejto téme.

{% filename %}command-line{% endfilename %}

    $ git config --global --add init.defaultBranch main
    

<!--endsec-->