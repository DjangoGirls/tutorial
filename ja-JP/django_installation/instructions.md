> このチャプターの一部はGeek Girls Carrots (https://github.com/ggcarrots/django-carrots) のチュートリアルに基づいています。
> 
> このチャプターの一部はCreative Commons Attribution-ShareAlike 4.0 International License のライセンスによる[django-marcador tutorial](http://django-marcador.keimlink.de/)に基づいています. このdjango-marcador tutorialはMarkus Zapke-Gründemann らが著作権を保有しています。 

## 仮想環境

Django をインストールする前に、あなたのコーディング環境を、きれいにしておく便利な道具をインストールしてもらいます。 このステップをとばすこともできますが、しかし、このステップをとばすことは全くお勧めしません。 可能な限りベストなセットアップで始めることは将来のたくさんのトラブルからあなたを救うはずですから！

さあ、**仮想環境（virtual environment )**(*virtualenv*とも呼ばれています）を作成してみましょう。 仮想環境（virtual environment）ではプロジェクト単位であなたのPython/Djangoのセットアップを他から隔離します。 これは、あなたがひとつのウェブサイトにおこなったどんな変更も、あなたが開発している他のサイトに影響を及ぼさないということです。 便利でしょ？

あなたがしなければならないのは、あなたが`仮想環境（virtual environment）`を作成したいディレクトリを見つけることです（たとえばホームディレクトリなどです）。 Windowsでは、ホームディレクトリは、`C:\Users\Name`と書かれているかもしれません (`Name`はあなたのログインネームです)。

> **補足：**　Windowsの方は、ディレクトリ名に特殊文字やアクセント記号を含まないよう気をつけてください。もし、ユーザー名が特殊文字を含む場合は、`C:\djangogirls` のようなディレクトリを作成してください。

このチュートリアルのために、ホームディレクトリに新しいディレクトリ`djangogirls`を作成します。

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

`myvenv`という仮想環境（virtual environment）を作成します。一般的なコマンドは以下のようになります：

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

新しい`virtualenv`を作成するために、コマンドプロンプトを開き（コマンドプロンプトについては何章か前にお話ししましたね。覚えてますか？）、`python -m venv myvenv`を実行して下さい。たとえばこのように入力します：

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

`myvenv` というところが、あなたの`virtualenv（仮想環境）` の名前です。 どんな名前でも使うことができますが、必ず小文字で表記し、スペース・アクセント記号・特殊文字は入れないでください。 短い名前にしておくのもいいアイデアですーあなたはこの名前を何度も参照しますから！

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

LinuxやOS Xで`virtualenv`を作るときは、`python3 -m venv myvenv`と実行するだけです。 たとえばこんな感じです：

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` は、あなたの `仮想環境(virtualenvironment)` の名前です。 どんな名前でも使うことができますが、必ず小文字で表記し、スペースは入れないでください。 短い名前にしておくのもいいアイデアですーあなたはこの名前を何度も参照しますから！

> **補足：**DebianやUbuntuのバージョンによっては、以下のエラーが出ることがあります。
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>        apt install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>     
> 
> この場合、エラー内の指示にしたがって、`python3-venv`のパッケージをインストールしましょう。 {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python3-venv
>     
> 
> **補足：**DebianやUbuntuのバージョンによっては、この仮想環境を実行すると、次のようなエラーがでます。
> 
> {% filename %}command-line{% endfilename %}
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
>     
> 
> このエラーを回避するために、代わりに`virtualenv`コマンドを使います。
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python-virtualenv
>     $ virtualenv --python=python3.6 myvenv
>     
> 
> **補足：**もし以下のようなエラーがでたら、
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> 代わりに次のコマンドを実行してください。
> 
> {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python3.6-venv
>     

<!--endsec-->

## 仮想環境の操作

上に示したコマンドは仮想環境（基本的には一連のディレクトリとファイル）を含む`myvenv` という名前（あるいはあなたが選んだ名前）のディレクトリを生成します。次に我々がしたいのは、これを実行し、開始することです。

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

実行して、仮想環境を起動します。

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls > myvenv\Scripts\activate
    

> **補足：**Windows 10では、`execution of scripts is disabled on this system`というエラーがWindows PowerShellに出ることがあります。 その場合は、Windows PowerShellを「管理者として開く」で、管理者権限で新しくウィンドウを開いてください。 そして、仮想環境を開始する前に、以下のコマンドを入力してください。
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     
> 
> **NOTE:** For users of the popular editor VS Code, which come with an integrated terminal based off windows powershell, if you wish to stick with the integrated terminal, you may run the following command to activate your virtual environment:
> 
>     $ . myvenv\Scripts\activate.ps1
>     
> 
> The advantage is that you don't have to switch between editor windows and command-line windows

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

実行して、仮想環境を起動します。

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

`myvenv`のところをあながた選んだ`仮想環境(virtualenvironment)`名に置き換えることを忘れないで下さいね！

> **備考:** `source` ではできない場合もあります。その場合は、代わりに以下のように入力してみてください：
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

`virtualenv` が起動すると、プロンプトの行頭に`(myvenv)`が現れます。

Virtual environment(仮想環境) の中で作業しているとき、`python`は自動的に正しいバージョンの`Python`を参照しますので、`python3`の代わりに`python`を使うことができます.

OK,これでDjangoのインストール前に入れておきたい依存関係の準備がすべて整いました。いよいよDjangoのインストールです！

## Djangoのインストール

今度はあなたの`virtualenv`を起動したので、Djangoをインストールすることができます。

これを行う前に、Djangoのインストールに使用する最新バージョンの`pip`がインストールされている必要があります。

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python -m pip install --upgrade pip
    

### Requirementsファイルによってパッケージをインストールする

Requirementsファイルは`pip install`でインストールするためのパッケージリストが記載されているファイルです:

前にインストールしたエディタを使用して、最初に `requirements.txt` ファイルを `djangogirls/` フォルダの中に作ります。 エディタで新しいファイルを開いて`djangogirls/`フォルダ内に`requirements.txt`という名前で保存してください。 ディレクトリはこんな感じになっているはずです:

    djangogirls
    └───requirements.txt
    

`djangogirls/requirements.txt` ファイル中に以下のテキストを追加します:

{% filename %}djangogirls/requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

そして、`pip install -r requirements.txt` を実行してDjangoをインストールします。

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install -r requirements.txt
    Collecting Django~={{ book.django_version }} (from -r requirements.txt (line 1))
      Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.1MB)
    Installing collected packages: Django
    Successfully installed Django-{{ book.django_version }}
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> If you get an error when calling pip on Windows platform, please check if your project pathname contains spaces, accents or special characters (for example, `C:\Users\User Name\djangogirls`). If it does, please consider using another place without spaces, accents or special characters (suggestion: `C:\djangogirls`). Create a new virtualenv in the new directory, then delete the old one and try the above command again. (Moving the virtualenv directory won't work since virtualenv uses absolute paths.)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Your command line might freeze after when you try to install Django. If this happens, instead of the above command use:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install -r requirements.txt
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> If you get an error when calling pip on Ubuntu 12.04 please run `python -m pip install -U --force-reinstall pip` to fix the pip installation in the virtualenv.

<!--endsec-->

以上です！あなたは（ついに）Djangoアプリケーションを作成する準備が整いました！