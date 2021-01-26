Git คือ "version control system" ถูกใช้โดยโปรแกรมเมอร์จำนวนมาก ซอฟต์แวร์นี้สามารถติดตามการเปลี่ยนแปลงของไฟล์ในทุกช่วงเวลาเพื่อให้คุณสามารถย้อนกลับไปยังเวอร์ชันเก่าๆ ได้ในภายหลัง A bit like the "track changes" feature in word processor programs (e.g., Microsoft Word or LibreOffice Writer), but much more powerful.

## ติดตั้ง Git

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

คุณสามารถดาวน์โหลด Git ได้จาก [git-scm.com](https://git-scm.com/) You can hit "next" on all steps except for two: in the step where it asks to choose your editor, you should pick Nano, and in the step entitled "Adjusting your PATH environment", choose "Use Git and optional Unix tools from the Windows Command Prompt" (the bottom option). นอกเหนือจากนั้น ใช้ค่าเริ่มต้นก็โอเคแล้ว นั่นคือ Checkout Windows-style, commit Unix-style line endings

Do not forget to restart the command prompt or PowerShell after the installation finished successfully. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Download Git from [git-scm.com](https://git-scm.com/) and follow the instructions.

> **Note** If you are running OS X 10.6, 10.7, or 10.8, you will need to install the version of git from here: [Git installer for OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

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