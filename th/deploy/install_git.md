Git คือ "version control system" ถูกใช้โดยโปรแกรมเมอร์จำนวนมาก ซอฟต์แวร์นี้สามารถติดตามการเปลี่ยนแปลงของไฟล์ในทุกช่วงเวลาเพื่อให้คุณสามารถย้อนกลับไปยังเวอร์ชันเก่าๆ ได้ในภายหลัง คล้ายกับฟีเจอร์ "track changes" ใน Microsoft Word แต่มีประสิทธิภาพมากกว่า

## ติดตั้ง Git

<!--sec data-title="Windows" data-id="git_install_windows"
data-collapse=true ces-->

You can download Git from [git-scm.com](https://git-scm.com/). You can hit "next" on all steps except for one; in the fifth step entitled "Adjusting your PATH environment", choose "Use Git and optional Unix tools from the Windows Command Prompt" (the bottom option). นอกเหนือจากนั้น ใช้ค่าเริ่มต้นก็โอเคแล้ว นั่นคือ Checkout Windows-style, commit Unix-style line endings

Do not forget to restart the command prompt or powershell after the installation finished successfully. <!--endsec-->

<!--sec data-title="OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Download Git from [git-scm.com](https://git-scm.com/) and just follow the instructions.

> **Note** If you are running OS X 10.6, 10.7, or 10.8, you will need to install the version of git from here: [Git installer for OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

<!--endsec-->

<!--sec data-title="Debian or Ubuntu" data-id="git_install_debian_ubuntu"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
$ sudo apt-get install git
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