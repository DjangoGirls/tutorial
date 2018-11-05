Gitはたくさんのプログラマが利用する「バージョン管理システム」です。 このソフトウェアは、特定のバージョンを後で呼び出すことができるように、時間の経過とともにファイルへの変更を追跡することができます。 A bit like the "track changes" feature in word processor programs (e.g., Microsoft Word or LibreOffice Writer), but much more powerful.

## Gitのインストール

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

[git-scm.com](https://git-scm.com/) からGitをダウンロードすることができます。 You can hit "next" on all steps except for two: in the step where it asks to choose your editor, you should pick Nano, and in the step entitled "Adjusting your PATH environment", choose "Use Git and optional Unix tools from the Windows Command Prompt" (the bottom option). それ以外はデフォルトの設定値で構いません。 改行コードの変換(Configuring the line ending conversions)については、「Checkout Windows-style, commit Unix-style line endings」の選択で大丈夫です。

インストールが正常に終了した後、コマンドプロンプトまたはPowerShellを再起動することを忘れないでください。<!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

[git-scm.com](https://git-scm.com/) からGitをダウンロードし、指示に従ってください。

> **注** OS X 10.6,10.7、または10.8を実行している場合は、ここからgitのバージョンをインストールする必要があります: [Git installer for OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

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