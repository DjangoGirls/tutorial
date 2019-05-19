Git è un "sistema di controllo versione" utilizzato da molti programmatori. Questo software può tracciare le modifiche ai file nel corso del tempo, così da poter ripristinare successivamente una specifica versione. Un po' come la funzione "revisioni" nei programmi di elaborazione di testi (come Microsoft Word o LibreOffice), ma molto più potente.

## Installare Git

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

È possibile scaricare Git da [git-scm.com](https://git-scm.com/). Puoi saltare tutti i passaggi tranne due: nel passaggio dove ti chiede di scegliere l'editor, dovrai selezionare Nano, e nel passaggio "Regolazione della variabile di ambiente PATH", seleziona "Esegui Git e gli strumenti Unix opzionali dal prompt dei comandi di Windows" (l'opzione in basso). A parte questo, i valori predefiniti vanno bene. 'Checkout Windows-style' e 'commit Unix-style line endings' vanno bene.

Non dimenticare di riavviare il prompt dei comandi o la powershell dopo che l'installazione è terminata con successo. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Scarica Git da [git-scm.com](https://git-scm.com/) e segui le istruzioni.

> **Nota** Se stai usando OS X 10.6, 10.7 o 10.8, dovrai installare la versione di Git da qui: [Git installer for OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

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