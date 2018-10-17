> 家で１人でこのチャプターに挑戦している方へ：この章は、動画（英語）もあるので参考にしてください。 [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA)
> 
> このセクションはGeek Girls Carrots (https://github.com/ggcarrots/django-carrots) のチュートリアルをベースに作成しました。

Django は、Pythonで開発されています。なにをするにせよ、まずはPythonが必要です。インストールしましょう！ Python 3.6 をインストールします。3.5以前のバージョンをインストール済みの場合は、アップグレードしてください。

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Windowsをお使いのかたは、まずシステム情報を開き、システムの種類が32-bitバージョンか64-bitバージョンかを確認します（システム情報の開き方：Windowsキー + Pause/Break キー　もしくは　コントロールパネル＞システムとセキュリティ＞システムを開く）。 Python for Windowsは、https://www.python.org/downloads/windows/ からダウンロードできます。 「Latest Python 3 Release - Python x.x.x」のリンクをクリックしてください。 お使いのコンピュータが**64ビット**版のWindowsを実行している場合は、**Windows x86-64 executable installer**をダウンロードしてください。 32ビット版の場合は、**Windows x86 executable installer**をダウンロードします。 インストーラをダウンロードしたら、それを実行して（ダブルクリックして）インストーラの指示に従ってください。

**インストール時に必ず「Add Python 3.6 to PATH」にチェックをいれましょう**：

![Pythonのパスを通すのを忘れないようにしてください。](../python_installation/images/python-installation-options.png)

When the installation completes, you may see a dialog box with a link you can follow to learn more about Python or about the version you installed. Close or cancel that dialog -- you'll be learning more in this tutorial!

In upcoming steps, you'll be using the Windows Command Line (which we'll also tell you about). For now, if you need to type in some commands, go to Start menu and enter "Command Prompt" into the search field there. (On older versions of Windows, you can start the Command Line with Start menu → Windows System → Command Prompt.) You can also hold in the Windows key and press the "R"-key until the "Run" window pops up. To open the Command Line, type "cmd" and press enter in the "Run" window.

![Type "cmd" in the "Run" window](../python_installation/images/windows-plus-r.png)

Note: if you are using an older version of Windows (7, Vista, or any older version) and the Python 3.6.x installer fails with an error, you can try either:

1. すべてのWindowsアップデートをインストールして、Python 3.6を再インストールしてみる。
2. [古いバージョンのPython](https://www.python.org/downloads/windows/)をインストールしてみる。例えば[3.4.6](https://www.python.org/downloads/release/python-346/)。

If you install an older version of Python, the installation screen may look a bit different than shown above. Make sure you scroll down to see "Add python.exe to Path", then click the button on the left and pick "Will be installed on local hard drive":

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **注意**：OS XにPythonをインストールする前に、Macの設定でApp Store以外のパッケージをインストールできるようにする必要があります。 「システム環境設定」（「アプリケーション」フォルダ内）に移動し、「セキュリティとプライバシー」、「一般」タブの順にクリックします。 「ダウンロードしたアプリを許可する」が「Mac App Store」に設定されている場合は、「Mac App Storeと識別された開発者」に変更します。

You need to go to the website https://www.python.org/downloads/release/python-361/ and download the Python installer:

* *macOS 64-bit/32-bit installer* ファイルをダウンロードしてください。
* *python-3.6.5-macosx10.6.pkg*をダブルクリックしてインストーラーを実行してください。

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

It is very likely that you already have Python installed out of the box. To check if you have it installed (and which version it is), open a console and type the following command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.5
    

If you have a different 'micro version' of Python installed, e.g. 3.6.0, then you don't have to upgrade. If you don't have Python installed, or if you want a different version, you can install it as follows:

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Type this command into your console:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3.6
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Use this command in your console:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

If you're on older Fedora versions you might get an error that the command `dnf` is not found. In that case, you need to use `yum` instead.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Use this command in your console:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Verify the installation was successful by opening a command prompt and running the `python3` command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python 3.6.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.