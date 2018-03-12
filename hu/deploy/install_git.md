A Git egy "version control system" (VCS, magyarul verziókezelő rendszer), amit sok programozó használ. Ez a szoftver nyomon követ minden változást a fájlokban, így a későbbiekben is visszatérhetünk egy bizonyos régebbi verzióhoz. Valamelyest hasonlít a "változások nyomon követése" funkcióhoz a Microsoft Wordben, de ez jóval hatékonyabb.

## Git telepítése

<!--sec data-title="Windows" data-id="git_install_windows"
data-collapse=true ces-->

A Gitet innen töltheted le: [git-scm.com](https://git-scm.com/). Telepítése: csak kattints a "next" gombra egészen addig, amíg el nem érsz az ötödik lépésig - "Adjusting your PATH environment" címmel - itt válaszd ki a "Run Git and associated Unix tools from the Windows command-line" lehetőséget (keresd alul). Ezen kívül a többi maradhat az alapbeállításon. Checkout Windows-style, commit Unix-style line endings - ezek is maradhatnak így.

<!--endsec-->

<!--sec data-title="OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Töltsd le a Git-tet az alábbi linken: [git-scm.com](https://git-scm.com/), majd kövesd az utasításokat.

> **Megjegyzés** Ha OS X 10.6, 10.7, vagy 10.8-et használsz, Az ezen a linken elérhető verziót kell telepítened: [Git teleptő OS X Snow Leopard-ra](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

<!--endsec-->

<!--sec data-title="Debian or Ubuntu" data-id="git_install_debian_ubuntu"
data-collapse=true ces-->

{% filename %}parancssor{% endfilename %}
```bash
$ sudo apt install git
```

<!--endsec-->

<!--sec data-title="Fedora (up to 21)" data-id="git_install_fedora_21"
data-collapse=true ces-->

{% filename %}parancssor{% endfilename %}
```bash
$ sudo yum install git
```

<!--endsec-->

<!--sec data-title="Fedora 22+" data-id="git_install_fedora_22"
data-collapse=true ces-->

{% filename %}parancssor{% endfilename %}
```bash
$ sudo dnf install git
```

<!--endsec-->

<!--sec data-title="openSUSE" data-id="git_install_openSUSE"
data-collapse=true ces-->

{% filename %}parancssor{% endfilename %}
```bash
$ sudo zypper install git
```

<!--endsec-->
