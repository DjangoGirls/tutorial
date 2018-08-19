Chromebookをお持ちでない場合は、[このセクションをスキップ](http://tutorial.djangogirls.org/en/installation/#install-python) できます。 もし利用している場合は、普通のインストールの作業とは少し異なります。 インストール手順の残りの部分は無視できます。

### Cloud 9

Cloud 9 はコードエディタや、インストール、書き込み、およびソフトウェアを実行できるインターネット上で動いているコンピューターへのアクセスを与えるツールです。 チュートリアルをやっている間、Cloud 9はあなたの*ローカルマシーン*のように動きます。 クラスメートがOS XやUbuntu、Windowsでやっているのと同じようにターミナル上でコマンドを実行していても、あなたのターミナルはCloud 9がセットアップしたどこかのコンピューターにつながっています。

1. [Chrome ウェブストア](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)から Cloud 9 を インストールする
2. [C9.io](https://c9.io) に行く
3. アカウントにサインアップします
4. *新しいワークスペースを作成*をクリック
5. 名前は*django-girls*とします
6. *Blank*を選択(下の行の右側から 2 番目のオレンジ色のロゴ)

インターフェイスには、サイドバー、テキストが書かれた大きなメインウィンドウ 、下部に小さなウィンドウがあり、次のように見えると思います。

{% filename %}Cloud 9{% endfilename %}

    yourusername:~/workspace $
    

この下部のエリアはあなたの*ターミナル*で、Cloud 9 があなたの指示を待っています。ウィンドウサイズを少し大きくすることもできます。

### 仮想環境

仮想環境 (virtualenvとも呼ばれます) は、取り組んでいるプロジェクト用に、便利なコンピューターコードを詰め込んでおけるプライベートボックスのようなものです。 様々なプロジェクトの様々なコードがプロジェクト間で混ざってしまわないようにこれを使います。

Cloud 9のインターフェイスのうち、下部のターミナルで次を実行します。

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

それでも問題が解決しない場合は、コーチに相談してください。

次に、以下を実行します：

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(最後の行はチルダに続けてイコール記号をつけることに気をつけてください: ~=)

### GitHub

[GitHub](https://github.com)のアカウントを作成しましょう。

### PythonAnywhere

Django Girlsチュートリアルには、デプロイメントと呼ばれるものに関するセクションが含まれています。 これはあなたの新しいWebアプリケーションの原動力となるコードを取得して、それをあなたのやったことを他の人が見ることができるように公にアクセス可能なコンピューター（サーバーと呼ばれます）に移動するプロセスです。

Chromebookでチュートリアルを行うとき、すでにインターネットに接続されているコンピュータ（ラップトップとは対照的に）を使用しているので、この作業は少し変に思えます。 しかし、Cloud 9のワークスペースを「開発中」の場所、PythonAnywhere をより完成したものを披露する場所として考えると役に立ちます。

したがって、新しいPythonAnywhereアカウントにサインアップしてください。 [ www.pythonanywhere.com ](https://www.pythonanywhere.com)