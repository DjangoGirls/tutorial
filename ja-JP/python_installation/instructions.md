> 家で１人でこのチャプターに挑戦している方へ：この章は、動画（英語）もあるので参考にしてください。 [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA)
> 
> このセクションはGeek Girls Carrots (https://github.com/ggcarrots/django-carrots) のチュートリアルをベースに作成しました。

DjangoはPythonで書かれています。 Djangoを使うにはPythonが必要です。 では、インストールするところから始めましょう！ 最新のPython３をインストールしてください。それ以前のPythonがインストールされていたら、アップグレードする必要があります。 3.4より新しいバージョンであれば問題ありません。

下に書いたとおりのやり方で、Pythonをインストールしてください。すでにAnacondaが入っていても以下のとおりにインストールしてください。

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

First check whether your computer is running a 32-bit version or a 64-bit version of Windows, on the "System type" line of the System Info page. To reach this page, try one of these methods:

* WindowsキーとPause/Breakキーを同時に押します
* Open your Control Panel from the Windows menu, then navigate to System & Security, then System
* Press the Windows button, then navigate to Settings > System > About

https://www.python.org/downloads/windows/ からWindows版のPythonをダウンロードできます。 "Latest Python 3 Release - Python x.x.x" というリンクをクリックします。 あなたのWindowsが**64-bit版**なら、**Windows x86-64 executable installer**をダウンロードしてください。 そうでなければ**Windows x86 executable installer**をダウンロードしてください。 インストーラーがダウンロードできたら、ダブルクリックして実行し、指示に従ってください。

インストールの途中で、「Setup」というタイトルのウィンドウがでてきたら注意してください。 下にあるとおり、「Add Python 3.6 to PATH」か「Add Python to your environment variables」をチェックしてから「Install Now」をクリックしてください (バージョンが違うと表示が違うこともあります)。

![Don't forget to add Python to the Path](../python_installation/images/python-installation-options.png)

インストールが終わったら、ダイアログボックスが出てきます。ボックス内のリンクを開くと、インストールしたPythonのバージョンを説明したページに行けます。 ダイアログは閉じてしまいましょう。Pythonの使い方はこのチュートリアルでたっぷり勉強します！

注意: あなたのWindowsがWindows7、Windows Vistaや、それ以前のバージョンの場合で、Python3.6.x のインストールがエラーがでて失敗する場合は、下のどちらかのやり方を試してください。

1. Windows Updateを実行してすべての更新ファイルを入れてから、Pythonを入れ直すか、
2. [古いバージョンのPython](https://www.python.org/downloads/windows/)をインストールしてみる。例えば[3.4.6](https://www.python.org/downloads/release/python-346/)。

古いバージョンのPythonをインストールした場合、インストール画面は上のものと違うことがあります。 下にスクロールして「Add python.exe to Path」のところを左クリックして「Will be installed on local hard drive（ローカルハードドライブにインストールされます）」を選択してください

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **注意**：OS XにPythonをインストールする前に、Macの設定でApp Store以外のパッケージをインストールできるようにする必要があります。 「システム環境設定」（「アプリケーション」フォルダ内）に移動し、「セキュリティとプライバシー」、「一般」タブの順にクリックします。 「ダウンロードしたアプリを許可する」が「Mac App Store」に設定されている場合は、「Mac App Storeと識別された開発者」に変更します。

https://www.python.org/downloads/release/python-361/ からPythonインストーラーをダウンロードします。

* *Mac OS X 64-bit/32-bit installer* というファイルをダウンロードします。 
* ダウンロードできたら *python-3.6.1-macosx10.6.pkg* をダブルクリックして実行します。

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

すでにPythonがインストールされているかもしれません。インストールされてるかどうか、どのバージョンが入っているのか確かめるにはコンソールを開いて下のコマンドを入力してください。

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.5
    

表示されたバージョンが3.4.0以降(例えば 3.6.0など)のものであれば大丈夫です。アップグレードの必要はありません。 Pythonがインストールされていなかったり、違うバージョンをインストールしたい場合は、まずパソコンのLinuxディストリビューションがなにか確かめてから、下のコマンドを実行してください。

{% filename %}command-line{% endfilename %}

    $ grep ^NAME= /etc/os-release
    

表示されたディストリビューション名に従って、以下のインストール方法を実行してください。

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

下のコマンドをコンソールに入力します。

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

下のコマンドをコンソールに入力します。

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

Fedoraのバージョンが古い場合、 `dnf` コマンドが見つからないというエラーが出るかもしれません。そんなときは変わりに `yum` コマンドを使ってください。

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

下のコマンドをコンソールに入力します。

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

インストールがうまく言ってるか見るには、コンソールに `python3` と打ち込んでください。

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

バージョンはあなたがインストールされたものが表示されます。なのでPython 3.6.1 と表示されないかもしれません。

**注意:** Windowsで `python3` を実行して、コマンドが見つからないとエラーが出た場合、代わりに `python` (`3` をコマンドに入れていません) と入れてみてください。3.4.0かそれ以上のPythonがインストールされていれば大丈夫です。 If that doesn't work either, you may open a new command prompt and try again; this happens if you use a command prompt left open from before the Python installation.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.