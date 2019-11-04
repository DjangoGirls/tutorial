Gitはたくさんのプログラマが利用する「バージョン管理システム」です。 このソフトウェアは、特定のバージョンを後で呼び出すことができるように、時間の経過とともにファイルへの変更を追跡することができます。 ワードプロセッサープログラム (例えば、Microsoft WordやLibreOffice Writer）の「変更履歴」機能をより強力にしたようなものです。

## Gitのインストール

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

[git-scm.com](https://git-scm.com/) からGitをダウンロードすることができます。 2つのステップを除いて「次へ」を押して進んで大丈夫です。エディタを選ぶステップでは、Nanoを選んでください。「PATH環境を調整する(Adjusting your PATH environment)」というステップでは、「Use Git and optional Unix tools from the Windows Command Prompt（WindowsコマンドプロンプトからGitとオプションのUnixツールを使用する）」（一番下の選択肢）を選択します。 それ以外はデフォルトの設定値で構いません。 改行コードの変換(Configuring the line ending conversions)については、「Checkout Windows-style, commit Unix-style line endings」の選択で大丈夫です。

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