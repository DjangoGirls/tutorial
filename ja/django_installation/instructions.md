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

<!--sec data-title="Virtual environment: Linux and macOS" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

LinuxやmacOSで`virtualenv`を作るときは、`python3 -m venv myvenv`と実行するだけです。 たとえばこんな感じです：

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

上に示したコマンドは仮想環境（基本的には一連のディレクトリとファイル）を含む`myvenv` という名前（あるいはあなたが選んだ名前）のディレクトリを生成します。次に我々がしたいのは、仮想環境を起動することです。

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

実行して、仮想環境を起動します。

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls > myvenv\Scripts\activate
    

> **補足：**Windows 10では、`execution of scripts is disabled on this system`というエラーがWindows PowerShellに出ることがあります。 その場合は、Windows PowerShellを「管理者として開く」で、管理者権限で新しくウィンドウを開いてください。 そして、仮想環境を起動する前に、以下のコマンドを入力してください。
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     

<!-- (This comment separates the two blockquote blocks, so that GitBook and Crowdin don't merge them into a single block.) -->

> **補足：** 人気のあるエディタであるVS Codeを使っている方は、VS CodeはWindows Powershellベースの統合ターミナルが一緒になっているので、統合ターミナルを使う場合、仮想環境を有効にするために下記のコマンドを実行してください：
> 
>     $ . myvenv\Scripts\activate.ps1
>     
> 
> エディタのウィンドウとコマンドラインのウィンドウを行き来する必要がなくなるのが利点です。

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and macOS" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

実行して、仮想環境を起動します。

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

`myvenv` のところを、あなたが選んだ `仮想環境(virtualenv)` の名前に置き換えることを忘れないで下さいね！

> **備考:** `source` ではできない場合もあります。その場合は、代わりに以下のように入力してみてください：
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

コンソールでプロンプトの行頭に `(myvenv)` が付いたら、`仮想環境(virtualenv)` を起動しています。

仮想環境の中で作業しているとき、`python` コマンドは自動的に正しいバージョンのPythonを参照するので、`python3` コマンドの代わりに `python` コマンドを使うことができます。

OK、これで依存関係の準備はすべて整いました。いよいよDjangoのインストールです！

## Djangoのインストール {#django}

今 `virtualenv` を起動したので、Djangoをインストールすることができます。

その前に、最新バージョンの `pip` がインストールされていることを確認すべきです。pipはDjangoのインストールに使うソフトウェアです。

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python -m pip install --upgrade pip
    

### requirementsファイルによってパッケージをインストールする

requirementsファイルは `pip install` でインストールする依存関係の一覧が記載されているファイルです：

インストールしたエディタを使って、最初に `requirements.txt` ファイルを `djangogirls/` フォルダの中に作ります。 エディタで新しいファイルを開いて、`djangogirls/` フォルダ内に `requirements.txt` という名前で保存してください。 ディレクトリはこんな感じになっているはずです：

    djangogirls
    ├── myvenv
    │   └── ...
    └───requirements.txt
    

`djangogirls/requirements.txt` ファイル中に以下のテキストを追加します：

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

> Windowsでpipを実行してエラーが起きた場合は、あなたのプロジェクトのパス名がスペースかアクセント記号か特殊文字を含んでいないか確認して下さい （例 `C:\Users\User Name\djangogirls`）。 もし含んでいる場合は、スペース・アクセント記号・特殊文字を含まない別の場所（`C:\djangogirls`をオススメします）でディレクトリを作成することを検討してみてください。 新しいディレクトリに新しい仮想環境を作成してから、古いディレクトリを削除して、上記のコマンドを試してください。 （仮想環境には絶対パスが使われているので、仮想環境のディレクトリを移動させてもうまくいきません。）

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Djangoをインストールしようとした後でコマンドラインがフリーズして動かなくなってしまうことがあります。その時は、以下のコマンドを代わりに入力してみてください。
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install -r requirements.txt
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> Ubuntu 12.04でpipを実行してエラーが起きた場合は、仮想環境内にpipを再インストールするために `python -m pip install -U --force-reinstall pip` を実行して下さい。

<!--endsec-->

以上です！あなたは（ついに）Djangoアプリケーションを作成する準備が整いました！