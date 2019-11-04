Chromebookを使わない場合は、このセクションを飛ばして、[Pythonのインストール](http://tutorial.djangogirls.org/en/installation/#install-python) に進んでください。 もし利用している場合は、普通のインストールの作業とは少し異なります。 インストール手順の残りの部分は無視できます。

### クラウドIDE (PaizaCloud Cloud IDE, AWS Cloud9)

クラウドIDEはコードエディタと、インターネットにつながって動作し、ソフトウェアをインストールしたり、書いたり、実行したりできるコンピュータへのアクセスを提供するツールです。 チュートリアルを通して、クラウドIDEはまるであなたの*ローカルマシン*のように動作するでしょう。 みんながOS XやUbuntuやWindowsでやるのと同じようにターミナルからコマンドを実行できますが、そのターミナルはクラウドIDEが準備したどこかのコンピュータに接続されています。 さて、いろいろなクラウドIDE（PaizaCloud Cloud IDE, AWS Cloud9）について見ていきましょう。 クラウドIDEのうちどれかを選んで、指示に従ってください。

#### PaizaCloud Cloud IDE

1. [PaizaCloud Cloud IDE](https://paiza.cloud/) へ移動します。
2. アカウントを登録します。
3. *新規サーバ作成* をクリックして、Djangoを選択してください。
4. （ウィンドウの左側にある）「ターミナル」をクリックします。

左側にサイドバーといくつかボタンのある画面が見えていると思います。 「ターミナル」ボタンをクリックして、下記のようなプロンプトが表示されたターミナルウィンドウを開いてください：

{% filename %}Terminal{% endfilename %}

    $
    

これでPaizaCloud Cloud IDEのターミナルは準備できました。 ウィンドウを大きくしたいときは、サイズを変えたり最大化したりできますよ。

#### AWS Cloud9

現在、Cloud 9 はAWSのアカウント作成とクレジットカード情報の登録が必須になっています。

1. [Chrome ウェブストア](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)から、Cloud 9 をインストールしてください。
2. [c9.io](https://c9.io)に行って、*AWS Cloud9をはじめる* をクリックしてください。
3. AWSアカウントを作成してください。（クレジットカード情報の登録が必要ですが、このチュートリアルは無料利用枠で進めることができます。）
4. AWSのダッシュボードを開き、検索ボックスで *Cloud9* と入力し選択してください。
5. Cloud9のダッシュボードで、*Create environment (環境の作成)* を選択します。
6. 名前は *django-girls* としておきましょう。
7. ”Configure settings (設定の構成)”のステップでは、”Environment Type (環境タイプ)”に *Create a new instance for environment (EC2) (新しいインスタンスを作成する (EC2))* を、”Instance type (インスタンスタイプ)”に *t2.micro* を選択します（"Free-tier eligible (無料利用枠で利用できる)" と書かれているはずです）。 ”Cost-saving setting (コスト削減の設定)”はデフォルトの選択のままにします。その他の設定もデフォルトにしておきましょう。
8. *Next step (次のステップ)* を選択します。
9. *Create environment (環境の作成)* を選択します。

サイドバー、文章が書かれた大きなメインウィンドウ、そして下部にはこのような小さなウィンドウが表示されています：

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

この下の部分が、あなたのターミナルです。このターミナルから、遠くにあるCloud 9のコンピュータに指示を送ることができます。ウィンドウのサイズを変更して少し大きくすることもできます。

### 仮想環境

仮想環境 (virtualenvとも呼ばれます) は、取り組んでいるプロジェクト用に、便利なコードを詰め込んでおけるプライベートボックスのようなものです。 様々なプロジェクトの様々なコードがプロジェクト間で混ざってしまわないように、仮想環境を使います。

以下を1行ずつ実行してください：

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

（最後の行は`~=`とチルダに続けてイコール記号をつけることに注意してください）

### GitHub

[GitHub](https://github.com)アカウントを作成してください。

### PythonAnywhere

Django Girls チュートリアルには、デプロイと呼ばれるセクションが含まれています。これはあなたの新しいWebアプリケーションの原動力となるコードを取得して、それを公にアクセス可能なコンピュータ（サーバーと呼ばれます）に移動するプロセスです。これにより、あなたの作ったものを他の人が見られるようになります。

Chromebookでチュートリアルを行うとき、（例えばラップトップとは対照的に）インターネットに接続されているコンピュータをすでに使用しているので、この作業は少し変な感じがします。 しかし、Cloud 9のワークスペースを「開発中」の場所、PythonAnywhere をより完成したものを披露する場所として考えると役に立ちます。

したがって、[www.pythonanywhere.com](https://www.pythonanywhere.com) へ行って、PythonAnywhereの新規アカウントを作成してください。