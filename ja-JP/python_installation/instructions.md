> 家で１人でこのチャプターに挑戦している方へ：この章は、動画（英語）もあるので参考にしてください。 [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA)
> 
> このセクションはGeek Girls Carrots (https://github.com/ggcarrots/django-carrots)のチュートリアルをベースに作成しました。

Django は、Pythonで開発されています。なにをするにせよ、まずはPythonが必要です。インストールしましょう！ Python 3.6 をインストールします。3.5以前のバージョンをインストール済みの場合は、アップグレードしてください。

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Windowsをお使いのかたは、まずシステム情報を開き、システムの種類が32-bitバージョンか64-bitバージョンかを確認します（システム情報の開き方：Windowsキー + Pause/Break キー　もしくは　コントロールパネル＞システムとセキュリティ＞システムを開く）。 Python for Windowsは、https://www.python.org/downloads/windows/ からダウンロードできます。 「Latest Python 3 Release - Python x.x.x」のリンクをクリックしてください。 お使いのコンピュータが**64ビット**版のWindowsを実行している場合は、**Windows x86-64 executable installer**をダウンロードしてください。 32ビット版の場合は、**Windows x86 executable installer**をダウンロードします。 インストーラをダウンロードしたら、それを実行して（ダブルクリックして）インストーラの指示に従ってください。

**インストール時に必ず「Add Python 3.6 to PATH」にチェックをいれましょう**：

![Pythonのパスを通すのを忘れないようにしてください。](../python_installation/images/python-installation-options.png)

次のステップでは、Windowsコマンドラインを使用します（コマンドラインについては後ほど詳しく教えます）。 For now, if you need to type in some commands, go to Start menu and enter "Command Prompt" into the search field there. (On older versions of Windows, you can start the Command Line with Start menu → Windows System → Command Prompt.) You can also hold in the Windows key and press the "R"-key until the "Run" window pops up. コマンドプロンプトを開くには、そこに "cmd" と入力してenterキーを押します。

!["ファイル名を指定して実行"で、"cmd"と入力してください](../python_installation/images/windows-plus-r.png)

注意：古いバージョンのWindows（7、Vista、またはそれ以前のバージョン）を使用していて、Python 3.6.xインストーラがエラーで失敗した場合、次のいずれかを試みることができます：

1. すべてのWindowsアップデートをインストールして、Python 3.6を再インストールしてみる。
2. [古いバージョンのPython](https://www.python.org/downloads/windows/)をインストールしてみる。例えば[3.4.6](https://www.python.org/downloads/release/python-346/)。

古いバージョンのPythonをインストールする場合、インストール画面は上記のものとは多少異なる場合があります。 下にスクロールして「Add python.exe to Path」のところを左クリックして「Will be installed on local hard drive（ローカルハードドライブにインストールされます）」を選択してください：

![古いバージョンのパスを追加してください](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **注意**：OS XにPythonをインストールする前に、Macの設定でApp Store以外のパッケージをインストールできるようにする必要があります。 「システム環境設定」（「アプリケーション」フォルダ内）に移動し、「セキュリティとプライバシー」、「一般」タブの順にクリックします。 「ダウンロードしたアプリを許可する」が「Mac App Store」に設定されている場合は、「Mac App Storeと識別された開発者」に変更します。

Webサイトからダウンロードしてインストールしましょう。 https://www.python.org/downloads/

* *macOS 64-bit/32-bit installer* ファイルをダウンロードしてください。
* *python-3.6.5-macosx10.6.pkg*をダブルクリックしてインストーラーを実行してください。

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

おそらく殆どの場合、Pythonはすでにインストール済みでしょう。インストールされているか確認するためには（バージョンを確認するためにも）、コンソールを起動して次のコマンドを打ってください。

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.5
    

このとき、バージョンの数字の最後が違っていたとしても（例えば、3.6.0など）、アップグレードする必要はありません。 もし、Pythonがインストールされていない場合、あるいはバージョンが古い場合は、次の指示に従ってインストールしてください。

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

次のコマンドをコンソールに打って下さい。

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3.6
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

次のコマンドをコンソールに打って下さい。

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

古いバージョンのFedoraの場合は、コマンド `dnf` が見つからないというエラーが表示されます。その場合は、代わりに yum を使用してください。

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

次のコマンドをコンソールに打って下さい。

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

インストールされているか確認するために、コマンドプロンプトを開いて次のように`Python3`コマンドを入力してください。

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

**注意：** Windowsをお使いで`python3`が見つからないエラーが出る場合、 代わりに`python`と入力して、バージョンがPython3.6と出てくるか確認してください。（`3`を抜いてみましょう）

* * *

分からない時や、質問がある時は、コーチに質問してくださいね。 ときどき上手くいかないこともあります。そんな時は、経験豊富な人に聞くといいですよ。