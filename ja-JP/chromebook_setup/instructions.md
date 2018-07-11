Chromebookをお持ちでない場合は、[このセクションをスキップ](http://tutorial.djangogirls.org/en/installation/#install-python) できます。 もしもっていなければ、普通のインストールの作業とは少し異なります。 インストール手順の残りの部分は無視できます。

### Cloud 9

クラウド 9 はコードエディタや、インストール、書き込み、およびソフトウェアを実行できるインターネット上で動いているコンピューターへのアクセスを与えるツールです。 チュートリアルをやっている間、Cloud 9はあなたの*ローカルマシーン*のように動きます。 クラスメートがOS XやUbuntu、Windowsでやっているのと同じようにターミナル上でコマンドを実行していても、あなたのターミナルはCloud 9がセットアップしたどこかのコンピューターにつながっています。

1. [Chrome ウェブストア](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)から Cloud 9 を インストールする
2. [C9.io](https://c9.io) に行く
3. アカウントにサインアップします
4. *作成新しいワークスペース*をクリック
5. 名前はdjango-girlsとします
6. *Blank*を選択(下の行の右側から 2 番目のオレンジ色のロゴ)

サイドバーとインターフェイス、大きなメインウィンドウ テキスト、下部に小さなウィンドウがあり、次のようになります。

{% filename %}Cloud 9{% endfilename %}

    yourusername:~/workspace $
    

この下部は *ターミナル*コンピューターを与えるがクラウド 9 があなたの指示を準備しています。それを少し大きくするウィンドウのサイズを変更できます。

### 仮想環境

仮想環境 (virtualenvとも呼ばれます) は取り組んでいるプロジェクトで役に立つコンピューターコードを詰め込んでおけるプライベートボックスのようなものです。 様々なプロジェクトの様々なコードがプロジェクト間で混ざってしまわないためにこれを使います。

クラウド 9 インターフェイスの端末下部で次を実行します。

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

それでも問題が解決しない場合は、コーチに相談してください。

次の実行

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~=1.11.0
    

(note that on the last line we use a tilde followed by an equal sign: ~=).

### GitHub

[GitHub](https://github.com)のアカウントを作成しましょう。

### PythonAnywhere

Django Girlsチュートリアルには、Deploymentと呼ばれるものに関するセクションが含まれています。 新しいWebアプリケーションを強化するコードを実行するプロセスです。 それを公開アクセス可能なコンピュータ（サーバーと呼ばれる）に移動して インターネット上で、あなたが作ったものを全ての人が見られるようにできます。

この部分は、Chromebookでチュートリアルを行うときに、インターネットに接続されているコンピュータ（ラップトップとは対照的に）を既に使用しているので少し奇妙です。 しかし、クラウド９のワークスペースを「進行中」の場所と考えることができます。またより安全な披露する場所としてPython Anywhere を使うことができます。

したがって、新しいPython Anywhereアカウントにサインアップしてください。 [ www.pythonanywhere.com ](https://www.pythonanywhere.com)