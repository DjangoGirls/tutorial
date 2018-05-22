Gitはたくさんのプログラマが利用する「ヴァージョン管理システム」です。 このソフトウェアは、特定のバージョンを後で呼び出すことができるように、時間の経過とともにファイルへの変更を追跡することができます。 Microsoft Wordの”トラックの変更（track changes)"のようですが、はるかに強力です。

## Gitのインストール

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

[git-scm.com](https://git-scm.com/) かからGitをダウンロードすることができます。 「PATH環境を調整する」の手順で、「WindowsコマンドプロンプトからGitとオプションのUnixツールを使用する」を選択します（下のオプション）。 他はすべてのステップで「次へ」を押して進んで大丈夫です。 Checkout Windows-style, commit Unix-style line endings is good.

インストールが正常に終了した後、コマンドプロンプトまたはPowerShellを再起動することを忘れないでください。<!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

[git-scm.com](https://git-scm.com/)からGitをダウンロードし、指示に従ってください。

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