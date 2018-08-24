Ang Git ay isang "version control system" na ginagamit ng napakaraming mga programmer. Ang software na ito ay maaring magsubaybay sa mga pagbabago sa mga files sa paglipas ng panahon para matandaan mo ang mga bersyon mamaya. Parang katulad ng "track changes" na katangian ng Microsoft Word, pero mas malakas pa.

## Pag-install ng Git

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Maari kang mag-download ng Git mula sa [git-scm.com](https://git-scm.com/). You can hit "next" on all steps except for one; in the step entitled "Adjusting your PATH environment", choose "Use Git and optional Unix tools from the Windows Command Prompt" (the bottom option). Maliban dyan, ang mga default na setting ay mainam na. Tingnan ang Windows-style, maganda ang pag-commit ng Unix-style na line endings.

Huwag kalimutan na i-restart ang command prompt o powershell pagkatapos nang matagumpay na pag-install. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Download Git from [git-scm.com](https://git-scm.com/) and follow the instructions.

> **Paalala**Kung ang gamit mo ay OS X 10.6, 10.7 o 10.8, kailangan mong i-install ang bersyon ng git galing dito: [Git Installer for OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

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