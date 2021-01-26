Git是一个被大量程序员使用的"版本控制系统"。 此软件可以跟踪任何时间文件的改变，这样你以后可以随时召回某个特定版本。 这有点像文本编辑器中的“文档历史”功能（比如 Microso Word 或 LibreOffice Writer），但更强大。

## 安装Git

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

你可以从 [git-scm.com](https://git-scm.com/) 下载Git。 全程除了在选择编辑器这一步你需要选择Nano和在调整系统PATH环境选择在Windows Command Prompt中使用Git和其他Unix工具这两步，你可以一直点击next。 除此之外，默认值都没有问题。 签出时使用 Windows 风格的换行符，提交时使用 Unix 风格的换行符，这样比较好。

Do not forget to restart the command prompt or PowerShell after the installation finished successfully. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

从[git-scm.com](https://git-scm.com/)下载Git,根据说明操作。

> **注意** 如果您正在运行 OS X 10.6, 10.7 或 10.8, 您需要在这里安装 git 版本：[Git 安装操作系统 X Snon Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

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